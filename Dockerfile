FROM python:3.12.1 as build
ADD . /project
WORKDIR /project
RUN pip install -U pip && \
    pip install build twine && \
    python -m build

FROM python:3.12.1
COPY --from=build /project/dist/sphinx-7.3.0rc1-py3-none-any.whl /tmp/sphinx-7.3.0rc1-py3-none-any.whl
RUN pip install /tmp/sphinx-7.3.0rc1-py3-none-any.whl