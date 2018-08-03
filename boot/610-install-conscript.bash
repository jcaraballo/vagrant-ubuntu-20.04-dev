#!/bin/bash

echo Installing conscript: environment variables
echo 'export CONSCRIPT_HOME="$HOME/.conscript"' >> .bashrc
echo 'export CONSCRIPT_OPTS="-XX:MaxPermSize=512M -Dfile.encoding=UTF-8"' >> .bashrc
echo 'export PATH=$CONSCRIPT_HOME/bin:$PATH' >> .bashrc

echo "Installing conscript: Executing conscript's setup.sh to install to ~/.conscript/bin/cs"
wget https://raw.githubusercontent.com/foundweekends/conscript/master/setup.sh -O - | sh
