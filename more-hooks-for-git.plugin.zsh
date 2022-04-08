#!/bin/bash
# This plugin overload the git command to expose more hooks.
# the main git binary doesn't expose hooks for the commands that don't modify anything.
# This plugin give you that ability for the following commands : `add`, `status`, `diff`.
# Feel free to add more commands to the list.
# This plugin is MIT licensed to match the more-hooks-for-git license.

function git() {
    local project_path="$(pwd)"
    local hooks_path="$project_path/.git/hooks"

    if [[ $# -ge 1 && "$1" == "init" ]]
    then
        command git "$@"

        return 0
    fi

    if [ ! -d "$hooks_path" ]; then
        echo "Git is not initialized in this directory. run git init first"
        return 1
    fi

    if [[ $# -ge 1 && "$1" == "status" ]]
    then
        local pre_status_path="$hooks_path/pre-status"
        local post_status_path="$hooks_path/post-status"

        if [ -f "$pre_status_path" ]; then
            echo "pre-status exists"
            . "$pre_status_path"
        else
            echo "pre-status does not exist"
        fi

        command git "$@"

        if [ -f "$post_status_path" ]; then
            echo "post-status exists"
            . "$post_status_path"
        else
            echo "post-status does not exist"
        fi
    elif [[ $# -ge 1 && "$1" == "diff" ]]
    then
        local pre_diff_path="$hooks_path/pre-diff"
        local post_diff_path="$hooks_path/post-diff"

        if [ -f "$pre_diff_path" ]; then
            echo "pre-diff exists"
            . "$pre_diff_path"
        else
            echo "pre-diff does not exist"
        fi

        command git "$@"

        if [ -f "$post_diff_path" ]; then
            echo "post-diff exists"
            . "$post_diff_path"
        else
            echo "post-diff does not exist"
        fi

    elif [[ $# -ge 1 && "$1" == "add" ]]
    then
        echo "git add with sprinkles of flint"
        local pre_add_path="$hooks_path/pre-add"
        local post_add_path="$hooks_path/post-add"

        if [ -f "$pre_add_path" ]; then
            echo "pre-add exists"
            . "$pre_add_path"
        else
            echo "pre-add does not exist"
        fi

        command git "$@"

        if [ -f "$post_add_path" ]; then
            echo "post-add exists"
            . "$post_add_path"
        else
            echo "post-add does not exist"
        fi
    else
        command git "$@"
    fi

    return 0
}
