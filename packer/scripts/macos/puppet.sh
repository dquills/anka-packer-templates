#!/bin/bash
set -euo pipefail

export HOMEBREW_NO_AUTO_UPDATE=1
brew tap puppetlabs/puppet
brew cask install puppet-agent-6

# Puppet module installs using CLI
sudo /opt/puppetlabs/puppet/bin/puppet module install thekevjames-homebrew --version 1.8.3
sudo /opt/puppetlabs/puppet/bin/puppet module install puppetlabs-vcsrepo --version 3.1.0

# Puppet module installs using Git, pinned to a ref
MACDEFAULTS_GIT_REF='35ca6165d39808aeffe40c89eceb272b5de4da5b'
sudo git clone https://github.com/puppetlabs/puppet-macdefaults.git /etc/puppetlabs/code/modules/macdefaults
sudo cd /etc/puppetlabs/code/modules/macdefaults
sudo git reset --hard $MACDEFAULTS_GIT_REF