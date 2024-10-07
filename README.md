# genancestor

This is a software pipeline to roughly reconstruct ancestral DNA
sequences.  It requires [LAST][] to be installed (in your PATH).

It may be useful for finding [ancient homologies][] or genetic fossils
(e.g. [paleovirology][]).

## Simple usage (substitutions only)

Give it three related genomes, for example: human, chimp, and
orangutan mitochondrial genomes (which are in the `tests` directory):

    genancestor human.fa chimp.fa orang.fa > hominini.fa

The output is the same as the 1st (human) genome, except that, where
chimp and orang have the same base that's different from human, the
chimp/orang base is used.

You can run it again to get older ancestors:

    genancestor hominini.fa orang.fa gibbon.fa > hominidae.fa

This usage doesn't consider insertions or deletions, which is
convenient: coordinates in the ancestor and descendant are the same.

### Cache files

It also makes files with names like `genancestor-16569-orang.maf`.
This has the human-orang alignments.  (16569 is the length of
`human.fa`).

These files avoid slow, redundant computation.  For example, in the
2nd genancestor command, it's not necessary to align `orang.fa` to
`hominini.fa`: the human-orang alignments can be re-used instead.

## Insertions & deletions

To handle insertions and deletions, give it three genomes and an
output name:

    genancestor human.fa chimp.fa orang.fa hominini

It will make 2 files: `hominini.fa`, and `hominini.seg` (which has the
hominini-human alignments in [seg][] format).  It won't make cache
files.

If you run it again:

    genancestor hominini.fa orang.fa gibbon.fa hominidae
    genancestor hominidae.fa gibbon.fa macaque.fa hominoidea

You'll have seg files with hominini-human, hominidae-hominini, and
hominoidea-hominidae alignments.  You may want the hominoidea-human
alignments, which you can get like this:

    genancestor-compose hominini.seg hominidae.seg hominoidea.seg > hominoidea-human.seg

You can give it any number of seg files, but they must be in
young-to-old order.  It requires requires [seg-suite][seg] to be
installed (in your PATH).

## genancestor options

- `-P NUM`: number of parallel threads.

- `-u SEED`: [seeding scheme] to use for distantly-related genomes (>
  15% substitutions).  The default is `YASS`.  `MAM4` makes it more
  sensitive, but slow and memory-consuming.

- `-L`: Omit any alignment not near (in both sequences) to other
  alignments.  This uses [maf-linked][], which must be be installed
  (in your PATH).

- `-d LENGTH`: maximum length of deletion to undo.  It will undo a
  deletion only if the 2 other genomes have identical un-deleted sequences.

- `-i LENGTH`: maximum length of insertion to undo.

[ancient homologies]: https://doi.org/10.1093/molbev/msad275
[LAST]: https://gitlab.com/mcfrith/last
[maf-linked]: https://gitlab.com/mcfrith/protein-fossils
[paleovirology]: https://en.wikipedia.org/wiki/Paleovirology
[seg]: https://github.com/mcfrith/seg-suite
[seeding scheme]: https://gitlab.com/mcfrith/last/-/blob/main/doc/last-seeds.rst
