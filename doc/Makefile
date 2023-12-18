SHELL=bash

# This rule extracts list of variables between delimiters in the .sh files and insert them into doc/*.md
.PHONY: std-sh.md
.ONESHELL: 
std-sh.md: ../src/std-sys-os.sh ../src/std-sys-package-manager.sh
	DELIMITER_START='<!--sys-os-exported-vars-start-->'
	DELIMITER_END='<!--sys-os-exported-vars-end-->'
	printf -v EXPORTED_VARS '%s\n\`\`\`bash\n%s\n\`\`\`\n%s' \
		$${DELIMITER_START} \
		"$$(sed -n -e '/export\s*.*=.*$$/{ s/export \(OS_[_[:alpha:]]\+\)=.*$$/\1/; p}' ../src/std-sys-os.sh) " \
		$${DELIMITER_END}

	sed_script(){
		CR=$$'\n'
		local _VALUE="$${2//$${CR}/\\$${CR}}"
		cat <<-EOL
		/$${3}/{
		a \\
			$${_VALUE}
		}
		/$${1}/,/$${3}/d
		EOL
	}
	sed -i -f <(sed_script "$${DELIMITER_START}" "$${EXPORTED_VARS}" "$${DELIMITER_END}") $@ &> /dev/null

	unset EXPORTED_VARS
	DELIMITER_START='<!--sys-os-pm-vars-start-->'
	DELIMITER_END='<!--sys-os-pm-vars-end-->'

	printf -v EXPORTED_VARS '%s\n\`\`\`\n%s\n\`\`\`\n%s' \
		$${DELIMITER_START} \
		"$$(sed -n -e '/export\s*.*=.*$$/{ s/export \(PM_[_[:alpha:]]\+\)=.*$$/\1/; p}' ../src/std-sys-package-manager.sh) " \
		$${DELIMITER_END}

	sed -i -f <(sed_script "$${DELIMITER_START}" "$${EXPORTED_VARS}" "$${DELIMITER_END}") $@ &> /dev/null

all: std-sh.md 

