publish:
	helm package pandawa
	helm package node-app
	helm repo index .
