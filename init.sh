#!/bin/bash

#init repo
echo "on README.md >>"
read input
echo "\n$input" >> README.md
#touch LICENSE
echo "\ninit.sh\np.sh\nap.sh\nfr.sh"  >> .gitignore

#init git
git init
echo "repository url >>"
read remote_url
git remote add origin "$remote_url"

#git script
rm -rf p.sh
rm -rf ap.sh
rm -rf fr.sh
echo "#!/bin/bash\n\nif [ -z \"\$1\"]; then\n\techo \"commit message >>\"\n\tread input\n\tgit commit -am \"\$input\"\nelse\n\tgit commit -am \"\$1\"\nfi\n\ngit push -u origin master\n\ngit status" >> p.sh
echo "#!/bin/bash\n\ngit fetch --al\ngit rebase origin/master" >> fr.sh
echo "#!/bin/bash\n\ngit add .\nif [ -z \"\$1\"]; then\n\techo \"commit message >>\"\n\tread input\n\tgit commit -am \"\$input\"\nelse\n\tgit commit -am \"\$1\"\nfi\n\ngit push -u origin master\n\ngit status" >> ap.sh

chmod 777 ./*.sh

#commit 
git add .
git status
git commit -am "init"
git push -u origin master
git status

