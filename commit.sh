ACTION="${1:-github}" # Default to "build" if no parameter is passed
BRANCH="${2}"

ACTION="${1:-github}" # Default to "github" if not provided
BRANCH="${2}"

if [ "$ACTION" = "origin" ]; then
    if [ -n "$BRANCH" ]; then
        echo "Doing branch stuff..."
        if git show-ref --verify --quiet "refs/heads/$BRANCH"; then
            git checkout "$BRANCH"
        else
            git checkout -b "$BRANCH"
        fi
    else
        echo "⚠️  No branch provided — skipping checkout."
    fi

    echo "Moving files to keep them safe"
    mkdir -p _site/tmp
    mv _source _site/tmp/

    read -p "Enter commit message: " COMMITMESSAGE
    git add .
    git commit -m "$COMMITMESSAGE"

    if [ -n "$BRANCH" ]; then
        git push "$ACTION" "$BRANCH"
    else
        git push "$ACTION"
    fi

    mv _site/tmp/_source ./_source
    rmdir _site/tmp 2>/dev/null
    echo "✅ Done!"
    exit
fi


if [ "$ACTION" = "github" ]; then
    if [ -n "$BRANCH" ]; then
        echo "Doing branch stuff..."
        git checkout "$BRANCH" 2>/dev/null || echo "⚠️  Warning: Could not switch to branch '$BRANCH'."
    else
        echo "⚠️  No branch provided — skipping checkout."
    fi

    read -p "Enter commit message: " COMMITMESSAGE
    git add .
    git commit -m "$COMMITMESSAGE"

    if [ -n "$BRANCH" ]; then
        git push "$ACTION" "$BRANCH"
    else
        git push "$ACTION"
    fi

    echo "✅ Done!"
    exit
fi

echo "Unknown remote $ACTION"
