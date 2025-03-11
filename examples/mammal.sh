#! /bin/sh

# No doubt, these genome accession numbers will soon be out of date.
# Run time: about 2 days.
# Peak memory use: unfortunately, hundreds of GB (less with fewer threads).

P=8  # number of parallel threads: adjust for your computer

# Try to get a human genome without stupid duplications:

human=hg38_no_alt_no_EBV

h=https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.40_GRCh38.p14/GRCh38_major_release_seqs_for_alignment_pipelines/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz

test -e $human.fa || curl $h | zcat | awk '/^>/ {i = /chrEBV/} !i' > $human.fa

chimp=GCF_028858775.2
orangutan=GCF_028885655.2
siamang=GCF_028878055.3
macaque=GCF_037993035.1
marmoset=GCF_011100555.1
tarsier=GCF_000164805.1

genancestor -P$P $human.fa $chimp.fa $orangutan.fa hominini
genancestor -P$P hominini.fa $orangutan.fa $siamang.fa hominidae
genancestor -P$P hominidae.fa $siamang.fa $macaque.fa hominoidea
genancestor -P$P hominoidea.fa $macaque.fa $marmoset.fa catarrhini
genancestor -P$P catarrhini.fa $marmoset.fa $tarsier.fa simiiformes

# suborder Strepsirrhini
ringtailed_lemur=GCF_020740605.2
ayeaye=GCA_044048945.1
slow_loris=GCF_027406575.1
genancestor -P$P $ringtailed_lemur.fa $ayeaye.fa $slow_loris.fa lemuroidea

colugo=GCF_027409185.1

genancestor -P$P simiiformes.fa $tarsier.fa lemuroidea.fa haplorhini

genancestor -P$P haplorhini.fa lemuroidea.fa $colugo.fa primates

# order Perissodactyla
rhino=GCF_020826845.1
tapir=GCA_031878705.1
horse=GCF_041296265.1
genancestor -P$P $rhino.fa $tapir.fa $horse.fa ceratomorpha

# superorder Afrotheria
elephant=GCF_030014295.1
dugong=GCA_030035585.1
manatee=GCF_000243295.1
hyrax=GCA_028571685.1
aardvark=GCF_000298275.1
genancestor -P$P $manatee.fa $dugong.fa $elephant.fa sirenia
genancestor -P$P sirenia.fa $elephant.fa $hyrax.fa tethytheria
genancestor -P$P tethytheria.fa $hyrax.fa $aardvark.fa paenungulata

genancestor -P$P primates.fa $colugo.fa ceratomorpha.fa primatomorpha

genancestor -P$P primatomorpha.fa ceratomorpha.fa paenungulata.fa boreoeutheria

genancestor-compose hominini.seg hominidae.seg hominoidea.seg catarrhini.seg simiiformes.seg haplorhini.seg primates.seg primatomorpha.seg boreoeutheria.seg > boreoeutheria-human.seg
