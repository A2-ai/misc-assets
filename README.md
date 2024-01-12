# Prepare R dependencies for PsN

# Overview

This workflow prepares the R dependencies for PsN by installing `PsNR` along with all of the dependencies required. It uses `renv.lock` to restore most of the dependencies, and the [pacakge cellar](https://rstudio.github.io/renv/articles/package-sources.html?q=cellar#the-package-cellar) for `PsNR` and `vaplot` pacakges.

The 2 cellar packages are built with slight tweaks to enable a local workflow. 1. The original `PsNR` requires `vaplot` to come from `Remotes: rikardn/vaplot@digits`, we don't want to rely on a GitHub branch so we removed the remote source. 2. `vaplot` was built fresh from the digits branch as a local tarball. This way we can use it as a cellar pacakge without having to install from GitHub every time we set up the environment.

# How it works

1.  Start an RStudio project and make sure you have `renv` activated. This workflow was tested on `renv` 1.0.3.

2.  Clone this repo in a terminal.

    `git clone https://github.com/A2-ai/misc-assets`

3.  Copy the .Rprofile from `misc-assets` to your project root so it replaces the existing file. This ensures the packages we are going to install to not use cache or symlinks, so we can copy them later on.

    `cp ./misc-assets/.Rprofile .`

    Move the folder `cellar` as a subfolder of `renv` in your project, so `renv` detects it when installing the 2 packages.

    `mv ./misc-assets/cellar/ ./renv/`

4.  Install all the packages in the R console.

    `renv::restore()`

5.  Check whether PsNR loads correctly in R.

    `library(PsNR)`

6.  Copy `copy_rlibs.sh` to project root and run it.

    `cp ./misc-assets/copy_rlibs.sh . && bash copy_rlibs.sh`

7.  We should see 124 folders in `/opt/PsN/5.3.1/PsN_5_3_1/rlibs`

    `ls /opt/PsN/5.3.1/PsN_5_3_1/rlibs | wc -l`
