#!/bin/bash
# If a template does not fail and is meant to fail, return error

set -euo pipefail

outcome="${1}"      # Lint step outcome
fail_flag="${2}"    # If true, template is intended to fail

if [[ "${fail_flag}" == "true" && "${outcome}" != "failure" ]] ; then
    tee -a "${GITHUB_STEP_SUMMARY}" <<-EOF
    🛑 The outcome of the previous step was "${outcome}", however
    the previous step should have been a "failure" outcome, since the test case
    is designed to make sure failures are correctly detected by the action
EOF

    exit 1
fi
