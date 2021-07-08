#!/bin/bash

# VS Code configuration

if ! command -v code &> /dev/null
then
    echo "ERROR: VS Code cannot be found. Please install VS Code."
else
    # Install VS Code plugins
    code --install-extension 13xforever.language-x86-64-assembly
    code --install-extension ban.spellright
    code --install-extension donjayamanne.githistory
    code --install-extension dseight.disasexpl
    code --install-extension eamodio.gitlens
    code --install-extension esbenp.prettier-vscode
    code --install-extension formulahendry.code-runner
    code --install-extension KevinRose.vsc-python-indent
    code --install-extension luveti.kconfig
    code --install-extension mhutchie.git-graph
    code --install-extension ms-python.python
    code --install-extension ms-python.vscode-pylance
    code --install-extension ms-toolsai.jupyter
    code --install-extension ms-vscode.cpptools
    code --install-extension redhat.vscode-commons
    code --install-extension redhat.vscode-yaml
    code --install-extension streetsidesoftware.code-spell-checker
    code --install-extension streetsidesoftware.code-spell-checker-spanish
    code --install-extension waderyan.gitblame
    code --install-extension yzhang.markdown-all-in-one

    # VS Code as default diff tool
    git config --global diff.tool vscode
    git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'  
fi
