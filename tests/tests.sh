#! /bin/sh

cd $(dirname $0)

PATH=../bin:$PATH

{
    genancestor -uMAM4 human.fa chimp.fa orang.fa
    rm genancestor-*.maf
    genancestor -P2 human.fa chimp.fa orang.fa hominini
    cat hominini.*
    genancestor -d1 -i0 hominini.fa orang.fa macaque.fa hominoidea
    cat hominoidea.*
    genancestor-compose hominini.seg hominoidea.seg
    rm hominini.* hominoidea.*
    genancestor-edit -i1000 h22c.maf h22o.maf h22.fa
} | diff -u tests.txt -
