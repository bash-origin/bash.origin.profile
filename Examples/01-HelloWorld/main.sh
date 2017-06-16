#!/usr/bin/env bash.origin.script

depend {
    "profile": "@com.github/bash-origin/bash.origin.profile#s1"
}


export SECRET_VALUE="secret"

export VAR_2_SUBVAL="subval"

echo {
    "env": {
        "VAR_1": "[ENCRYPT:SECRET_VALUE:val1]",
        "VAR_2": "[ENCRYPT:SECRET_VALUE:val2\$VAR_2_SUBVAL\\\$i/']"
    }
} > ".profile.json"

echo "TEST_MATCH_IGNORE>>>"
cat ".profile.json"
echo "<<<TEST_MATCH_IGNORE"


CALL_profile ensure_file_variables_encrypted ".profile.json"


echo "TEST_MATCH_IGNORE>>>"
cat ".profile.json"
echo "<<<TEST_MATCH_IGNORE"

echo "VAR_1: $VAR_1"
echo "VAR_2: $VAR_2"

CALL_profile source_file_variables ".profile.json"

echo "VAR_1: $VAR_1"
echo "VAR_2: $VAR_2"


echo "OK"
