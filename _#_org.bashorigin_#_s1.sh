#!/usr/bin/env bash.origin.script

depend {
    "npm": {
        "@com.github/pinf-it/it.pinf.org.npmjs#s1": {
            "dependencies": {
                "pio.profile": "^0.1.2"
            }
        }
    }
}

# TODO: Make this a general feature.
if [ -e "$__DIRNAME__/node_modules/pio.profile" ]; then
    rm -Rf "$__DIRNAME__/.rt/it.pinf.org.npmjs/node_modules/pio.profile" || true
    ln -s "../../../node_modules/pio.profile" "$__DIRNAME__/.rt/it.pinf.org.npmjs/node_modules/pio.profile"
fi


function EXPORTS_ensure_file_variables_encrypted {
    BO_sourcePrototype "$__DIRNAME__/.rt/it.pinf.org.npmjs/node_modules/pio.profile/bin/pio-profile-encrypt" --noexit "$1"
}

function EXPORTS_source_file_variables {  
    eval "$(BO_sourcePrototype "$__DIRNAME__/.rt/it.pinf.org.npmjs/node_modules/pio.profile/bin/pio-profile-decrypt"; runWithArgs --format "source/env" "$1")"
}
