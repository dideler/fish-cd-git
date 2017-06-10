function __gh_setup
  set --query _; and set --global gh_cmd_name $_
  or set --global gh_cmd_name (basename (status --current-filename) .fish)

  set --query GH_BASE_DIR
  or set --universal GH_BASE_DIR $HOME

  set --global gh_version "1.0.0"
end

function __gh_print_usage
  printf "Usage: $gh_cmd_name [OPTION] USER REPO\n\n"
  printf "Description:\n"
  printf "    Quickly navigate across git repositories cloned from GitHub.\n"
  printf "    Searches within $GH_BASE_DIR/github.com/. Clones repo if not found.\n\n"
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

function $gh_cmd_name -d "Navigate to cloned repos from github.com" -a user repo
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

  # TODO: navigate to repo
end

function __gh_cd_git_repo --argument git_host user repo
  set -l path $GH_BASE_DIR/$git_host/$user/$repo

  __gh_clone_repo_if_missing $path $git_host $user $repo
  and cd $path
end

function __gh_clone_repo_if_missing --argument path git_host user repo
  test -d $path; or command git clone -q git@$git_host:$user/$repo.git $path
end

function __gh_parse_args --argument user_repo
  string split --max=1 / (string trim --char=/ $user_repo)
end
