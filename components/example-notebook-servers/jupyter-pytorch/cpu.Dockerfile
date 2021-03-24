FROM public.ecr.aws/j1r0q0g6/notebooks/notebook-servers/jupyter:master-2dd0e3e4

# install - requirements.txt
COPY --chown=jovyan:users requirements-cpu.txt /tmp/requirements.txt
RUN python3 -m pip install -r /tmp/requirements.txt --quiet --no-cache-dir -f https://download.pytorch.org/whl/torch_stable.html \
 && rm -f /tmp/requirements.txt