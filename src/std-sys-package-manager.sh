#!/usr/bin/env -S bash 
# File........: std-sys-package-manager.sh
# Summary.....: Detect system-installed package managers for various systems 
# Created.....: December 18, 2023 
# Authors.....: Alex A. Davronov <al.neodim@gmail.com> (2023-)
# Repository..: N/A
# Usage.......: Source in shell script

_O_NOUNSET_TOGGLE=false
if [[ -o NOUNSET ]]; then; set +u ; fi

# provide help information if run as executable 
if [[ ${1} =~ -h || ${1} =~ --help ]];
then
	# DEPRECATED: use multiple echo calls instead
	cat <<-EOL
	std-sys-package-manager.sh
	A script to detect system-installed package managers
	Usage:
	   source \$(which std-sys-package-manager.sh) || { exit 1; }
	   if \$PM_APT;
	   then
	       echo "apt package manager is found"
	   fi
	EOL
	exit 0 
fi

export PM_PKG=false        # BSD 
export PM_DPKG=false       # Debian
export PM_APT=false        # Debian/Ubuntu 
export PM_APT_GET=false    #
export PM_DNF=false        #
export PM_YUM=false        # Fedora
export PM_RPM=false        # RedHat 

# package managers checks
command -v pkg     1> /dev/null && PM_PKG=true
command -v dpkg    1> /dev/null && PM_DPKG=true
command -v apt     1> /dev/null && PM_APT=true
command -v apt-get 1> /dev/null && PM_APT_GET=true
command -v dnf     1> /dev/null && PM_DNF=true
command -v yum     1> /dev/null && PM_YUM=true
command -v rpm     1> /dev/null && PM_RPM=true

# Run script only if it was directly invoked 
if [[ ${ZSH_ARGZERO} == $0 || ${BASH_SOURCE[0]} == $0 ]];
then
	:
else
	return 0  # for source command, which returns last command's return status
fi

if $_O_NOUNSET_TOGGLE; then set -u ; fi

# ex: ft=bash 
