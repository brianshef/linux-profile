# linux-profile
Default shell profile data (based on RedHat/CentOS/Fedora), but intended for Mac OSX.

Thanks to @carlbennett for providing the dotfiles!

# Installation
- The dotfiles all go in the `$HOME` directory (`/Users/<yourname>/` on OSX).
- `.dir_colors` goes in `/etc/` directory.
- `scripts/` also goes in the `$HOME` directory.
- Be sure to update `.gitconfig` with your own user information!
- Be sure to update `.bashrc` aliases with your own GitHub aliases!


# Usage
Since the `scripts/` directory is added to the path, and some handy aliases are set up in `.bashrc`,
there are some nifty tricks that can be done.

## Scaffold New Bash Script

`script <SCRIPT_NAME>`

Creates a new executable script named `$HOME/scripts/<SCRIPT_NAME>.sh`,
that can now be executed simply with `<SCRIPT_NAME>.sh [ARGS ...]` (since `scripts/` is added to the path!)


## Go AFK

`afk`

Immediately locks the machine from the command line.


## SSH to DevOps Remote Machine

`devops`

Adds the appropriate SSH key to the session (password required, of course!) and then SSH's into the
remote DevOps machine once the key has been authenticated.


## Colorized Listings

`ls`

By default, the `ls` command now provides colorized output.
