# Build Essential

[![version][npm-image]][npm-url] [![Build Status][circle-image]][circle-url] [![Docker Build Status][docker-image]][docker-url] 

> contains a list of packages which are considered essential for building packages in ci platform

## Why

Our [Reference Architecture][] introduces a set of standards around linting, code quality, testing are more ...

Those standards are upheld using a variety of tools, however, projects need to add these individual tools as **dependencies**, which introduces a number of challanges:

### CI Environment

CI tests have to run `npm install` on every project, and the bigger the dependency list, the longer those runs take.

As part of moving to separate [CI & CD][] processes, we have the opportunity to _pre-load_ some of the most common project dependencies into a [Docker container][]

### Local Development

For developers working across multipl projects, having to install the same dependencies over and over for every project adds a layer of inconsistency that can be resolved with [global dependencies][]

## What

- [npm package][]: released as an open source package under `@telus` scope in npm, the [`package.json`][1] file contains a number of pre-selected common dependencies, _(mainly used for linting)_
  > _**Note**: the dependencies are marked as `peerDependencies` to enable some limitations around `eslint` and others in global usage._

- [Docker Container][]: a [`Dockerfile`][2] uses the package above as basis for creating a container used in CI jobs

### Packages

- Configration:
  - `@telus/eslint-config` - Shared [ESLint][] Config
  - `@telus/remark-preset-lint-markdown` - Shared [Remark][] Config
  - `@telus/semantic-release-config` - Shared [Semantic Release][] Config
- Tools:
  - `editorconfig-checker` - [EditorConfig][] validator 
  - `eslint` - [ESLint][] Validator
  - `remark-cli` - [Remark][] is a markdown validator
  - `semantic-release` [Semantic Release][] is a fully automated version management and package publishing tool
  - `updated` - [Updated][] ensures you have the latest dependencies 

- Utilities:
  - [`install-peerdeps`](https://www.npmjs.com/package/install-peerdeps)
  - [`npm-run-all`](https://www.npmjs.com/package/npm-run-all)

## How

### Install Locally

```bash
npm install --global @telus/build-essential
```

> _**Note**: the [`postinstall`][6] step will attempt to install more packages **globally**, a [good way][7] to make this work if you are having permission issues is to set your NPM prefix to somewhere in your homedir (e.g. `~/.npm`) in your config (`~/.npmrc` with `prefix=<dir>`) and to add the `bin/` directory to your `PATH` environment variable. For an example, consider line 15 of the [`Dockerfile`][2]. If you really know what you're doing, but it's not recommended, you could run with `sudo` depending on your local `npm` setup_

### Use in your CI

Use the [Docker Container][3] to run your [lint steps][5] as per the example provided in this project's [cirlce.yml][4]

---
> Github: [@telus](https://github.com/telus) &bull; 
> Twitter: [@telusdigital](https://twitter.com/telusdigital)

[circle-url]: https://circleci.com/gh/telus/build-essential
[circle-image]: https://img.shields.io/circleci/project/github/telus/build-essential/master.svg?style=for-the-badge&logo=circleci

[npm-url]: https://www.npmjs.com/package/@telus/build-essential
[npm-image]: https://img.shields.io/npm/v/@telus/build-essential.svg?style=for-the-badge&logo=npm

[docker-url]: https://hub.docker.com/r/telus/build-essential/
[docker-image]: https://img.shields.io/docker/build/telus/build-essential.svg?label=docker&style=for-the-badge&logo=docker

[ci & cd]: https://github.com/telus/reference-architecture/blob/master/process/ci-cd.md
[docker container]: https://hub.docker.com/r/telus/build-essential/
[editorconfig]: https://editorconfig.org/
[eslint]: https://eslint.org/
[global dependencies]: https://docs.npmjs.com/getting-started/installing-npm-packages-globally
[npm package]: https://www.npmjs.com/@telus/build-essential
[reference architecture]: https://github.com/telus/reference-architecture
[remark]: https://remark.js.org/
[semantic release]: https://semantic-release.gitbook.io
[updated]: https://www.npmjs.com/package/updated

[1]: https://github.com/telus/build-essential/blob/master/package.json#L31-L42
[2]: Dockerfile
[3]: https://github.com/telus/build-essential/blob/master/circle.yml#L7-L8
[4]: https://github.com/telus/build-essential/blob/master/circle.yml#L32-L36
[5]: https://github.com/telus/build-essential/blob/master/package.json#L24-L29
[6]: https://github.com/telus/build-essential/blob/master/package.json#L23
[7]: https://medium.com/@ExplosionPills/dont-use-sudo-with-npm-still-66e609f5f92
