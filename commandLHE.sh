#!/bin/bash
source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc630
if [ -r CMSSW_9_3_9_patch1/src ] ; then
    echo release CMSSW_9_3_9_patch1 already exists
else
    scram p CMSSW CMSSW_9_3_9_patch1
fi
cd CMSSW_9_3_9_patch1/src
eval `scram runtime -sh`

#curl -s --insecure https://cms-pdmv.cern.ch/mcm/public/restapi/requests/get_fragment/HIG-RunIIFall17wmLHEGS-01983 --retry 2 --create-dirs -o Configuration/GenProduction/python/HIG-RunIIFall17wmLHEGS-01983-fragment.py
#[ -s Configuration/GenProduction/python/HIG-RunIIFall17wmLHEGS-01983-fragment.py ] || exit $?;

scram b
cd ../../
cmsDriver.py Configuration/python/fragmentLHE_ggF_HH_1jet_cfi.py --fileout file:HIG-RunIIFall17wmLHEGS-01983.root --mc --eventcontent RAWSIM,LHE --datatier GEN-SIM,LHE --conditions 93X_mc2017_realistic_v3 --beamspot Realistic25ns13TeVEarly2017Collision --step LHE,GEN,SIM --nThreads 8 --geometry DB:Extended --era Run2_2017 --python_filename HIG-RunIIFall17wmLHEGS-01983_1_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 810 || exit $? ;

