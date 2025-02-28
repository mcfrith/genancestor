#! /bin/sh

# Turtle genomes evolve slowly, good for studying ancient sequences.
# No doubt, these genome accession numbers will soon be out of date.
# Run time: about 1 day.

P=16  # number of parallel threads: adjust for your computer

# superfamily Testudinoidea
chrysemys=GCF_011386835.1
emys=GCF_028017835.1
aldabrachelys=GCA_026122505.1
genancestor -P$P $chrysemys.fa $emys.fa $aldabrachelys.fa emydidae

# clade Americhelydia
chelonia=GCF_015237465.2
caretta=GCF_023653815.1
dermochelys=GCF_009764565.3
sternotherus=GCA_032164245.1
dermatemys=GCA_007922305.1
macrochelys=GCA_033296515.1
genancestor -P$P $chelonia.fa $caretta.fa $dermochelys.fa cheloniidae
genancestor -P$P $sternotherus.fa $dermatemys.fa $macrochelys.fa kinosternoidea
genancestor -P$P kinosternoidea.fa $macrochelys.fa cheloniidae.fa chelydroidea

# superfamily Trionychia
pelochelys=GCA_032595735.1
rafetus=GCA_019425775.1
carettochelys=GCA_033958435.1
genancestor -P$P $pelochelys.fa $rafetus.fa $carettochelys.fa trionychinae

# suborder Pleurodira
myuchelys=GCA_040894355.1
emydura=GCA_007922225.1
mesoclemmys=GCA_007922155.1
podocnemis=GCA_007922195.1
pelusios=GCA_007922175.1
genancestor -P$P $myuchelys.fa $emydura.fa $mesoclemmys.fa chelodininae
genancestor -P$P $podocnemis.fa $pelusios.fa chelodininae.fa pelomedusoides

# order Crocodilia
crocodile=GCF_001723895.1
gharial=GCF_001723915.1
alligator=GCF_030867095.1
genancestor -P$P $crocodile.fa $gharial.fa $alligator.fa longirostres

genancestor -P$P emydidae.fa $aldabrachelys.fa chelydroidea.fa testudinoidea

genancestor -P$P testudinoidea.fa chelydroidea.fa trionychinae.fa durocryptodira

genancestor -P$P durocryptodira.fa trionychinae.fa pelomedusoides.fa cryptodira

genancestor -P$P cryptodira.fa pelomedusoides.fa longirostres.fa testudines
