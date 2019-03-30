# GitUtils

This repo contains a list of Bash scripts to speed up your productivity.

## Setup

If you wish to use this repo you need to clone/fork it and then open MINGW64 console (if you're on Windows) 
or execute directly this commands in your terminal/console environment.

- `cd <repo path>`
- `bash setup.sh`

At execution, `setup.sh` will request you to specify a path. This path must be a folder path where your collection
of projects are located.

Then, this will ask you if you want to create some [git aliases](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases)
if you agree to do that, your `.gitconfig` file will be modified with all the aliases from this repo.

For each Bash script an aliase with the same name will be created. Ie: `git reclone` or `git multipush`.

Also, you can call this aliase with an argument (the first argument will specify the working path), ie: `git multipush <folder path to do what multipush does>` 

## Scripts

In this section, we will explain what this scripts do:

 - `multipush.sh` - This tool lets you push to different repos/folders (NOT remotes) at once. 
 - `reclone.sh` - This tool lets you re-clone all the repos in a folder.

```
An example of possible case of use could be the following. Imagine you modified ".gitconfig"'s "autocflr" property
because when you commit files in your enviroment every singleline is appended with a "^M" character at its end.

Saving the unstaged changes and then by using this tool you can easily reclone all the folders you need.  
```

## Issues

Having issues? Just report in [the issue section](/issues). **Thanks for the feedback!**

## Contribute

Fork this repository, make your changes and then issue a pull request. If you find bugs or have new ideas that you do not want to implement yourself, file a bug report.

## Donate

Become a patron, by simply clicking on this button (**very appreciated!**):

[![](https://c5.patreon.com/external/logo/become_a_patron_button.png)](https://www.patreon.com/z3nth10n)

... Or if you prefer a one-time donation:

[![](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://paypal.me/z3nth10n)

## Copyright

Copyright (c) 2019 z3nth10n (United Teamwork Association).

License: GNU General Public License v3.0
