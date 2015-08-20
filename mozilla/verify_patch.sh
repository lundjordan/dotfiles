#!/bin/sh
set -e

# TODO add repo sanity check
# TODO verify args passed
# TODO verify paths exist

START_TIME="$(date +%s)"
START_DIR=`pwd`

function usage {
    echo
    echo "This script takes in patches from buildbotcustom buildbot-configs, and tools. "
    echo "It then runs make checkconfig and diffs builder-list/dump-master output."
    echo
    echo "    -h:                        Display help."
    echo "    -e: [ENVIRONMENT]          The environment we are testing. e.g. build or test"
    echo "    -f: [BUILDBOT-CONFIG PATCH] "
    echo "    -u: [BUILDBOTCUSTOM PATCH] "
    echo "    -t: [TOOLS PATCH] "
}

# Simple function to output the name of this script and the options that were passed to it
function command_called {
    echo -n "Command called:"
    for ((INDEX=0; INDEX<=$#; INDEX+=1))
    do
        echo -n " '${!INDEX}'"
    done
    echo ''
    echo "From directory: '$(pwd)'"
}

command_called "${@}" | sed '1s/^/  * /;2s/^/    /'

echo "  * Start timestamp: ${START_TIME}"
echo "  * Parsing parameters of $(basename "${0}")..."
# Parse parameters passed to this script
while getopts ":he:f:u:t:" opt; do
    case "${opt}" in
        h)  echo "  * Help option requested"
            usage
            exit 0
            ;;
        e)  MASTER_TYPE="${OPTARG}"
            ;;
        f)  CFG_PATCH="${OPTARG}"
            ;;
        u)  CUSTOM_PATCH="${OPTARG}"
            ;;
        t)  TOOLS_PATCH="${OPTARG}"
            ;;
        ?)  usage >&2
            exit 1
            ;;
    esac
done

echo "  * Setting defaults for parameters not provided in command line options..."
TOOLS_PATCH="${TOOLS_PATCH:-0}"
CUSTOM_PATCH="${CUSTOM_PATCH:-0}"
CFG_PATCH="${CFG_PATCH:-0}"
MASTER_TYPE="${MASTER_TYPE:-0}"

MASTER_PATH=/Users/jlund/devel/mozilla/dev_master/${MASTER_TYPE}-master/
MASTER_CFG=${MASTER_PATH}/master.cfg

CFG_REPO=/Users/jlund/devel/mozilla/dirtyRepos/buildbot-configs_jlund/
CUST_REPO=/Users/jlund/devel/mozilla/dirtyRepos/buildbotcustom_jlund/
TOOLS_REPO=/Users/jlund/devel/mozilla/dirtyRepos/tools_jlund/

VIRTUAL_ENV=/Users/jlund/devel/mozilla/dev_master/bin/activate

DUMP_MASTER_PY=/Users/jlund/devel/mozilla/dev_master/braindump/buildbot-related/dump_master.py
BUILDER_LIST_PY=/Users/jlund/devel/mozilla/dev_master/braindump/buildbot-related/builder_list.py

BUILDER_LIST_PATH_CLEAN=/Users/jlund/devel/mozilla/dev_master/${MASTER_TYPE}-builderlists/$(date +%F--%T--clean)
BUILDER_LIST_PATH_DIRTY=/Users/jlund/devel/mozilla/dev_master/${MASTER_TYPE}-builderlists/$(date +%F--%T--dirty)
DUMP_MASTER_PATH_CLEAN=/Users/jlund/devel/mozilla/dev_master/${MASTER_TYPE}-dumpmasters/$(date +%F--%T--clean)
DUMP_MASTER_PATH_DIRTY=/Users/jlund/devel/mozilla/dev_master/${MASTER_TYPE}-dumpmasters/$(date +%F--%T--dirty)

##### Now check parsed parameters are valid...

echo "#### using master type: $MASTER_TYPE"
echo "#### using bbot-config patch: $CFG_PATCH"
echo "#### using bbotcustom patch: $CUSTOM_PATCH"
echo "#### using tools patch: $TOOLS_PATCH"

echo "  * Validating parameters..."
if [ "${MASTER_TYPE}" != 'build' ] && [ "${MASTER_TYPE}" != 'test' ]; then
    echo "ERROR: -e must be passed and it must be 'build' or 'test'" >&2
    exit 2
fi
if [ "${CFG_PATCH}" == 0 ] && [ "${CUSTOM_PATCH}" == 0 ] && [ "${TOOLS_PATCH}" == 0 ]; then
    echo "ERROR: you must supply at least 1 patch. see -h for patch options" >&2
    exit 3
fi

echo "#### using dev master venv"
source ${VIRTUAL_ENV}

#### CLEAN
echo "#### pulling and checking out clean buildbotcustom repo"
cd ${CUST_REPO}
git checkout master
git pull upstream master

echo "#### pulling and checking out clean buildbot-config repo"
cd ${CFG_REPO}
git checkout master
git pull upstream master

echo "#### pulling and checking out clean tools repo"
cd ${TOOLS_REPO}
git checkout master
git pull --no-edit upstream master

echo "#### ensuring clean checkconfig works"
cd ${MASTER_PATH}
make checkconfig

echo "#### getting clean builderlists"
${BUILDER_LIST_PY} ${MASTER_CFG} > ${BUILDER_LIST_PATH_CLEAN}
echo "#### getting clean dump_master"
${DUMP_MASTER_PY} ${MASTER_CFG} > ${DUMP_MASTER_PATH_CLEAN}
####

#### DIRTY
if [ -e "${CFG_PATCH}" ]; then
    echo "#### applying buildbot-config patch"
    cd ${CFG_REPO}
    git apply $CFG_PATCH
fi
if [ -e "${CUSTOM_PATCH}" ]; then
    echo "#### applying buildbotcustom patch"
    cd ${CUST_REPO}
    git apply $CUSTOM_PATCH
fi
if [ -e "${TOOLS_PATCH}" ]; then
    echo "#### applying tools patch"
    cd ${TOOLS_REPO}
    git apply $TOOLS_PATCH
fi

echo "#### ensuring dirty checkconfig works"
cd ${MASTER_PATH}
make checkconfig

echo "#### getting dirty builderlists"
${BUILDER_LIST_PY} ${MASTER_CFG} > ${BUILDER_LIST_PATH_DIRTY}
echo "#### getting dirty dump_master"
${DUMP_MASTER_PY} ${MASTER_CFG} > ${DUMP_MASTER_PATH_DIRTY}
####

echo "Files generated..."
echo ${BUILDER_LIST_PATH_CLEAN}
echo ${BUILDER_LIST_PATH_DIRTY}
echo ${DUMP_MASTER_PATH_CLEAN}
echo ${DUMP_MASTER_PATH_DIRTY}

# clean up
#cd ${CUST_REPO}
#git checkout -- .
#cd ${CFG_REPO}
#git checkout -- .
# deactivate
# cd $START_DIR
# unset $START_DIR

STOP_TIME="$(date +%s)"
echo "  * Finish timestamp: ${STOP_TIME}"
echo "  * Time taken: $((STOP_TIME - START_TIME))s"
