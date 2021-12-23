# Contributing to smi-anon-minimal

## Releasing

Use the included script to update the version numbers:

```console
$ ./scripts/set-versions.bash 1.2.3
```

Commit, then create a git tag of the same version (without a leading "v") and
push both:

```console
$ git add -u
$ git commit -m "1.2.3"
$ git push
$ git tag 1.2.3
$ git push origin 1.2.3
```
