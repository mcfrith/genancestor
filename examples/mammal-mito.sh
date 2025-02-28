#! /bin/sh

# superfamily Hominoidea
human=NC_012920.1
chimp=NC_001643.1
orangutan=NC_002083.1
gibbon=NC_021957.1
genancestor $human.fa $chimp.fa $orangutan.fa hominini
genancestor hominini.fa $orangutan.fa $gibbon.fa hominidae

# superfamily Cercopithecoidea
macaque=NC_005943.1
baboon=NC_020006.2
guenon=NC_056341.1
snubnosed_monkey=NC_008218.1
langur=NC_008215.1
colobus=NC_006901.1
genancestor $macaque.fa $baboon.fa $guenon.fa papionini
genancestor $snubnosed_monkey.fa $langur.fa $colobus.fa presbytini
genancestor papionini.fa $guenon.fa presbytini.fa cercopithecinae

# parvorder Platyrrhini
marmoset=NC_025586.1
tamarin=NC_064180.1
squirrel_monkey=NC_018096.1
capuchin=NC_064184.1
genancestor $marmoset.fa $tamarin.fa $squirrel_monkey.fa callitrichidae
genancestor $squirrel_monkey.fa $capuchin.fa callitrichidae.fa cebidae

tarsier=NC_012774.1

# superfamily Lemuroidea
ringtailed_lemur=NC_059325.1
ruffed_lemur=NC_084385.1
indri=NC_026095.1
ayeaye=NC_010299.1
genancestor $ringtailed_lemur.fa $ruffed_lemur.fa $indri.fa lemuridae

# superfamily Lorisoidea
slow_loris=NC_002765.1
potto=NC_012764.1
galago=NC_012762.1
genancestor $slow_loris.fa $potto.fa $galago.fa lorisidae

colugo=NC_004031.1

# order Perissodactyla
rhino=NC_001808.1
tapir=NC_023838.1
horse=NC_001640.1
genancestor $rhino.fa $tapir.fa $horse.fa ceratomorpha

# superorder Afrotheria
elephant=NC_000934.1
dugong=NC_003314.1
manatee=NC_010302.1
hyrax=NC_004919.1
aardvark=NC_002078.1
genancestor $manatee.fa $dugong.fa $elephant.fa sirenia
genancestor sirenia.fa $elephant.fa $hyrax.fa tethytheria
genancestor tethytheria.fa $hyrax.fa $aardvark.fa paenungulata

genancestor hominidae.fa $gibbon.fa cercopithecinae.fa hominoidea
genancestor hominoidea.fa cercopithecinae.fa cebidae.fa catarrhini
genancestor catarrhini.fa cebidae.fa $tarsier.fa simiiformes

genancestor lemuridae.fa $ayeaye.fa lorisidae.fa lemuroidea

genancestor simiiformes.fa $tarsier.fa lemuroidea.fa haplorhini
genancestor haplorhini.fa lemuroidea.fa $colugo.fa primates
genancestor primates.fa $colugo.fa ceratomorpha.fa primatomorpha

genancestor primatomorpha.fa ceratomorpha.fa paenungulata.fa boreoeutheria
