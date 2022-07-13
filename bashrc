#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source /usr/share/nvm/init-nvm.sh



export KUBECONFIG=$HOME/.kube/dev:$HOME/.kube/rancher.dev2.config:$HOME/.kube/pilot:$HOME/.kube/k3s-nuc2.yaml:$HOME/.kube/rancher.stable.config:$HOME/.kube/rancher-new-dev.config:$HOME/.kube/prod:$HOME/.kube/stable-direct

alias k=kubectl

# Golang stuff
export GOPATH="/opt/go"
export GOPRIVATE="*.int.toradex.com"


# Added this for intellij idea... but it seems to be useful for java things
export _JAVA_AWT_WM_NONREPARENTING=1

# For terraform
export VAULT_ADDR=https://vault-dev.int.toradex.com

# For tptf
export VAULT_PUBLIC_KEY_PATH="$HOME/.tptf/kong-credentials/api-testing-keys/public.pem"
export VAULT_PRIVATE_KEY_PATH="$HOME/.tptf/kong-credentials/api-testing-keys/private.pem"
export JWT_UTIL_DIR="$HOME/workspace/toradex/ota/jwt-util"

# Grim for capturing screenshots
GRIM_DEFAULT_DIR=$HOME/screenshots

export PATH=$PATH:/opt/go/bin
. "$HOME/.cargo/env"

deploychart() {
    CLUSTER_CONTEXT=$1
    CHART_NAME=$2

    if [ -z $CLUSTER_CONTEXT ]; then
        echo "CLUSTER_CONTEXT needs to be specified as argument 1"
                return 0
    fi

    if [ -z $CHART_NAME ]; then
        echo "CHART_NAME needs to be specified as argument 2"
                return 0
    fi

        export MONO_REPO_PATH="~/workspace/toradex/ota/ota-mono-repo"
        MONO_REPO_URI=/dev/null ./scripts/helm-install.rb -noclone $CLUSTER_CONTEXT $CHART_NAME
}

