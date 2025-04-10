ACTION="${1:-github}" # Default to "build" if no parameter is passed
BRANCH="${2}"

if [ "$ACTION" = "origin" ]; then

    if [ -n "$BRANCH" ]; then
        echo "Doing branch stuff..."
        git checkout -b "$BRANCH"
        git checkout "$BRANCH"
       
    fi

    # TODO: check that the file does not already exist and delete it if it does.
    echo "Moving files to keep them safe"
    mkdir -p _site/tmp
    mv _source _site/tmp/

    # Git operations
    read -p "Enter commit message: " COMMITMESSAGE
    git add .
    git commit -m "$COMMITMESSAGE"
    git push "$ACTION" "$BRANCH"

    # Restore _source
    mv _site/tmp/_source ./_source
    rmdir _site/tmp 2>/dev/null  # Clean up if empty
    echo "Done!"
    exit
fi



if [ "$ACTION" = "github" ]; then

    if [ -n "$BRANCH" ]; then
        echo "Doing branch stuff..."
        git checkout "$BRANCH"
    fi

    # Ask for commit message
    read -p "Enter commit message: " COMMITMESSAGE
    echo "Doing the all the git things"
    # Git operations
    #git checkout "$BRANCH"
    git add .
    git commit -a -m "$COMMITMESSAGE"
    git push "$ACTION" "$BRANCH"
    echo "Done!"
    exit
fi

echo "Unknown remote $ACTION"
