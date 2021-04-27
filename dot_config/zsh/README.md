
## Ubuntu

### Aliases
Commands that use `$APT` will use `apt` if installed or defer to `apt-get` otherwise.

| Alias   | Command                                                                  | Description                                                                                       |
|---------|--------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| aga     | `sudo $APT autoclean`                                                    | Clears out the local reposityory of retrieved package files that can no longer be downloaded      |
| agc     | `sudo $APT clean`                                                        | Clears out the local repository of retrieved package files leaving everything from the lock files |
| agi     | `sudo $APT install <pkg>`                                                | Install the specified package                                                                     |
| agli    | `apt list --installed`                                                   | List the installed packages                                                                       |
| agp     | `sudo $APT purge <pkg>`                                                  | Remove a package including any configuration files                                                |
| agr     | `sudo $APT remove <pkg>`                                                 | Remove a package                                                                                  |
| agu     | `sudo $APT update`                                                       | Update package list                                                                               |
| agug    | `sudo $APT upgrade`                                                      | Upgrade available packages                                                                        |
| agar    | `sudo $APT autoremove`                                                   | Remove automatically installed packages no longer needed                                          |
| aguu    | `sudo $APT update && sudo $APT upgrade`                                  | Update packages list and upgrade available packages                                               |
| allpkgs | `dpkg --get-selections \| grep -v deinstall`                             | Print all installed packages                                                                      |
| kclean  | `sudo aptitude remove -P ?and(~i~nlinux-(ima\|hea) ?not(~n$(uname -r)))` |Remove ALL kernel images and headers EXCEPT the one in use                                         |


### Functions

| Function          | Usage                                 |Description                                                               |
|-------------------|---------------------------------------|--------------------------------------------------------------------------|
| apt-list-packages | `apt-list-packages`                   | List packages by size                                                    |
