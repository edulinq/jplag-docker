#!/bin/bash

readonly WORK_DIR=/jplag

function main() {
    trap exit SIGINT

    cd "${WORK_DIR}"

    # Run the main command.
    /usr/bin/java -jar /jplag-bin/jplag-jar-with-dependencies.jar --result-file out $@
    local exit_status=$?

    # Cleanup regardless of the status of the command.
    chmod -Rf 777 out
    chmod -Rf 666 out/* out.zip

    return ${exist_status}
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
