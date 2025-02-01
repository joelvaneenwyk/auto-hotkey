# AutoHotkey

![AutoHotkey Logo with the three letters "A", "H", and "K"](docs/ahk_logo_no_text.svg)

`AutoHotkey` is a free, open source macro-creation and automation software utility that allows users to automate repetitive tasks. It is driven by a custom scripting language that has special provision for defining keyboard shortcuts, otherwise known as hotkeys.

> <https://www.autohotkey.com/>

## Overview

### Key Binds

Define hotkeys for the mouse and keyboard, remap keys or buttons and autocorrect-like replacements. Creating simple hotkeys has never been easier; you can do it in just a few lines or less!

### What is AutoHotkey?

AutoHotkey is a free, open-source scripting language for Windows that allows users to easily create small to complex scripts for all kinds of tasks such as: form fillers, auto-clicking, macros, etc.

### Is it good for me?

AutoHotkey has easy to learn built-in commands for beginners. Experienced developers will love this full-fledged scripting language for fast prototyping and small projects.

### Why AutoHotkey?

AutoHotkey gives you the freedom to automate any desktop task. It's small, fast and runs out-of-the-box. Best of all, it's free, open-source (GNU GPLv2), and beginner-friendly. Why not give it a try?

## How to Compile

`AutoHotkey` is developed with [Microsoft Visual Studio Community 2022](https://www.visualstudio.com/products/visual-studio-community-vs), which is a free download from Microsoft.

1. Get the source code.
2. Open `AutoHotkeyx.sln` in Visual Studio.
3. Select the appropriate `Build` and `Platform`.
4. Run Build.

The project is configured in a way that allows building with Visual Studio 2012 or later, but only the 2022 toolset is regularly tested. Some newer C++ language features are used and therefore a later version of the compiler might be required.

## Developing in VS Code

AutoHotkey v2 can also be built and debugged in VS Code.

Requirements:

- [C/C++ for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools). VS Code might prompt you to install this if you open a .cpp file.
- [Build Tools for Visual Studio 2022](https://aka.ms/vs/17/release/vs_BuildTools.exe) with the "Desktop development with C++" workload, or similar (some older or newer versions and different products should work).

## Build Configurations

`AutoHotkeyx.vcxproj` contains several combinations of build configurations. The main configurations are:

- **Debug**: AutoHotkey.exe in debug mode.
- **Release**: AutoHotkey.exe for general use.
- **Self-contained**: AutoHotkeySC.bin, used for compiled scripts.

Secondary configurations are:

- `(mbcs)`: ANSI (multibyte character set). Configurations without this suffix are Unicode.
- `.dll`: Builds an experimental dll for use hosting the interpreter, such as to enable the use of v1 libraries in a v2 script. See [AutoHotkey dynamic library](docs/ahk-library.md) for more details.

## Platforms

`AutoHotkeyx.vcxproj` includes the following Platforms:

- `Win32`: for 32-bit Windows.
- `x64`: for 64-bit Windows.

AutoHotkey supports Windows XP with or without service packs and Windows 2000 via an asm patch (`win2kcompat.asm`). Support may be removed if maintaining it becomes non-trivial. Older versions are not supported.
