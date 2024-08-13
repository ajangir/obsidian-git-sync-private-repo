name: Pull, Merge, and Push
env:
  GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}

on:
  workflow_dispatch:
  schedule:
    - cron: "0 0 * * *"  # Runs every day at midnight UTC

jobs:
  pull_merge_push:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      
      - name: adding github config global
        run: git config user.email "ajayjangir5252@gmail.com";
             git config user.name "Ajay Jangir";

      - name: Fetch all branches
        run: git fetch --all
        
      - name: Checkout master branch
        run: git switch master
        
      - name: Merge win10 branch into master
        run: git merge origin/win10
        
      - name: Merge mobile branch into master
        run: git merge origin/mobile
        
      - name: Push changes to master branch
        run: git push origin master
        
      - name: Checkout mobile branch
        run: git switch mobile
        
      - name: Merge master branch into mobile
        run: git merge origin/master
        
      - name: Push changes to mobile branch
        run: git push origin mobile
        
      - name: Checkout win10 branch
        run: git switch win10
        
      - name: Merge master branch into win10
        run: git merge origin/master
        
      - name: Push changes to win10 branch
        run: git push origin win10
