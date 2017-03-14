#!/bin/sh
# Todd Houle
# 1Dec2016

#builds an installer to distribute to clients.  No client configuration is required.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pkgbuild --root "$DIR/llupdatetool" --identifier "edu.mit.ll.ISD.llupdatetool.pkg" --scripts "$DIR/Scripts" --install-location "/" "$DIR/LLUpdateTool.pkg"

open "$DIR"

