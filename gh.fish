if not set --query GH_BASE_DIR
  set GH_BASE_DIR $HOME/src
end

function __gh_print_usage
  printf "Usage: $_ [--help] USER REPO\n\n"
  printf "Description:\n"
  printf "    Quickly navigate across git repositories cloned from GitHub.\n"
  printf "    Searches within $GH_BASE_DIR/github.com/. Clones repo if not found.\n\n"
  printf "Examples:\n"
  printf "    $_ dideler fish-cd-git\n"
end

function gh -d "Navigate to cloned repos from github.com" -a user repo
  set -l argc (count $argv)

  if contains -- -h $argv; or contains -- --help $argv
    __gh_print_usage
    return 0
  else if test $argc -eq 1  # Attempt to autocorrect "user/repo" input.
    set --local user_repo (__gh_parse_args $user)
    set user $user_repo[1]
    set repo $user_repo[2]
  else if test $argc -ne 2
    printf "Error: %s expected 2 arguments, got %d\n\n" $_ $argc
    __gh_print_usage
    return 1
  end

  __gh_cd_git_repo github.com $user $repo
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
