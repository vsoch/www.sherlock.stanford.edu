# Sherlock documentation theme

This branch of the Sherlock repository contains the source files necessary to build the Sherlock documentation theme for http://www.sherlock.stanford.edu/docs
It's based on the [Mkdocs Material](http://squidfunk.github.io/mkdocs-material/) theme.

The following steps are only required if a change is needed in the theme, or to sync it up with upstream. 

The general idea is:
  * check the theme source files out
  * do the modifications
  * preview the changes
  * commit and push to Git

## Getting Started

### Requirements
Some software is required to build the theme:
| Software | Installation |
| --- | --- | 
| [Node.js](https://nodejs.org/en/) | https://nodejs.org/en/download/ |
| [Yarn](http://squidfunk.github.io/mkdocs-material/) | https://yarnpkg.com/en/docs/install |

### Modifying

To modify the source files, you'll need to:

1. clone the `web_theme` branch of Sherlock repo on your local machine:
   ```
   $ git clone https://github.com/stanford-rc/sherlock.git --branch web_theme --single-branch
   ```
2. install the required dependencies with:
   ```
   $ pip install -r requirements.txt
   $ yarn install
   ```

3. start the development server
   ```
   $ yarn start
   ```
   This will start a development server at http://127.0.0.1:8000
 
4. edit the files as needed. 
   * `index.html`: structure and contents
   * `less/shweb.less`: style
 
    Updates will automatically appear at http://127.0.0.1:8000

#### Sync'ing with upstream

To benefit from the changes and fixes from upstream, you'll need to configure a git remote pointing to the [upstream repository](https://github.com/squidfunk/mkdocs-material)
```
$ git remote add -t master theme_upstream https://github.com/squidfunk/mkdocs-material.git
```

Then you can get the changes and merge them with your current changes:
```
$ git fetch theme_upstream
$ git merge theme_upstream/master
```
    
  
### Building

Once you're satisifed with the results, you can build the static files with: 
```
$ yarn run build
```
This will generate the theme files in `/material`, which can then be copied in the documentation source tree ([`/material`](https://github.com/stanford-rc/sherlock/tree/web_docs/material) in the [`web_docs`](https://github.com/stanford-rc/sherlock/tree/web_docs) branch)


### Deploying

Deployment should happen automatically when a change is committed on GitHub. Travis CI will take [care](https://github.com/stanford-rc/sherlock/blob/web_theme/.travis.yml) of everything.
