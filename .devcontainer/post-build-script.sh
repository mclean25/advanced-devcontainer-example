#!/bin/bash
source ./.devcontainer/config.sh || echo "No 'config.sh' file found"

WORKSPACE_TEMP_CONFIG_DIR=${PWD}/${temp_config_dir}
HOME_DIR=/root

"""
Moves a file or directory from the workspace dir to the home folder.
"""
move_to_home()
{
    local path=$1

    echo "${path}"

    full_path="${WORKSPACE_TEMP_CONFIG_DIR}"/"${path}"

    if [ -d "${full_path}" ]
        then cp -aR "${full_path}" "${HOME_DIR}"/"${path}" 
            \ || echo "error copying file ${full_path}"
    elif [ -f "${full_path}" ]
        then cp "${full_path}" "${HOME_DIR}"/"${path}" 
            \ || echo "error copying folder ${full_path}"
    else echo "\"${full_path}\" is not valid";
        exit 1
    fi
}

for path in "${paths_to_port[@]}"
do
    echo "Moving path \"{$path}\""
    move_to_home "${path}"
done

rm -r "${WORKSPACE_TEMP_CONFIG_DIR}"

# execute install commands
install_cmds
