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
