GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

store_payload() {
  payload=$(mktemp /tmp/resource-in.XXXXXX)
  cat > $payload <&0
}

extract_config(){
  config="${1}"
  jq -r ".source.${config}" < "${payload}"
}

extract_parameter() {
  parameter="${1}"
  jq -r ".params.${parameter}" < "${payload}"
}

extract_state() {
  directory=$1
  expression=$2

  jq -r "${expression}" < "${directory}/serverless-state.json"
}

serverless_cmd() {
  cmd="serverless $@"

  printf "Running serverless command: ${GREEN}serverless $cmd${NC}\n"

  if ($cmd) then
    printf "\nSuccessfully ran serverless command: ${GREEN}$cmd${NC}.\n\n"
    return 0
  fi

  printf "\n${RED}Failed to run serverless command %s.${NC}" "${cmd}"
  return 1
}
