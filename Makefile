
PLAYBOOK_CMD= ansible-playbook
ANSIBLE_ARGS= --vault-password-file vault_password.txt -f 10 playbook.yml

all:
	${PLAYBOOK_CMD} ${ANSIBLE_ARGS} --skip-tags bootstrap

lint:
	yamllint *.yml */*.yml
	ansible-lint
	ansible-playbook --syntax-check playbook.yml

install:
	ansible-galaxy install --role-file roles/requirements.yml

bootstrap:
		${PLAYBOOK_CMD} ${ANSIBLE_ARGS} -t bootstrap

3dps:
	${PLAYBOOK_CMD} ${ANSIBLE_ARGS} --skip-tags bootstrap -l threedpsocial01.vs.mythic-beasts.com

try:
	${PLAYBOOK_CMD} ${ANSIBLE_ARGS} --skip-tags bootstrap -l manyfold01.vs.mythic-beasts.com
