if not set --query GH_BASE_DIR
  set GH_BASE_DIR $HOME
end

function __gh_user_completion
  ls $GH_BASE_DIR/github.com
end

function __gh_repo_completion
  set --local cmd (commandline --tokenize --cut-at-cursor)
  set --local user $cmd[2]
  ls $GH_BASE_DIR/github.com/$user
end

complete --command gh --short h --long help --description 'Show help and usage information'
complete --command gh --condition '__fish_is_token_n 2' --arguments '(__gh_user_completion)' --no-files
complete --command gh --condition '__fish_is_token_n 3' --arguments '(__gh_repo_completion)' --no-files
