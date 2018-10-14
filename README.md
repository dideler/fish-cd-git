# fish-cd-git [![CircleCI](https://circleci.com/gh/dideler/fish-cd-git.svg?style=svg)](https://circleci.com/gh/dideler/fish-cd-git)

A super handy repository navigator for the [fish shell][].

- Keeps code neatly organised under the same namespace as GitHub's
  (i.e. github.com/user/repo)

- Quickly jump between repos with auto-completion

- Auto-clones the repo for you if it's missing

- Inspired by https://github.com/dickeyxxx/gh

## Demo

![Example usage of fish-cd-git](https://user-images.githubusercontent.com/497458/42415491-4240ed94-8248-11e8-8ad3-ba19b01d626d.gif)

## Quick start

Install with your favourite fish package manager, such as [fisherman][] or [oh-my-fish][omf]
```fish
# Install with fisher v3
fisher add dideler/fish-cd-git

# Install with fisher v2
fisher install dideler/fish-cd-git

# Install with oh-my-fish
omf install https://github.com/dideler/fish-cd-git
```

**Optional:** Set your preferred location for the `github.com` directory (default is `$HOME`)  
For example, to use `~/src/github.com` instead of `~/github.com`
```fish
set --erase GH_BASE_DIR
set --universal GH_BASE_DIR $HOME/src
```

Navigate to any GitHub-hosted repository :sparkles:
```fish
gh dideler dotfiles
```

[fish shell]: https://fishshell.com/
[fisherman]: https://github.com/fisherman/fisherman
[omf]: https://github.com/oh-my-fish/oh-my-fish