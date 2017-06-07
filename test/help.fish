test "prints help when given -h option"
  "Usage: gh [--help] USER REPO" \
  "" \
  "Description:" \
  "    Quickly navigate across git repositories cloned from GitHub." \
  "    Searches within $HOME/github.com/. Clones repo if not found." \
  "" \
  "Examples:" \
  "    gh dideler fish-cd-git" = (gh -h)
end

test "prints help when given --help option"
  "Usage: gh [--help] USER REPO" \
  "" \
  "Description:" \
  "    Quickly navigate across git repositories cloned from GitHub." \
  "    Searches within $HOME/github.com/. Clones repo if not found." \
  "" \
  "Examples:" \
  "    gh dideler fish-cd-git" = (gh -h)
end

test "prints error and help when given no arguments"
  "Error: gh expected 2 arguments, got 0" \
  "" \
  "Usage: gh [--help] USER REPO" \
  "" \
  "Description:" \
  "    Quickly navigate across git repositories cloned from GitHub." \
  "    Searches within $HOME/github.com/. Clones repo if not found." \
  "" \
  "Examples:" \
  "    gh dideler fish-cd-git" = (gh)
end

test "prints error and help when given too many arguments"
  "Error: gh expected 2 arguments, got 3" \
  "" \
  "Usage: gh [--help] USER REPO" \
  "" \
  "Description:" \
  "    Quickly navigate across git repositories cloned from GitHub." \
  "    Searches within $HOME/github.com/. Clones repo if not found." \
  "" \
  "Examples:" \
  "    gh dideler fish-cd-git" = (gh foo bar baz)
end
