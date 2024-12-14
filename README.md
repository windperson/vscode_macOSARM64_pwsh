# Portable VSCode PowerShell development environment

This is a portable development environment for PowerShell using [Visual Studio Code Portable Mode](https://code.visualstudio.com/docs/editor/portable), so the User can use it without installing VSCode and .NET SDK.

The benefit to use this portable development environment is providing a cleaner PowerShell environment for TDD(Test Driven Development), It will not be affected by host machine system level PowerShell module, and by using a open-sourced [ModuleFast](https://github.com/JustinGrote/ModuleFast) to install PowerShell modules, the testing modules will not pollute User computer.

## Pre-requisites

- macOS M serices chip machine (ARM64)
- Download the portable (*.tar.gz) distribution from the release page:
  - [VSCode portable](https://code.visualstudio.com/Download)
  - [Install PowerShell v7.4.x via Homebrew or Direct Download](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-macos?view=powershell-7.4#install-the-latest-stable-release-of-powershell)  
    (Since the binary distribution of PowerShell has problem to be set as default shell in VSCode)
  - [.NET v8.x SDK x64 zip](https://dotnet.microsoft.com/download/dotnet/8.0)
  - (Optional) [NeoVim macOS .tar.gz](https://github.com/neovim/neovim/releases/tag/v0.10.2), If you want to use Vim extension in VSCode.
- Extract or copy the binary distribution file to the desired location:
  - VSCode to **Visual Studio Code.app** folder.
  - .NET SDK to **cli-tools\dotnet\sdks\8.0** folder, and add this folder's absolute path to the `PATH` environment variable(either User Level or System Level are fine).
  - (Optional) Neovim to **cli-tools\nvim-macos-arm64** folder, and [install *im-select* via Homebrew](https://github.com/daipeihust/im-select?tab=readme-ov-file#homebrew) if you want to use Vim extension in VSCode.
- Download latest [PowerShell for Visual Studio Code extension install file(*.vsix*)](https://github.com/PowerShell/vscode-powershell/releases/)
- Download [**.NET Install Tool**](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.vscode-dotnet-runtime).
- Download [**C# for Visual Studio Code** macOS ARM64 version](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp)
- (Optional) Download [Vim Visual Studio Code extension install file(*.vsix*)](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim) if you want to use Vim extension in VSCode.
- Download [ModuleFast v0.5.0 zip](https://github.com/JustinGrote/ModuleFast/releases/tag/v0.5.0) PowerShell module and extract to **pwsh_modules\ModuleFast\0.5.0** folder.

## Modify settings.json before first run

The configuration file is at  **code-porable-data/user-data/User/settings.json**, open it with a text editor and modify all absolute/relative path value (default written setting is suppose this folder being placed at `~/vscode_portable`) to match the actual path in your computer.

Optional:  
If you want to use Vim extension, be sure to un-comment and update the related setting below `// Vim extension settings`.

## Start VSCode

Run the `run.sh` to start the portable VSCode application instance (You will notice two seperate VSCode app icon on [the Dock](https://support.apple.com/guide/mac-help/open-apps-from-the-dock-mh35859/mac) ), and install the *PowerShell*, *.NET Install Tool*, *C# for Visual Studio Code*, and (Optional) *Vim* extensions from the ***.vsix*** files that download before.  
([how to install VSCode extension from ***.vsix*** file](https://code.visualstudio.com/docs/editor/extension-marketplace#_install-from-a-vsix).)

## How to install PowerShell modules

This portable development environment has configure the **pwsh_modules** folder to be the first PowerShell module probing path, so we can use `Install-ModuleFast` cmdlet of [ModuleFast](https://github.com/JustinGrote/ModuleFast) to install PowerShell modules to **pwsh_modules** folder without polluting the host machine.

For example, to install [dumPS](https://github.com/deadlydog/PowerShell.dumPS) PowerShell module from PowerShell Gallery, in Integrated Terminal of VSCode, run:

```powershell
Install-ModuleFast -Name dumPS -Destination D:\vscode_portable\pwsh_modules
```

To install test framework [Pester](https://pester.dev/) from nuget.org and specify to install version v5.6.1 , in Integrated Terminal of VSCode, run:

```powershell
 @{ModuleName='Pester';ModuleVersion='5.6.1'} | Install-ModuleFast -Source api.nuget.org/v3 -Destination D:\vscode_portable\pwsh_modules
```

so the Pester module will be installed to `pwsh_modules\Pester\5.6.1` folder, and ready for using in this portable development environment.
