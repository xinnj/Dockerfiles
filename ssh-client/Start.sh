#!/bin/sh
set -euao pipefail

IP=$(getent hosts ${REMOTE_HOST} | cut -d' ' -f1)
sudo -- sh -c "echo  \ \ >> /etc/hosts"; sudo -- sh -c "echo ${IP} remote-host >> /etc/hosts"
echo ${IP} remote-host > ./hosts

[[ -s "${SSH_KEY}" ]] || {
  /usr/bin/ssh-keygen -t rsa -f "${SSH_KEY}" -q -N ""
  chmod 600 "${SSH_KEY}"
}
for i in {1..3}; do
  if [[ "${REMOTE_TYPE}" == "linux" ]]; then
    sshpass -p${PASSWORD} ssh-copy-id -i "${SSH_KEY}.pub" -p ${REMOTE_PORT} ${USERNAME}@${IP} 2>&1 >/dev/null | grep -v "expr"
  else
    ./ssh-copy-id-win ${IP} ${REMOTE_PORT} ${USERNAME} ${PASSWORD} "${SSH_KEY}.pub" > /dev/null
  fi
  if [[ "$?" == "0" ]]; then
    break
  else
    echo "Repeating until able to copy SSH key into remote host..."
    if [[ "$i" == "3" ]]; then
      echo "Connect remote host failed!"
      exit 1
    fi
    sleep 5
  fi
done
grep ${SSH_KEY} ~/.ssh/config || {
  {
    echo "Host remote-host"
    echo "    User ${USERNAME}"
    echo "    Port ${REMOTE_PORT}"
    echo "    IdentityFile ${SSH_KEY}"
    echo "    StrictHostKeyChecking no"
    echo "    UserKnownHostsFile=~/.ssh/known_hosts"
    echo "Host ${IP}"
    echo "    User ${USERNAME}"
    echo "    Port ${REMOTE_PORT}"
    echo "    IdentityFile ${SSH_KEY}"
    echo "    StrictHostKeyChecking no"
    echo "    UserKnownHostsFile=~/.ssh/known_hosts"
  } >> ~/.ssh/config
}

if [[ ! -z "${REMOTE_COMMANDS}" ]]; then
  echo "Execute on remote host: ${REMOTE_COMMANDS}"
  ssh ${IP} "${REMOTE_COMMANDS}"
fi