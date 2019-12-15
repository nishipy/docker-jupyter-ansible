#!/bin/bash
# PASSWORD=$JN_PASSWORD
# PORT=$JN_PORT
# IP=$JN_IP
# NOTEBOOKDIR=$JN_DIR
# eval "$(pyenv init -)" && jupyter notebook --NotebookApp.password="" --NotebookApp.token="$PASSWORD"  --no-browser --port=$PORT --ip=$IP --allow-root --notebook-dir=$NOTEBOOKDIR

ansible-playbook --version