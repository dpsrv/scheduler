#!/bin/ash 

cd $DPSRV_HOME/rc
git pull
git status --porcelain |awk '{ print $2 }'|grep -v '/$' | xargs git add
git commit -a -m updated
git push
