# TODO: set common vars top-level or top-level gh func
#       and use function -S/--no-scope-shadowing to inherit vars
#       instead of making them global or parameters
function __gh_setup
  set --query GH_BASE_DIR
  or set --universal GH_BASE_DIR $HOME

  set --global gh_cmd_name (basename (status --current-filename) .fish)
  set --global gh_version "1.0.3"
  set --global gh_git_host github.com
end

function __gh_print_usage
  printf "Usage: $gh_cmd_name [OPTION] USER REPO\n\n"
  printf "Description:\n"
  printf "    Quickly navigate across git repositories cloned from GitHub.\n"
  printf "    Searches within $GH_BASE_DIR/$gh_git_host/. Clones repo if not found.\n\n"
  printf "Examples:\n"
  printf "    $gh_cmd_name dideler fish-cd-git\n\n"
  printf "Options:\n"
  printf "    -h, --help      Prints help information\n"
  printf "    -v, --version   Prints the $gh_cmd_name version\n"
end

function __gh_print_version
  echo "$gh_cmd_name version $gh_version"
end

__gh_setup

function $gh_cmd_name -d "Navigate to cloned repos from $gh_git_host" -a user repo
  set --local argc (count $argv)

  if test $argc -lt 1 -o $argc -gt 2
    printf "Error: %s expected 2 arguments, got %d\n\n" $gh_cmd_name $argc 1>&2
    __gh_print_usage 1>&2
    return 1
  end

  switch $argv[1]
    case '-h' '--help'
      __gh_print_usage
      return 0

    case '-v' '--version'
      __gh_print_version
      return 0

    case '-*'
      printf "Error: '%s' is not a valid option\n\n" $argv[1] 1>&2
      __gh_print_usage 1>&2
      return 1
  end

  if test $argc -eq 1
    set --local user_repo (__gh_autocorrect_user_repo $user)
    and __gh_cd_git_repo $gh_git_host $user_repo[1] $user_repo[2]
    or cd $GH_BASE_DIR/$gh_git_host/$user
  else
    __gh_cd_git_repo $gh_git_host $user $repo
  end
end

function __gh_cd_git_repo --argument git_host user repo
  set -l path $GH_BASE_DIR/$git_host/$user/$repo

  __gh_clone_repo_if_missing $path $git_host $user $repo
  and cd $path
end

function __gh_clone_repo_if_missing --argument path git_host user repo
  # TODO: `command git` once we can test it: https://github.com/fisherman/mock/issues/4
  test -d $path; or git clone -q git@$git_host:$user/$repo.git $path
end

# Returns "user" "repo" list when given " user/repo " as input.
function __gh_autocorrect_user_repo --argument user_repo
  set --local captures (string match -r "(.+)/(.+)" (string trim $user_repo))
  and echo $captures[2]
  and echo $captures[3]
end

function __gh_parse_args --argument user_repo
  string split --max=1 / (string trim --char=/ $user_repo)
end
