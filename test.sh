set -o nounset

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

cd "impls/${LANG}"

readonly TEMP_SH=./.test.sh
cp ../../test/test_in_container.sh $TEMP_SH
./docker.sh run bash $TEMP_SH "$TARGET_HEAD"
status=$?
rm $TEMP_SH

exit $status
