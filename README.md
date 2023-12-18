<!-- <img width="100%" src="docs/preview.svg" /> -->

# std.sh
<!-- Use badges from https://shields.io/badges/ -->
[![PayPal](https://img.shields.io/badge/-PayPal-880088?style=flat-square&logo=pay&logoColor=white&label=DONATE)](https://www.paypal.me/biteofpie)
[![License](https://img.shields.io/badge/NONE-007744?style=flat-square&label=LICENSE)]()
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)

> _Another standard library for shell (bash/zsh) with cross-shell support_

## OVERVIEW

The `std.sh` provides various sourceable cross-shell scripts that can be used by downstream as dependencies to detect OS type or Package Manager installations.  
As of `v1.0.0` only provides system-related functions and variables ONLY.    
**NOTE**: Do not use some of these scripts in CMake-based projects; use built-in variables instead.

Examples of scripts: 

* **std-sys-os.sh** 
A cross-platform system-detection script - provides variables like `OS_LINUX`, `OS_LINUX_DEBIAN` or `OS_BSD` etc.; use cases include usage for specific system installation via shell scripts 
* **std-sys-package-manager.sh**  
A cross-platform package-manager detection script - provides variables like `PM_PKG`, `PM_DPKG`, `PM_YUM` etc. ; use cases - detection of package manager for C/C++ project dependency installation 
* More at [doc/std-sh.md](doc/std-sh.md)

## INSTALLL
### INSTALL - BASHER

By using [basher](https://github.com/basherpm/basher): 
```bash
basher install --ssh hinell/std.sh
```

Use it like so in your script:
```bash
inclue hinell/std.sh src/std-sys-os.sh
```

### INSTALL - MANUALLY
```bash
git clone --depth 1 git@github.com:hinell/std.sh.git /tmp/sh.std
cd ${_}
./config install --user # install to ~/.local/bin 
./config link --user # link to ~/.local/bin - dev-only 
sudo ./config install # install into /usr/bin 
```

The above will put executable/sourceable scripts into `${HOME}/.local/bin/` folder.  
Don't forget to set `PATH` in your `~/.bashrc`/`.zshrc` if you want to use user-local installation of executable scripts:
```bash
if [[ -d "$HOME/.local/bin" ]];
then
    PATH="$HOME/.local/bin:$PATH"
fi
```

## UNINSTALL

Depending on the installation method, use:
```bash
basher uninstall hinell/std.sh
# or
rm $HOME/.local/bin/std-* 
# or

```

## USAGE
[u]: #usage 'Product usage'

For full details see [doc/std-sh.md](doc/std-sh.md). E.g.:
```bash
source $(which std-sys-os.sh) || { exit 1; }
source $(which std-sys-package-manager.sh) || { exit 1; }
# etc
```

<!-- ### CREDITS -->
### [DOCUMENTATION]

[DOCUMENTATION]: doc/std-sh.md 'User documentation'
### [CONTRIBUTING]
### [DEVELOPMENT]

[CONTRIBUTING]: CONTRIBUTING.md 'Contribution documentation (see also source code files)'
[DEVELOPMENT]: DEVELOPMENT.md 'Devloper documentation (see also source code files)'

### SUPPORT DISCLAIMER
[PS]: #support-disclaimer 'Production use disclaimer & support info'

_NO GUARANTEES UNTIL PAID. This project is supported and provided AS IS. See also [LICENSE]._

[LICENSE]: LICENSE

## SEE ALSO
* [srcshelton/stdlib.sh](https://github.com/srcshelton/stdlib.sh) 
* [medlefsen/std.sh](https://github.com/medlefsen/std.sh)

----
December 18, 2023</br>
Copyright © 2023 - Alexander Davronov (a.k.a. github@hinell), et.al.<br>
