#!/bin/bash
# Config ssh
if [ ! -f $HOME/.ssh/id_rsa ]; then
	source .secret_env
	ssh-keygen -t rsa -b 4096 -N $PASSWORD -C "${GIT_USER_EMAIL}" -f $HOME/.ssh/id_rsa
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa;
	echo "Chave gerada e adicionada ao ssh-agent. Adicione a chave ao seu repositório."
else
	echo "Já existe uma chave SSH configurada."
fi
