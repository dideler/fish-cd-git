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
            "    -h, --help      Prints this help" \
            "    -v, --version   Prints the gh version and license"

set -l version "gh version 1.0.0"

test "prints help when given -h option"
  $help = (gh -h)
end

test "prints help when given --help option"
  $help = (gh -h)
end

test "prints version when given -v option"
  $version = (gh -v)
end

test "prints version when given --version option"
  $version = (gh --version)
end

test "prints error and help when given invalid option"
  "Error: '--foo' is not a valid option" \
  "" \
  $help = (gh --foo)
end

test "prints error and help when given no arguments"
  "Error: gh expected 2 arguments, got 0" \
  "" \
  $help = (gh)
end

test "prints error and help when given too many arguments"
  "Error: gh expected 2 arguments, got 3" \
  "" \
  $help = (gh foo bar baz)
end
