cask "pip" do
  version "0.1.3"
  sha256 "1fea6ce3e07c2b5e6c7c9205415a6e8e8a03caa0a53d8331a653702550db12a3"

  url "https://github.com/newtrn/pip/releases/download/v#{version}/Pip-#{version}.zip"
  name "Pip"
  desc "Menu bar mascot that watches your Claude Code, Codex and AI API usage"
  homepage "https://github.com/newtrn/pip"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Pip.app"

  uninstall quit: "dev.pip.Pip"

  zap trash: "~/Library/Preferences/dev.pip.Pip.plist"

  caveats <<~EOS
    Pip isn't notarized by Apple yet. The first time you open it, macOS says it
    can't verify the developer: open System Settings → Privacy & Security and
    click Open Anyway. You only need to do this once.

    Pip lives in the menu bar and has no Dock icon.
  EOS
end
