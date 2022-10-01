s3fs $BUCKET_NAME $MOUNT_POINT \
    -o nomultipart \
    -o passwd_file=/ansible/.passwd-s3fs \
    -o sigv2 \
    -o url=https://storage.googleapis.com