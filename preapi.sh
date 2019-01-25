function cpath() {
        arg="$1"
        drive="${arg:0:1}"
        pth="/${drive,,}/${arg:3}"
        pth="${pth//\\//}"

        if [ "${pth:-1}" != "/" ]; then
                pth="$pth/"
        fi

        if [ -d "$pth" ]; then
                echo "$pth"
        else
                echo "/mnt$pth"
        fi
}
