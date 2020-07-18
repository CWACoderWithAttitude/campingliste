#!/bin/sh

input="
misc.md
lebensmittel.md
"


pandoc_image=pandoc/latex:2.6
image_asciidoctor=asciidoctor/docker-asciidoctor
output_format=ascii
output_format=markdown
output_format=markdown_github
output_format=pdf
output_format=asciidoc
outname=${input%.*}
outname=$outname"."$output_format

for i in $input; do 
  filename=${i%.*}
  outname=$filename"."$output_format
  pdf_output=$filename"."pdf
#  echo \
  docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` $pandoc_image $i --to=$output_format -o $outname
# works, but table w/o lines...
#  echo \
#  docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` $image $i -t latex	-o $pdf_output --metadata pagetitle="$filename"
#  echo \
#  asciidoctor $outname
  #asciidoctor -r asciidoctor-pdf -b pdf $outname
  docker run --rm -v "`pwd`:/documents" $image_asciidoctor asciidoctor-pdf $outname
done
