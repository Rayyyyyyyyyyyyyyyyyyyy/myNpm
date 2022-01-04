
set -e

yarn build

cd dist

git init
git add .
git commit -m 'deploy'
git push -f https://github.com/rayyyyyyyyyyyyyyyyyyyy/myNpm.git master:gh-pages
cd -