serverless_cmd() {
  GREEN='\033[0;32m'
  RED='\033[0;31m'
  NC='\033[0m' # No Color

  cmd="serverless $@"

  printf "Running serverless command: ${GREEN}serverless %s${NC}" "$@"

  if exec $cmd; then
    printf "\nSuccessfully ran serverless command: ${GREEN}%s${NC}.\n\n" "${cmd}"
    return
  fi

  printf "\n${RED}Failed to run serverless command %s.${NC}" "${cmd}"
  return 1
}
