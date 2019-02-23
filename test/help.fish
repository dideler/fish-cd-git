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

@test "prints help when given -h option" (gh -h) = $help

@test "prints help when given --help option" (gh --help) = $help

@test "prints version when given -v option" (
  gh -v
) = (string match --regex 'gh version \d.\d.\d' (gh -v))

@test "prints version when given --version option" (
  gh --version
) = (string match --regex 'gh version \d.\d.\d' (gh --version))

@test "prints error and help to stderr when given invalid option" (
  gh --foo 2>&1
) = "Error: '--foo' is not a valid option" \
    "" \
    $help

@test "prints error and help to stderr when given no arguments" (
  gh 2>&1
) = "Error: gh expected 2 arguments, got 0" \
    "" \
    $help

@test "prints error and help to stderr when given too many arguments" (
  gh foo bar baz 2>&1
) = "Error: gh expected 2 arguments, got 3" \
    "" \
    $help

@test "exits with status code 1 on option error" (
  gh --foo ^/dev/null
) $status -eq 1

@test "exits with status code 1 on argument error" (
  gh ^/dev/null
) $status -eq 1
