publish:
	helm package pandawa
	helm repo index .
