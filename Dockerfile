FROM jupyterhub/jupyterhub

RUN buildDeps='git' \
    && set -x \
    && apt-get update && apt-get install -y $buildDeps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && pip install git+git://github.com/jupyterhub/ldapauthenticator dockerspawner jupyterhub-idle-culler \
    && apt-get purge -y --auto-remove $buildDeps
