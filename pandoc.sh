#!/bin/sh

input=README.md
input=misc.md
input="
misc.md
lebensmittel.md"


image=pandoc/latex:2.6
output_format=ascii
output_format=markdown
output_format=markdown_github
output_format=pdf
output_format=asciidoc
outname=${input%.*}
outname=$outname"."$output_format

for i in $input; do 
  outname=${i%.*}
  outname=$outname"."$output_format
#  echo \
  docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` $image $i --to=$output_format	-o $outname #pandoc/latex:2.6 $i	#README.md
#  echo \
  asciidoctor $outname
done
