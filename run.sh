UPDATE="$WERCKER_DEP_UPDATE"
VERBOSE="$WERCKER_DEP_VERBOSE"
OPT="$WERCKER_DEP_OPT"
VERSION="$WERCKER_DEP_VERSION"

if [ "${UPDATE}" = "true" ]; then
    OPT="${OPT} -update"
fi

if [ "${VERBOSE}" = "true" ]; then
    OPT="${OPT} -v"
fi

go get -u github.com/golang/dep/...

if [ "${VERSION}" != "" ]; then
    CURRENT_DIR=$(pwd)
    cd $GOPATH/src/github.com/golang/dep/cmd/dep
    git checkout ${VERSION}
    go install github.com/golang/dep/cmd/dep
    git branch
    cd $CURRENT_DIR
fi

dep ensure ${OPT}
dep status
