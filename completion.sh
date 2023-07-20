#!/bin/bash

# reference https://blog.cybozu.io/entry/2016/09/26/080000

COMPLETER_PATH=$(pwd)/build/bin/Debug/main.exe
COMPLETION_CACHE_DIR=${HOME}/.sample_completion

# Create cache directory
mkdir -p ${COMPLETION_CACHE_DIR}


function complete_sample()
{
    local cur prev opts
    _get_comp_words_by_ref -n : cur prev
    
    CACHE_FILE_NAME=sample.cache
    CACHE_FILE_PATH=${COMPLETION_CACHE_DIR}/${CACHE_FILE_NAME}

    RESULT="$(find ${COMPLETION_CACHE_DIR} -maxdepth 1 -name ${CACHE_FILE_NAME} -mmin -1 2>/dev/null )"
    if [ -z "${RESULT}" ]; then
        $COMPLETER_PATH > ${CACHE_FILE_PATH} 2>/dev/null
    fi
    COMPREPLY=( "${COMPREPLY[@]}" $( \
        compgen -W "$(cat ${CACHE_FILE_PATH} 2>/dev/null)" \
            ${COMP_WORDS[COMP_CWORD]} \
    ))
}

complete -F complete_sample sample

