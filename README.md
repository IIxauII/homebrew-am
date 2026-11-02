# Homebrew tap for am

[am](https://github.com/IIxauII/am): Apple Music in the terminal.

```bash
brew install IIxauII/am/am
```

Or `brew tap IIxauII/am` and then `brew install am`. In a `Brewfile`:

```ruby
tap "IIxauII/am"
brew "am"
```

Needs macOS 15 or later, or Linux. am plays through headless Firefox or Google Chrome, so one of
them must be installed (`brew install --cask firefox` on macOS).

The formula builds am from its release tag's source; the tap's CI builds bottles for macOS on
Apple silicon and for x86_64 Linux. Releasing a new version:
[docs/releasing.md](https://github.com/IIxauII/am/blob/main/docs/releasing.md) in the am repo.
