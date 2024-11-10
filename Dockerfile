FROM python:3.7.17 as build
ADD . /project
WORKDIR /project
RUN pip install -U pip && \
    pip install build twine && \
    python -m build

FROM python:3.7.17
COPY --from=build /project/dist/Sphinx-3.5.4rc1.dev20241110-py3-none-any.whl /tmp/Sphinx-3.5.4rc1.dev20241110-py3-none-any.whl
RUN pip install /tmp/Sphinx-3.5.4rc1.dev20241110-py3-none-any.whl