# CTP Anonymiser Minimal

[![main](https://github.com/smi/ctp-anon-minimal/actions/workflows/main.yml/badge.svg)](https://github.com/smi/ctp-anon-minimal/actions/workflows/main.yml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/SMI/ctp-anon-minimal/main.svg)](https://results.pre-commit.ci/latest/github/SMI/ctp-anon-minimal/main)

A minimal re-packaging of the RSNA MIRC Clinical Trials Processor (CTP), mainly
providing the `DICOMAnonymizer` class.

The majority of the package is built from the vendored sources, allowing
dependencies to be updated freely. The remaining dependencies which are
unavailable in source form are:

-   `jai_imageio-1.2-pre-dr-b04.jar`
-   `pixelmed_codec.jar`

## Usage

In a Maven `pom.xml`:

```xml
<dependency>
  <groupId>uk.ac.ed.epcc</groupId>
  <artifactId>ctpanonymiser_minimal</artifactId>
  <version>...</version>
</dependency>
```

## Development

### Building

This has only been tested on Linux so far.

Requirements:

-   Java 8 SDK
-   Maven
-   Ant

After cloning, run `./build/run-all.bash`, which will pull-in the sources and
create the `src-generated` directory.

### Testing

There are 2 test suites:

-   `tests` contains some basic sanity checks against the `src-generated`
    classes. Run these with `mvn test` from the root dir
-   The `integration` directory contains a separate Maven project which pulls-in
    the built jar from the main code as a dependency. The tests in this project
    verify that the jar packaging is valid, and is where most new tests should
    be created. These can be run with `mvn -f ./integration/pom.xml test`

### pre-commit

This repo uses [pre-commit] to manage and automatically run a series of linters
and code formatters. After cloning the repo and changing into the directory, run
this once to setup pre-commit.

```shell
$ pip install pre-commit
$ pre-commit install
```

This will then run the checks before every commit. It can also be run manually
at any time:

```shell
$ pre-commit run [<hook>] (--all-files | --files <file list>)
```

<!-- Links -->

[pre-commit]: https://pre-commit.com
