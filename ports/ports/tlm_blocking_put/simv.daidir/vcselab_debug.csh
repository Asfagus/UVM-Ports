#!/bin/csh -f

cd /home/014538550/273/ports/tlm_blocking_put

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/apps/synopsys/vcs/R-2020.12/linux/bin/vcselab $* \
    -o \
    simv \
    -nobanner \

cd -

