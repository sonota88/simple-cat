set -o nounset

readonly HOST_WORK_DIR="$(pwd)"
readonly HOST_TEST_DIR="$(pwd)/../../test"
readonly CONT_WORK_DIR="${HOME}/work"
readonly CONT_TEST_DIR="${HOME}/test"

cmd_build() {
  docker build \
    --build-arg user=$USER \
    --build-arg group=$(id -gn) \
    --progress plain \
    -t $IMAGE .
}

cmd_run_it() {
  docker run --rm -it \
    -v "${HOST_WORK_DIR}:${CONT_WORK_DIR}" \
    -v "${HOST_TEST_DIR}:${CONT_TEST_DIR}" \
    $IMAGE "$@"
}

cmd_run() {
  docker run --rm -i \
    -v "${HOST_WORK_DIR}:${CONT_WORK_DIR}" \
    -v "${HOST_TEST_DIR}:${CONT_TEST_DIR}" \
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
