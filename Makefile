
PLAYBOOK_CMD= ansible-playbook
ANSIBLE_ARGS= -f 10 playbook.yml

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
