# Dotfiles

**My personal dotfiles, ready to be [stowed](https://www.gnu.org/software/stow/).**

![Screenshot](screenshot.png)

## Setup

The dotfiles are separated into directories—one for each program.
That way, they are neatly organized, and it is also possible to
[use GNU Stow to create symlinks quickly](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).

```bash
git clone 'https://github.com/BojanStipic/dotfiles' ~/.dotfiles
cd ~/.dotfiles
… # Review and modify all the files you want to use
stow --no-folding -v */ # Trailing slash is important to expand only directories
```

**WARNING:** Don't blindly use these dotfiles without carefully reviewing each file.
These dotfiles are created specifically for my own use and can contain stuff you don't want.
Use at your own risk!

## Additional setup

### atom

Install packages:

```bash
apm install --packages-file ~/.atom/my-packages.txt
```

### cmus

Import your music collection:

1. Switch to view (5) Directory browser.
2. Navigate to your music directory.
3. Press `a` to import music to the library.

### git

Set your username and email address:

```bash
git config --global user.name 'username'
git config --global user.email 'email'
```
