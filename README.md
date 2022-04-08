# More hooks for git by Capsules Codes

## Description
This zsh plugin overload the git command to expose more hooks.
the main git binary doesn't expose hooks for the commands that don't modify anything.
This plugin give you that ability for the following commands : `add`, `status`, `diff`.

## Installation via ZSH [Oh-My-Zsh](http://ohmyz.sh/)

1. Run: `git clone https://github.com/capsulescodes/more-hooks-for-git.git $ZSH_CUSTOM/plugins/more-hooks-for-git`
2. Add `more-hooks-for-git` to your plugin list: edit `~/.zshrc` and change
   `plugins=(...)` to `plugins=(... more-hooks-for-git)`

## Updating via ZSH [Oh-My-Zsh](http://ohmyz.sh/)

```sh
cd $ZSH_CUSTOM/plugins/more-hooks-for-git
git fetch
git pull
```

-----
This plugin is MIT licensed to match the more-hooks-for-git license.
