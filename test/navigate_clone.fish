set -l repo_path $HOME/github.com/gh_user/gh_repo

function teardown -S
  rm -rf (dirname $repo_path)
end

test "navigates to cloned project when given user repo"
  "$HOME/github.com/gh_user/gh_repo" = (
    # Quoting required due to fish test bug: https://github.com/fish-shell/fish-shell/issues/2342
    mock git 0 "test \"\$args\" = 'clone -q git@github.com:gh_user/gh_repo.git $repo_path'
                and mkdir -p $repo_path"
    gh gh_user gh_repo
    pwd
  )
end

test "navigates to cloned project when given user/repo"
  "$HOME/github.com/gh_user/gh_repo" = (
    mock git 0 "test \"\$args\" = 'clone -q git@github.com:gh_user/gh_repo.git $repo_path'
                and mkdir -p $repo_path"
    gh gh_user/gh_repo
    pwd
  )
end
