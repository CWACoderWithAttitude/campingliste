#!/bin/sh

input="
misc.md
lebensmittel.md
"


pandoc_image=pandoc/latex:2.6
image_asciidoctor=asciidoctor/docker-asciidoctor
output_format=asciidoc

for i in $input; do 
  filename=${i%.*}
  outname=$filename"."$output_format
  pdf_output=$filename"."pdf

  docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` $pandoc_image $i --to=$output_format -o $outname
  docker run --rm --volume "`pwd`:/documents" $image_asciidoctor asciidoctor-pdf $outname
done
