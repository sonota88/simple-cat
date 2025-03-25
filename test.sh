set -o nounset
# set -o xtrace

print_this_dir() {
  (
    cd "$(dirname "$0")"
    pwd
  )
}

# --------------------------------
# args

if [ $# -ge 1 ]; then
  readonly LANG="$1"; shift
else
  cat <<__MSG >&2
usage:
  ./test.sh {language}

  example:
  ./test.sh ruby
__MSG

  exit 1
fi

if [ $# -ge 1 ]; then
  readonly TARGET_HEAD="$1"; shift
else
  readonly TARGET_HEAD=
fi

# --------------------------------

readonly PROJECT_HOME="$(print_this_dir)"

cd "${PROJECT_HOME}/impls/${LANG}"

readonly TEMP_SH=./.test.sh
cp ../../test/test_in_container.sh $TEMP_SH
./docker.sh run bash $TEMP_SH "$TARGET_HEAD"
status=$?
rm $TEMP_SH

exit $status
