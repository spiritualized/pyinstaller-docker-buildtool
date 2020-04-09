#!/usr/bin/env bash
APP_NAME="smarthash"
APP_PLATFORM="linux"

cd /
git clone https://github.com/spiritualized/smarthash.git
cd /smarthash
pip3 install -r requirements.txt

pyinstaller 	--add-data "Plugins:Plugins" \
				--additional-hooks-dir "hooks" \
				smarthash.py

				#--add-binary /usr/lib/x86_64-linux-gnu/libxcb.so.1:. \

VERSION=`git describe --tags`
FOLDER_NAME="$APP_NAME-$VERSION-$APP_PLATFORM"
mv dist/smarthash "dist/$FOLDER_NAME"
env GZIP=-9 tar cvzf "/releases/$FOLDER_NAME.tar.gz" -C dist "$FOLDER_NAME"

rm -R /smarthash
