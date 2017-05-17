# Sherlock landing webpage
[![Build Status](https://travis-ci.com/stanford-rc/sherlock.svg?token=uginarQXUTdAZXLFvqnS&branch=web_landing)](https://travis-ci.com/stanford-rc/sherlock)

This branch of the Sherlock repository contains the source files necessary to build the Sherlock landing webpage at http://www.sherlock.stanford.edu
It's loosely based on the [Agency](http://startbootstrap.com/template-overviews/agency/) [Bootstrap](http://getbootstrap.com/) template.

The following steps are only required if a change is needed in the landing page.

The general idea is:
  * check the source files out
  * do the modifications
  * preview the changes
  * commit and push to Git


## Getting Started

### Requirements

| Software | Installation |
| --- | --- | 
| [NPM](https://www.npmjs.com/) | `# [apt-get\|yum] install npm` |
| [Gulp](http://gulpjs.com/) | `# npm install gulp-cli` |

### Modifying

To modify the source files, you'll need to:

1. clone the `web_landing` branch of Sherlock repo on your local machine:
   ```
   $ git clone https://github.com/stanford-rc/sherlock.git --branch web_landing --single-branch
   ```
2. run `npm install` in the root directory

3. start the development server
   ```
   $ gulp dev
   ```
   This will start a development server at http://127.0.0.1:3000
 
4. edit the files as needed. 
   * `index.html`: structure and contents
   * `less/shweb.less`: style
 
    Updates will automatically appear at http://127.0.0.1:3000

To update the plugins: `npm update` 

### Building

Once you're satisifed with the results, you can build the static files with: 
```
$ gulp build
```

### Deploying

Deployment should happen automatically when a change is committed on GitHub.

This will generate the compiled landing page files in `/build`, which can then be copied in the documentation source tree ([`/src`](https://github.com/stanford-rc/sherlock/tree/web_docs/src) in the [`web_docs`](https://github.com/stanford-rc/sherlock/tree/web_docs) branch)

Don't forget to commit the changes!

```
$ git commit 
```

### Deploying

Deployment should happen automatically when a change is committed on GitHub. Travis CI will take [care](https://github.com/stanford-rc/sherlock/blob/web_landing/.travis.yml) of the following steps:
  * build the landing page from the freshly-committed source files, 
  * checkout the `web_docs` branch
  * copy the compiled page to the source directory (`src/`) in the `web_docs` branch
  * commit the changes in the `web_docs` branch
  
If everything goes well, the automated Travis CI commit should trigger a new build of the whole documentation, with the updated landing page, and a deployment to the website.
