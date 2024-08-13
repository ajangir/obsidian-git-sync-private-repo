## Obsidian Sync using github private repo
cross-platform.

Assumptions:
- you have installed obsidian and git on windows machine
- have Termux installed on android device, 
- have one private repo on github with private access tokens or other types of authentications
- have 3 branches of repo: main, win, mobile
Actions:
1. aliases for quick operation
2. auto task for backup on windows machine
3. github action for auto merging of branches with all types of conflict resolution
### 1.  setting of termux on android

- .bashrc file at ~/
  ~ location = /data/data/com.termux/files
  ```
	GIT_DIR=~/obs-root
	GIT_WORK_TREE=~/storage/shared/obs-root
	cd $GIT_WORK_TREE
	```

- aliases for quick actions added in same .bashrc file
  
```
alias gi='git --git-dir=$GIT_DIR'
alias gs='gi status'
alias pull='gi pull --rebase --autostash'
alias add='gi add -A;gi commit -m "vault backup mobile: $(date "+%F %R")"'
alias push='gi push'
alias b='pull;add;push'
alias e='exit'
```
### 2. for windows machines, obsidian git plugin  works fine, but merges are complicated
- I have to discard the last small changes if those branches divulge from each other too much.
- Option 1: run this command using bat file or add this bashrc commands into profile.ps1 at 
  'C:\Users\ajay-winX\Documents\PowerShell\Microsoft.PowerShell_profile.ps1' and use simple aliases.
- Option 2: make  one task in task scheduler with timing according to your timings and runtimes of machine with action using powershell
  ```
  pwsh.exe -wd "C:\Users\ajay-winX\a_src\github\obs-root" -c "bcp"
  ```

### 3. github action for auto-merging of each branches into main
- save  the github-action.md file into folder .github/workflows/ as merger-branches.yml
- configure the github action and verify
