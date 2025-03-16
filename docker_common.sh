set -o nounset

readonly HOST_WORK_DIR="$(pwd)"
readonly HOST_TEST_DIR="$(pwd)/../../test"

cmd_build() {
  docker build \
    --progress plain \
    -t $IMAGE .
}

cmd_run_it() {
  docker run --rm -it \
    -v "${HOST_WORK_DIR}:/root/work" \
    -v "${HOST_TEST_DIR}:/root/test" \
    $IMAGE "$@"
}

cmd_run() {
  docker run --rm -i \
    -v "${HOST_WORK_DIR}:/root/work" \
    -v "${HOST_TEST_DIR}:/root/test" \
    $IMAGE "$@"
}

cmd="$1"; shift
case $cmd in
  build )
    cmd_build "$@"
;; run_it )
     cmd_run_it "$@"
;; run )
     cmd_run "$@"
;; * )
     echo "invalid command (${cmd})" >&2
     ;;
esac
