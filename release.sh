#!/bin/bash
git pull
# update changelog
cd ./src/ng-select/
node ../../node_modules/standard-version/bin/cli.js --infile ../../CHANGELOG.md
cd ..

# build lib
yarn run build

# push tags
git push --follow-tags origin master

# push to npm
cp README.md ./dist/ng-select/
cd ./dist/ng-select/
yarn publish --access=public
