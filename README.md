# Homebrew tap texstudio-beta

Due to too few downloads, on 5 May 2020, cask `texstudio-beta` (2.12.22beta2) was [removed] from [`homebrew-cask-version`][homebrew-cask-version], the official repo for pre-release casks. 

So there is this homebrew tap.

## Installation

  - `brew install muzimuzhi/texstudio-beta/<formula>`
  - or `brew tap muzimuzhi/texstudio-beta` and then `brew install <formula>`.

Note: `texstudio-beta` conflicts with `texstudio`, so you may need to run `brew cask uninstall texstudio` before installing `texstudio-beta`.

## Upgrade

Upgrade cask file `texstudio-beta.rb`: 
  - (clone this repo)
  - update `version` stanzas
  - update `sha256` stanzas obtained from `shasum -a 256 <downloaded .dmg file>`
  - (open a pull request)

Upgrade installed `texstudio-beta` software:
  - `brew cask upgrade muzimuzhi/texstudio-beta/texstudio-beta`

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
