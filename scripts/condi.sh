for f in ./*; do
    if [ "$f" = "./Makefile" ] || \
        [ "$f" = "./Dockerfile" ]; then
        echo $f;
        fi
    done
