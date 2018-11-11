SHELL=/bin/bash

#all: generate_fasta generate_test_data

all: kfs msl generate_fasta generate_test_data

kfs:
	cd src && bazel build //src:kfs --verbose_failures

msl:
	cd src && bazel build //src:msl --verbose_failures

generate_fasta:
	cd src && bazel build //src:generate_fasta --verbose_failures

generate_test_data: bazel-bin/src/generate_fasta
	bazel-bin/src/generate_fasta > test.fa

test_kfs: bazel-bin/src/kfs
	/usr/bin/time -l bazel-bin/src/kfs -k 29 -i test.fa

clean:
	rm -f *~
	rm -f bazel-bin/src/*
	rm -f test.fa