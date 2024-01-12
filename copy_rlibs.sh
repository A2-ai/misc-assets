#!/bin/bash

echo "Creating /opt/PsN/5.3.1/PsN_5_3_1/rlibs"
sudo mkdir -p /opt/PsN/5.3.1/PsN_5_3_1/rlibs

echo "Copying all rlibs to /opt/PsN/5.3.1/PsN_5_3_1/rlibs"
sudo cp -r renv/library/R-4.3/x86_64-pc-linux-gnu/* /opt/PsN/5.3.1/PsN_5_3_1/rlibs
echo "Done!"