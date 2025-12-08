# Deps

repos:

* [vimconfig](https://github.com/okayno14/vimconfig)

apps:

* go (harrisoncramer/gitlab.nvim)

# package

## add new package

```bash
mkdir -p .config/nvim/pack/<org>/start
git submodule add <git-url> .config/nvim/pack/<org>/start/<pack>
```

## pull all

```bash
git submodule update --init --recursive
```

## remove

```bash
# Remove the submodule entry from .git/config
git submodule deinit -f .config/nvim/pack/<org>/start/<pack>

# Remove the submodule directory from the superproject's .git/modules directory
rm -rf .git/modules/.config/nvim/pack/<org>/start/<pack>

# Remove the entry in .gitmodules and remove the submodule directory located at path/to/submodule
git rm -f .config/nvim/pack/<org>/start/<pack>
```


