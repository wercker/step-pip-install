export REQUIREMENTS_ARGS=""

if ! hash $WERCKER_PIP_INSTALL_PIP_COMMAND 2>/dev/null; then
    fail "Pip command not found: $WERCKER_PIP_INSTALL_PIP_COMMAND"
fi

if [ ${WERCKER_PIP_INSTALL_REQUIREMENTS_FILE} ]; then
    if [ -f $WERCKER_PIP_INSTALL_REQUIREMENTS_FILE ]; then
        export REQUIREMENTS_ARGS="$REQUIREMENTS_ARGS -r $WERCKER_PIP_INSTALL_REQUIREMENTS_FILE"
    else
        fail "no $WERCKER_PIP_INSTALL_REQUIREMENTS_FILE found."
    fi
fi

if [ ${WERCKER_PIP_INSTALL_PACKAGES_LIST} ]; then
    REQUIREMENTS_ARGS="$REQUIREMENTS_ARGS $WERCKER_PIP_INSTALL_PACKAGES_LIST"
fi

if [ ${PIP_DOWNLOAD_CACHE} ]; then
    info "Environment variable detected for download cache: $PIP_DOWNLOAD_CACHE"
fi

if [ ${PIP_FIND_LINKS} ]; then
    info "Environment variable detected for find links: $PIP_FIND_LINKS"
fi

if [ "$WERCKER_PIP_INSTALL_CLEANUP_WHEEL_DIR"]; then
    if [ ${PIP_WHEEL_DIR} ]; then
        info "Clearing WHEEL_DIR."
        rm $PIP_USE_WHEEL/*.whl
    else:
        fail "Unable to clear wheel dir. PIP_WHEEL_DIR is not defined"
    fi
fi

if [ "$WERCKER_PIP_INSTALL_AUTO_RUN_WHEEL" = "true" ]; then
    info "Auto wheel behavior enabled."
    if [ ${PIP_USE_WHEEL} ]; then
        info "Pip use wheel is defined... $PIP_USE_WHEEL"
        if [ "$PIP_USE_WHEEL" = "true" ]; then
            info "running $WERCKER_PIP_INSTALL_PIP_COMMAND wheel $REQUIREMENTS_ARGS"
            $WERCKER_PIP_INSTALL_PIP_COMMAND wheel $REQUIREMENTS_ARGS
        fi
    fi
fi

if [ ${VIRTUAL_ENV} ]; then
    info "virtual environment detected."
    info "Running pip install: $WERCKER_PIP_INSTALL_PIP_COMMAND install $REQUIREMENTS_ARGS"
    $WERCKER_PIP_INSTALL_PIP_COMMAND install $REQUIREMENTS_ARGS
else
    echo "No virtual environment detected. Sudo will be used for pip install"
    info "Running pip install with sudo: sudo $WERCKER_PIP_INSTALL_PIP_COMMAND install $REQUIREMENTS_ARGS"
    sudo $WERCKER_PIP_INSTALL_PIP_COMMAND install $REQUIREMENTS_ARGS
fi
if [[ $? -ne 0 ]]
then
    fail "pip install failed"
else
    success 'pip install succeeded'
fi
