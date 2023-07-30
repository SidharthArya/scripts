#!/bin/bash
CURRENT_DIR="$(pwd)"
while read -r line;
do
	# Add condition for git if required
	cd $(echo $line | sed "s@^\$HOME@$HOME@g" | sed "s@~@$HOME@g");
	git add .
	git commit -m "Auto Commit: $(date)"
	git push;
done <$HOME/.config/autosync.txt


cd $CURRENT_DIR
