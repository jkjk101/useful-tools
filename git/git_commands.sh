#!/bin/bash

# config
git config --list
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# save credentials
git config --global credential.helper store
git config --global credential.helper 'cache --timeout=3600'

# init 
git init

# set remote
git remote add origin <remote-url>
git remote -v

# clone
git clone <remote-url>

# status
git status
git diff
git log

# branch
git checkout -b <new-branch-name>
git checkout <exisiting-branch-name>

# delete local branch
git branch -d <branch-name>
# delete remote branch
git push origin --delete <branch-name>

# commit
git pull
git add .
git commit -m "commit message"
git commit --amend
git push

# stash
git stash .
git stash pop
git stash drop
git stash apply
git stash list

# rebase
git rebase -i HEAD~n
git push --force

# reset local
git reset --soft HEAD~n

# reset remote head
git reset --hard origin