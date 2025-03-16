# This script is executed inside a container.

set -o nounset

readonly TEST_DIR=/root/test
FAILED=

run_test() {
  local f_in="$1"; shift
  local f_out=/tmp/out
  
  cat $f_in | bash cat.sh > $f_out

  diff -u $f_in $f_out
  status=$?
  if [ $status -ne 0 ]; then
    echo "--------"
    FAILED="${FAILED} ${f_in}"
  fi
}

print_target_list() {
  local target_head="$1"; shift

  if [ "$target_head" = "" ]; then
    ls ${TEST_DIR}/data*
  else
    ls ${TEST_DIR}/${target_head}*
  fi
}

# --------------------------------

readonly TARGET_HEAD="$1"; shift

for f_in in $(print_target_list "$TARGET_HEAD"); do
  run_test $f_in
done

if [ "$FAILED" = "" ]; then
  echo "ok"
else
  echo "failed"
  for f_failed in $FAILED; do
    echo "  $(basename "$f_failed")"
  done

  exit 1
fi
