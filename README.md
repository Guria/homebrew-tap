# Guria Homebrew tap

This directory is a starter Homebrew tap for publishing Nehir and future Guria apps/tools.

Recommended public repository name: `guria/homebrew-tap`. With that name, users can install Nehir with:

```bash
brew tap guria/tap
brew install --cask nehir
```

Or without tapping first:

```bash
brew install --cask guria/tap/nehir
```

Preview releases are published as the RC cask:

```bash
brew install --cask guria/tap/nehir@rc
```

## Release checklist

From the main `guria/nehir` source repository:

```bash
# Unsigned local release artifact for now
Scripts/package-app.sh release false

# The script prints the SHA-256 for dist/Nehir-<version>.zip
```

Create a GitHub release in `guria/nehir`:

- tag: `v<version>` (for example, `v0.1.0`)
- asset: `dist/Nehir-<version>.zip`
- source archive: GitHub automatically provides this, satisfying source availability alongside the GPL-2.0-only license

Then update `Casks/nehir.rb` in the tap repo:

1. Set `version` to the release version.
2. Replace `sha256 :no_check` with the printed SHA-256:

   ```ruby
   sha256 "<64-character-sha256>"
   ```

3. Run local checks:

   ```bash
   ruby -c Casks/nehir.rb
   brew audit --cask --tap=guria/tap nehir
   brew install --cask --verbose ./Casks/nehir.rb
   ```

## Apple signing status

The starter packaging flow supports unsigned releases because no Apple Developer ID identity is configured yet. For a smoother public cask experience, later run packaging with:

```bash
SIGNING_IDENTITY="Developer ID Application: Your Name (TEAMID)" \
NOTARIZE_PROFILE="Nehir-Notarize" \
Scripts/package-app.sh release true
```

The app bundle identifier is `dev.guria.nehir`.
