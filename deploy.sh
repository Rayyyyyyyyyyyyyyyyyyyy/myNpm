
set -e

yarn build


git add .
git commit -m 'update'
git push 

npm publish