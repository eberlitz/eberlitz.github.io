#!/bin/bash
git branch -f gh-pages
git checkout gh-pages
echo 'Created and Checked out gh-pages branch'

git reset --hard origin/master

echo 'Tracking files'
git add -A .
echo 'Commiting files'
git commit -a -m 'gh-pages update'
echo 'Pushing files into gh-pages branch'
git push origin gh-pages --force
git checkout -