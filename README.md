# Homebrew tap texstudio-beta

Due to too few downloads, on 5 May 2020, cask `texstudio-beta` (2.12.22beta2) was [removed] from [`homebrew-cask-version`][homebrew-cask-version], the official repo for pre-release casks. 

So there is this homebrew tap.

## Installation

  - `brew install muzimuzhi/texstudio-beta/texstudio-beta`
  - or `brew tap muzimuzhi/texstudio-beta` and then `brew install texstudio-beta`.

Note: `texstudio-beta` conflicts with `texstudio`, so you may need to run `brew uninstall texstudio` before installing `texstudio-beta`.

## Upgrading a formula

Run ([doc](https://docs.brew.sh/Manpage#bump-cask-pr-options-cask))
```bash
brew bump-formula-pr muzimuzhi/texstudio-beta/<formula> --version=<version>
```

Or, through manual steps:

- Update version
- Open a PR
- After checks check, label PR with `pr-pull` label
- @github-actions bot will update bottles then merge commits in PR

See [Homebrew tap with bottles uploaded to GitHub Releases][tap-with-bottles]

[tap-with-bottles]: https://brew.sh/2020/11/18/homebrew-tap-with-bottles-uploaded-to-github-releases/

## Upgrading a cask

Run ([doc](https://docs.brew.sh/Manpage#bump-formula-pr-options-formula))
```bash
brew bump-cask-pr muzimuzhi/texstudio-beta/<cask> --version=<version>
```

Or, through manual steps:

Upgrade cask file `texstudio-beta.rb`:
  - (clone this repo)
  - update `version` stanzas
  - update `sha256` stanzas obtained from `shasum -a 256 <downloaded .dmg file>`
  - [verify upgrade][verify-cask-upgrade] by `brew audit --cask </path/to/cask-file>` and `brew style --fix </path/to/cask-file>`
  - (open a pull request)

Upgrade installed `texstudio-beta` cask:
  - `brew update && brew upgrade texstudio-beta`

## Useful links

 - TeXstudio’s [release page]
 - [_Explained cask stanzas_][cask stanzas] and [_Rules for commit messages_][commit message], Homebrew Cask Documentation
 - [_How to Create and Maintain a Tap_][tap], Homebrew Documentation

[removed]: 
    https://github.com/Homebrew/homebrew-cask-versions/commit/4f03b850c8ca7407b42490a3a53c1c215ebc6d5d
[homebrew-cask-version]: 
    https://github.com/Homebrew/homebrew-cask-versions
[release page]: 
    https://github.com/texstudio-org/texstudio/releases/
[cask stanzas]: 
    https://github.com/Homebrew/homebrew-cask/blob/master/doc/development/adding_a_cask.md#cask-stanzas
[commit message]: 
    https://github.com/Homebrew/homebrew-cask/blob/master/doc/development/adding_a_cask.md#commit-messages
[tap]: 
    https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap
[verify-cask-upgrade]:
    https://github.com/Homebrew/homebrew-cask/blob/master/.github/PULL_REQUEST_TEMPLATE.md
