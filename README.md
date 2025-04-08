## PREREQUISITES

npm install
./build.sh

this will create a folder called \_site with your website in it

## ABOUT

Jamstack is a complete rip off https://www.11ty.dev but scaled way back, if it best used
for small sites hosted in a serverless nature (we use cloudflare).

It is small and fast have a look at buildit.js (thats the whole thing) it is 254 lines of code (7k) and sits snugly in any CD / CI infrastructure.

## USAGE

1 create a njk file in the \_source folder

2 copy an assets folders to the \_source folder (this will pass through)

3 add any vars to \_data/env.js

4 add abd data to \_data/api.js

5 create a \_source file if required

6 ./build.sh init

7 replace the example assets folder in \_source with your own code

8 ./build.sh local / prod

## SUPPORTS

nunjucks templates : https://mozilla.github.io/nunjucks/templating.html
frontmatter : https://markdoc.dev/docs/frontmatter
API : can pull data from remote sources
JSON : you can load data into into JSON objects into the api.js and they will be available in an array called content.
supports multiple outputs in front matter outputFolder: user,projects will create users/index.html & projects/index.html useful if you are doing Ajax calls to render the data into tables for admins and such

## FRONT MATTER

example front matter

---

layout: layout
pagination:
data: apiData.work
size: 1
alias: contentarray
permalink: /work/{{ contentarray.pageName }}/
outputFolder: /

---

### output folder

outputFolder: user,projects

### layout

will look for a file called layout.njk in the \_includes folder

laoyout: layout

### title

sets the title of the page and the name, outputFolder overrides this

title : Index

### pagination

can be the apiData or content array

pagination:
data: apiData.work
size: 1
alias: contentarray

### permalink

output a permalink (over riders title)

permalink: /work/{{ contentarray.pageName }}/

## TODO

TODO permalink: /work/{{ contentarray.title }}/
TODO outputFolder: work
TODO add an init funciton that creates \_source file and the others required
