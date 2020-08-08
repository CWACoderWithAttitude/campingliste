# campingliste

Created lists of stuff in markdown.   
Uses [pandoc](https://github.com/pandoc/dockerfiles) and [asciidoctor](https://hub.docker.com/r/asciidoctor/docker-asciidoctor/) to produce pdfs for printing.

## Integration w Github Actions

When updated versions of markdown files are pushed to this repo an action triggers the `converter.sh` script to generate a new release.
