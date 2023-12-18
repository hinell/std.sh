#!/usr/bin/env -S bash
# File........: std-sys-os.sh
# Summary.....: Detect operating system 
# Created.....: December 18, 2023 
# Authors.....: Alex A. Davronov <al.neodim@gmail.com> (2023-)
# Repository..: N/A
# Usage.......: Source in shell script

_O_NOUNSET_TOGGLE=false
if [[ -o NOUNSET ]]; then  echo "u reset" ; set +u ; fi

# provide help information if run as executable 
if [[ ${1} =~ -h || ${1} =~ --help ]];
then
	# DEPRECATED: use multiple echo calls instead
	cat <<-EOL
	std-sys-os.sh
	A script to detect operating system from scripts.
	Usage:
	   source \$(which std-sys-os.sh) || { exit 1; }
	   if \$OS_LINUX && \$OS_LINUX_UBUNTU;
	   then
	       echo "This is a Ubuntu distribution of linux"
	   fi
	EOL
	exit 0 
fi

# import various helpers
source /etc/os-release || {
	echo -e "${0}:$(tput setaf 1)error$(tput sgr0): /etc/os-release is not found! Aborting." >&2 ;
	exit 1
}

# Vars identifying operating system 
export OS_LINUX=false 
export OS_LINUX_WSL=false 
export OS_LINUX_ANDROID=false 
export OS_LINUX_DEBIAN=false 
export OS_LINUX_UBUNTU=false 
export OS_GNU=false
export OS_BSD=false
export OS_BSD_MACOS=false 
export OS_WINDOWS=false 
export OS_UNKNOWN=false 

case "`uname`" in
	GNU)
		OS_GNU=true
	;;
	MSYS_NT*|MINGW64_NT*|Windows_NT*)
		OS_WINDOWS=true
    ;;
	Linux)
		case "`uname -o`" in
			Android)
				OS_LINUX_ANDROID=true
			;;
			*)
				OS_LINUX=true
				case "${ID}" in
					(debian)
						OS_LINUX_DEBIAN=true
					;;
					(ubuntu)
						OS_LINUX_UBUNTU=true
					;;
					# switch.stub
				esac 
			;;
		esac
    ;;
	Darwin)
		OS_BSD=true
		OS_BSD_MACOS=true
    ;;
	(*BSD)
		case "`uname -o`" in
			NetBSD)
				OS_BSD=true
			;;
			FreeBSD)
				OS_BSD=true
			;;
			OpenBSD)
				OS_BSD=true
			;;
		esac
		;;
	*)
		OS_UNKNOWN=true
    ;;
esac

## @summary exit script if OS is unknown 
system-os-if-unknown-fail(){
	if ${IS_OS_UNKNOWN} ;
	then
		echo -e "${0}:$(tput setaf 1)fatal$(tput op): unknown operating system. Aborting." > /dev/stderr; 
		exit 1
	fi
}

if $_O_NOUNSET_TOGGLE; then set -u ; fi

# ex: ft=bash
