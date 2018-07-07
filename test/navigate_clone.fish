set --local repo_path $HOME/github.com/gh_user/gh_repo
set --local expected_clone_pattern "*git clone* git@github.com:gh_user/gh_repo.git $repo_path"

function teardown --no-scope-shadowing
  rm -rf (dirname $repo_path)
end

test "navigates to cloned project when given user repo"
  "$HOME/github.com/gh_user/gh_repo" = (
    mock spin 0 "string match --quiet -- '$expected_clone_pattern' \$args
                 and mkdir -p $repo_path"
    gh gh_user gh_repo
    pwd
  )
end

test "navigates to cloned project when given user/repo"
  "$HOME/github.com/gh_user/gh_repo" = (
    mock spin 0 "string match --quiet -- '$expected_clone_pattern' \$args
                 and mkdir -p $repo_path"
    gh gh_user/gh_repo
    pwd
  )
end
