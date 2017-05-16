# fish-cd-git

A super handy repository navigator for the [fish shell][].

- Keeps code neatly organised under the same namespace as GitHub's
  (e.g. github.com/user/repo)

- Quickly jump between repos with auto-completion

- Auto-clones the repo for you if it's missing

- Inspired by https://github.com/dickeyxxx/gh

## Quick start

Install with your favourite fish package manager, such as [fisherman][]
```
fisher install dideler/fish-cd-git
```

Optional: Set your preferred location to store projects (default is `$HOME/src`)
```
set --erase GH_BASE_DIR
set --universal --export GH_BASE_DIR $HOME
```

Navigate to any GitHub-hosted repository :sparkles:
```
gh dideler dotfiles
```

[fish shell]: https://fishshell.com/
[fisherman]: https://github.com/fisherman/fisherman
