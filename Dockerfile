FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://github.com/Cpk0521/CUE-live2d-Viewer.git && \
    cd CUE-live2d-Viewer && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM lipanski/docker-static-website

COPY --from=base /git/CUE-live2d-Viewer .
