#!/bin/bash

# reference https://blog.cybozu.io/entry/2016/09/26/080000

COMPLETER_PATH=$(pwd)/build/bin/Debug/main.exe

function complete_sample()
{
    local cur prev opts
    _get_comp_words_by_ref -n : cur prev
    COMPREPLY=( $(compgen -W "$($COMPLETER_PATH)" -- "${cur}") );
}

complete -F complete_sample sample

