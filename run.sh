if [ -f "requirements.txt" ]
then
    if [ "$WERCKER_PIP_INSTALL_AUTO_RUN_WHEEL" = "true" ]; then
        if [ -z "$PIP_USE_WHEEL" ]; then
            if [ "$PIP_USE_WHEEL" = "true" ]; then
                if [ -z "$WERCKER_WHEEL_DIR" ]; then
                    pip wheel -r requirements.txt --wheel-dir=WERCKER_WHEEL_DIR
                else
                    pip wheel -r requirements.txt
                fi
            fi
        fi
    fi

    if [ -z "$PIP_DOWNLOAD_CACHE" ]; then
        info "Environment variable detected for download cache: $PIP_DOWNLOAD_CACHE"
    fi

    if [ -z "$PIP_DOWNLOAD_CACHE" ]; then
        info "Environment variable detected for find links: $PIP_FIND_LINKS"
    fi

    if [ -z "$VIRTUAL_ENV" ]; then
        info "virtual environment detected."
        info "Running pip install: pip install -r requirements.txt"
        pip install -r requirements.txt
    else
        echo "No virtual environment detected. Sudo will be used for pip install"
        info "Running pip install with sudo"
        sudo pip install -r requirements.txt
    fi

    if [[ $? -ne 0 ]]
    then
        fail 'pip install failed'
    else
        success 'pip install succeeded'
    fi
else
    fail 'no requirements.txt found in directory'
fi

cd $WERCKER_SOURCE_DIR

if [ -f "requirements.txt" ]
then

    # mkdir -p $WERCKER_CACHE_DIR/.pip/wheel

    # debug "pip install with download cache"


    if [[ $? -ne 0 ]]
    then
        fail 'pip install failed'
    else
        success 'pip install succeeded'
    fi
else
    fail 'no requirements.txt found in directory'
fi
