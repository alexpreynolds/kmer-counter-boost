# kmer-counter-boost

The `kfs` program reads in multiline FASTA records, counts canonical kmers using the [Boost C++ `boost::unordered_map`](https://www.boost.org/) hash table.

## Boost C++

Integration of the Boost C++ kit requires use of [`bazel`](https://www.bazel.build/), *e.g.*, on OS X:

```
$ brew cask install homebrew/cask-versions/java8
$ brew install bazel
```

## Usage

### Compilation

```
$ make kfs
$ make msl
$ make generate_fasta
```

These targets build binaries `bazel-bin/src/kfs`, `bazel-bin/src/msl`, and `bazel-bin/src/generate_fasta`, respectively.

### Test data

```
$ bazel-bin/src/generate_fasta > test.fa
```

(Or build the `generate_test_data` target.)

### Performance testing

Specify variables `K` (integer) and `FASTA` (path to FASTA sequences), before running tests with those variables, *e.g.*:

```
$ export K=29
$ export FASTA=test.fa
$ /usr/bin/time -l bazel-bin/src/kfs -k ${K} -i ${FASTA}
...
```

Etc.
