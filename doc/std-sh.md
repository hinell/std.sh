# std.sh

### `std-sys-os.sh` 
A cross-platform operating system detection script. It exports variables which depending on a system, are set to true.  
List of exported variables:
<!--sys-os-exported-vars-start-->
```bash
OS_LINUX
OS_LINUX_WSL
OS_LINUX_ANDROID
OS_LINUX_DEBIAN
OS_LINUX_UBUNTU
OS_GNU
OS_BSD
OS_BSD_MACOS
OS_WINDOWS
OS_UNKNOWN 
```
<!--sys-os-exported-vars-end-->

### `std-sys-package-manager.sh`

A cross-platform system package-manager detection script. Same as above.  
List of exported variables:

<!--sys-os-pm-vars-start-->
```
PM_PKG
PM_DPKG
PM_APT
PM_APT_GET
PM_DNF
PM_YUM
PM_RPM 
```
<!--sys-os-pm-vars-end-->

----
December 18, 2023</br>
Copyright © 2023 - Alexander Davronov (a.k.a. github@hinell), et.al.<br>
