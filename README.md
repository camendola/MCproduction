```
cmsrel CMSSW_9_4_6patch1
cd CMSSW_9_4_6patch1/src/
cmsenv
git cms-addpkg Configuration/Generator
scram b -j 8
git clone git@github.com:camendola/MCproduction.git
```