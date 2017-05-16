# fish-cd-git

Git repo navigator, inspired by https://github.com/dickeyxxx/gh

Install with [fisherman](https://github.com/fisherman/fisherman)
```
fisher install dideler/fish-cd-git
```

Set your preferred base directory (default is `$HOME/src`), e.g.
```
set --erase GH_BASE_DIR
set --universal --export GH_BASE_DIR $HOME
```

Navigate to a repository (will clone if missing):
```
gh dideler fish-cd-git
```
