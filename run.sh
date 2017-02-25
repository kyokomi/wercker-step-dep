UPDATE="$WERCKER_DEP_UPDATE"
VERBOSE="$WERCKER_DEP_VERBOSE"
OPT="$WERCKER_GHR_OPT"

if [ "${UPDATE}" = "true" ]; then
    OPT="${OPT} -update"
fi

if [ "${VERBOSE}" = "true" ]; then
    OPT="${OPT} -v"
fi

go get -u github.com/golang/dep/...
dep ensure ${OPT}
dep status
