#! /bin/bash
source /root/.sdkman/bin/sdkman-init.sh 
sdk update
exec "$@"
