# Sherlock documentation theme

This branch of the Sherlock repository contains the source files necessary to build the Sherlock documentation theme for http://www.sherlock.stanford.edu/docs
It's based on the [Mkdocs Material](http://squidfunk.github.io/mkdocs-material/) theme.

The following steps are only required if a change if needed in the theme, or to sync it up with upstream.


## Getting Started

### Requirements

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

3. run `yarn start`. This will start a development server at http://0.0.0.0:8000
 
4. edit the files as needed, and Updates should automatically appear at http://0.0.0.0:8000
  * `index.html`: structure and contents
  * `less/shweb.less`: style
    
  
### Building

Once you're satisifed with the results, you can build the static files with: `yarn run build`
This will generate the theme files in `/material`, which can then be copied in the documentation source tree ([`/theme`](https://github.com/stanford-rc/sherlock/tree/web_docs/theme) in the [`web_docs`](https://github.com/stanford-rc/sherlock/tree/web_docs) branch)


### Deploying

Deployment should happen automatically when a change is committed on GitHub.

TBW

