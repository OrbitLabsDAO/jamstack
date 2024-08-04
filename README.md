## PREREQUISITES

npm install
./build.sh

this will create a folder called \_site with your files in it

## ABOUT

Jamstack is a complete rip off https://www.11ty.dev but scaled way back, if it best used
for small sites hosted in a serverless nature (we use cloudflare).

It is small and fast have a look at buildit.js (thats the whole thing) it is 254 lines of code

## USAGE

1 create a njk file in the \_source folder
2 copy an assets folders to the \_source folder (this will pass through)
3 add any vars to \_data/env.js
4 add abd data to \_data/api.js
5 ./build.sh local / prod

## SUPPORTS

nunjucks templates : https://mozilla.github.io/nunjucks/templating.html
frontmatter : https://markdoc.dev/docs/frontmatter
API : can pull data from remote sources

## TODO

in layout dont error id .njk is added (or any extension)
dont error it no env.js
dont error if no api.js
permalink: /work/{{ contentarray.title }}/
outputFolder: work
