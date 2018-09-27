#!/usr/bin/env bash.origin.script

function EXPORTS_ensure_file_variables_encrypted {
    BO_sourcePrototype "$__DIRNAME__/node_modules/pio.profile/bin/pio-profile-encrypt" --noexit "$1"
}

function EXPORTS_source_file_variables {  
    eval "$(BO_sourcePrototype "$__DIRNAME__/node_modules/pio.profile/bin/pio-profile-decrypt"; runWithArgs --format "source/env" "$1")"
}
