alias g='git'
alias v='aws-vault'
export PATH=$PATH:~RQTJ/AppData/Local/aws-vault
export NODE_EXTRA_CA_CERTS=~RQTJ/zscalar.cer
alias dev-db='ssh -N -L 7474:10.79.74.61:7474 -L 7687:10.79.74.61:7687 ec2-user@10.79.74.15 -i ~/.ssh/id_rsa'
alias val-db='ssh -N -L 7474:brainngraph-val.corp.aws.novonordisk.com:7474 -L 7687:brainngraph-val.corp.aws.novonordisk.com:7687 ec2-user@cms.brainngraph-val.corp.aws.novonordisk.com -i ~/.ssh/id_rsa'
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
awsyaml () {
    aws-vault export --format ini "$1" | sed -e "s/\[$1\]/\[default\]/g" | tee ~/.aws/credentials
}
