# Sherlock landing webpage

This branch of the Sherlock repository contains the source files necessary to build the Sherlock landing webpage at http://www.sherlock.stanford.edu
It's loosely based on the [Agency](http://startbootstrap.com/template-overviews/agency/) [Bootstrap](http://getbootstrap.com/) template.

## Getting Started

### Requirements

* [NPM](https://www.npmjs.com/): `# apt-get install npm`
* [Gulp](http://gulpjs.com/): `# apt-get install gulp`

### Modifying

To modify the source files, you'll need to:

1. clone the `web_landing` branch of Sherlock repo on your local machine:
```
$ git clone https://github.com/stanford-rc/sherlock.git --branch shweb_landing --single-branch

```
2. run `npm install` in the root directory
3. run `gulp dev` 
4. edit the files as needed: 
  * `index.html`: structure and contents
  * `less/shweb.less`

To update the plugins: `npm update` 

### Building

Once you're satisifed with the results, you can build the static files with: `gulp build`

### Deploying

Deployment should happen automatically when a change is committed on GitHub.

TBW
