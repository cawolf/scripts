export PATH=$PATH:$HOME/.arkade/bin/
export PATH="${PATH}:${HOME}/.krew/bin"
eval "$(oh-my-posh init bash --config ~/.poshthemes/M365Princess.omp.json)"

export PHPENV_ROOT="/home/cwolf/.phpenv"
if [ -d "${PHPENV_ROOT}" ]; then
  export PATH="${PHPENV_ROOT}/bin:${PATH}"
  eval "$(phpenv init -)"
fi

function mkmrgd(){
  git remote prune origin;

  git fetch origin;

  git checkout master;

  git pull;

  git branch -r --merged > merged_base;

  git checkout release;

  git pull;

  git branch -r --merged >> merged_base;

  cat merged_base | grep -v origin/release | grep -v origin/master | grep -v origin/demo | sort | uniq > merged;

  rm merged_base;

  sed -i 's/ *origin\///g' merged;
}

alias comopser='composer'
alias branchlist='git remote prune origin; git for-each-ref --format="%(authorname) %(refname)" | sort -k1 | grep -v heads | grep -v refs/stash | grep -v origin/master | grep -v origin/HEAD | grep -v tags | grep -v origin/demo | grep -v origin/release;'
alias countfiles='find * -prune -type d | while IFS= read -r d; do echo $d; find $d -type f | wc -l; done'

alias tdoc='docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.16.0 markdown /terraform-docs > README.md'
alias k=kubectl
alias t='terraform'
alias tf='terraform'
alias h=helm

alias kwhoami='cd /opt/workspace/auxmoney/cwolf/scripts/aws; ./kubectlWhoAmI.sh'
alias kupdate='cd /opt/workspace/auxmoney/cwolf/scripts/aws; ./updateKubeconfig.sh'
alias k3dnewcluster="k3d cluster create --api-port 6550 -p '8081:80@loadbalancer' --k3s-arg '--kubelet-arg=eviction-hard=imagefs.available<1%,nodefs.available<1%@agent:*' --k3s-arg '--kubelet-arg=eviction-minimum-reclaim=imagefs.available=1%,nodefs.available=1%@agent:*'"

export GOPATH=$HOME/go
export HELM_EXPERIMENTAL_OCI=1
