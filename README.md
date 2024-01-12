# misc-assets to install PsNR

# Overview

This workflow installs `PsNR` along with all of the dependencies required. It uses `renv.lock` to restore most of the dependencies, and the [pacakge cellar](https://rstudio.github.io/renv/articles/package-sources.html?q=cellar#the-package-cellar) for `PsNR` and `vaplot` pacakges.

The 2 cellar packages are built with slight tweaks to enable a local workflow. 1. The original `PsNR` requires `vaplot` to come from `Remotes: rikardn/vaplot@digits`, we don't want to rely on a GitHub branch so we removed the remote source. 2. `vaplot` was built fresh from the digits branch as a local tarball. This way we can use it as a cellar pacakge without having to install from GitHub every time we set up the environment.

# How it works

1.  Clone this repo

    `git clone https://github.com/A2-ai/misc-assets`

2.  Make sure you have `renv` activated in an RStudio project. The workflow was tested on `renv` 1.0.3.

3.  Move the folder `cellar` as a subfolder of `renv` in your project, so renv detects it when installing the 2 packages.
    `mv -r cellar/ ~/your-project/renv/`

4.  Install all the packages

    `renv::restore()`

5.  Check whether PsNR loads correctly

    `library(PsNR)`
