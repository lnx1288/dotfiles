#!/bin/bash

echo -n 'Please input the kernel version (e.g., 4.4.0-133-generic): '
read KERNEL_VERSION
echo -n 'Please input the OS version (e.g., "16.04"): '
read OS_VERSION
echo -n 'Please input the OS name (e.g., xenial): '
read OS_NAME


echo "Setting up crash dump analysis tools for kernel $KERNEL_VERSION and distro $OS_VERSION"
if [ -z "$KERNEL_VERSION" ]; then
  echo "Error: a kernel version is required."
  exit 1
else
  # Create an /etc/apt/sources.list.d/ddebs.list to get the proper
  # debug package (*-dbgsym.ddeb)
  echo "deb http://ddebs.ubuntu.com ${OS_NAME} main restricted universe multiverse
  deb http://ddebs.ubuntu.com ${OS_NAME}-updates main restricted universe multiverse
  deb http://ddebs.ubuntu.com ${OS_NAME}-proposed main restricted universe multiverse" | \
  sudo tee -a /etc/apt/sources.list.d/ddebs.list

  # Import the debug symbol archive signing key from the Ubuntu server
  if [[ "$OS_VERSION" == *"16.0"* || "$OS_VERSION" == *"15.0"* || "$OS_VERSION" == *"14.0"* ]]; then
    echo 'GPG: detected distro is older than Bionic'
    # update and handle NO_PUBKEY error
    sudo apt-get update 2>&1 1>/dev/null | sed -ne 's/.*NO_PUBKEY //p' |
    while read key; do
        echo '...processing key:' "$key"
        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "$key"
    done
  else
    echo 'GPG: detected distro is Bionic or newer'
    sudo apt-get update
    sudo apt install ubuntu-dbgsym-keyring    # for bionic or newer
  fi

  # install the debug symbols for KERNEL_VERSION
  sudo apt-get install -y linux-image-${KERNEL_VERSION}-dbgsym
  dpkg -L linux-image-${KERNEL_VERSION}-dbgsym

  # install the crash utility
  sudo apt-get install -y crash
fi
