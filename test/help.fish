set -l help "Usage: gh [OPTION] USER REPO" \
            "" \
            "Description:" \
            "    Quickly navigate across git repositories cloned from GitHub." \
            "    Searches within $HOME/github.com/. Clones repo if not found." \
            "" \
            "Examples:" \
            "    gh dideler fish-cd-git" \
            "" \
            "Options:" \
            "    -h, --help      Prints help information" \
            "    -v, --version   Prints the gh version"

test "prints help when given -h option"
  $help = (gh -h)
end

test "prints help when given --help option"
  $help = (gh -h)
end

test "prints version when given -v option"
  (string match --regex 'gh version \d.\d.\d' (gh -v)) = (gh -v)
end

test "prints version when given --version option"
  (string match --regex 'gh version \d.\d.\d' (gh -v)) = (gh --version)
end

test "prints error and help to stderr when given invalid option"
  "Error: '--foo' is not a valid option" \
  "" \
  $help = (gh --foo 2>&1)
end

test "prints error and help to stderr when given no arguments"
  "Error: gh expected 2 arguments, got 0" \
  "" \
  $help = (gh 2>&1)
end

test "prints error and help to stderr when given too many arguments"
  "Error: gh expected 2 arguments, got 3" \
  "" \
  $help = (gh foo bar baz 2>&1)
end

test "exits with status code 1 on option error"
  1 = (gh --foo ^/dev/null; echo $status)
end

test "exits with status code 1 on argument error"
  1 = (gh ^/dev/null; echo $status)
end
