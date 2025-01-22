# JPlag Docker

A simple Docker container to run [JPlag code similarity tool](https://github.com/jplag/JPlag).

## Running

When running the container, all options are passed to the JPlag CLI.
The only option that is preset is `--result-file`, which is set to `out`.

For example, you can get the help prompt with:
```sh
docker run --rm -it ghcr.io/edulinq/jplag-docker --help
```

You should mount your files in the `/jplag` directory.
A full invocation using source files in your `./src` directory may look something like:
```sh
docker run --rm -it -v "$PWD:/jplag" ghcr.io/edulinq/jplag-docker --mode RUN --csv-export --language python3 -t 6 ./src
```

See the [entrypoint.sh](./scripts/entrypoint.sh) script for exact details on how JPlag is invoked.

## Licensing

This repository is provided under the MIT licence (include in [LICENSE](./LICENSE).
JPlag is covered by the [GPL-3 License](https://github.com/jplag/JPlag/blob/main/LICENSE).
This project does not distribute the source of JPlag,
but does include a distribution (jar) as part of the Docker image.
