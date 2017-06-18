set -l repo_path $HOME/github.com/gh_user/gh_repo

function setup -S
  mkdir -p $repo_path
end

function teardown -S
  rm -rf (dirname $repo_path)
end

test "navigates to existing directory when given user repo"
  (
    gh gh_user gh_repo
    pwd
  ) = "$HOME/github.com/gh_user/gh_repo"
end

test "navigates to existing directory when given user/repo"
  (
    gh gh_user/gh_repo
    pwd
  ) = "$HOME/github.com/gh_user/gh_repo"
end

test "navigates to existing directory when given user"
  (
    gh gh_user
    pwd
  ) = "$HOME/github.com/gh_user"
end
