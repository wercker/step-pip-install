cd $WERCKER_SOURCE_DIR

if [ -f "requirements.txt" ]
then
    debug "sudo pip install -r requirements.txt"
    sudo pip install -r requirements.txt

    if [[ $? -ne 0 ]]
    then
        fail 'pip install failed'
    else
        success 'pip install succeeded'
    fi
else
    debug 'skipping pip install, no requirements.txt found in directory'
fi
