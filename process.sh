#!/bin/bash

# process all files beginning with a prefix

# $1 contains the prefix

printf "%10s %10s %10s\n" "# core" "time s" "speed-up" 

files=(${1}*.o*) # gestisce correttamente gli spazi

for f in "${files[@]}" 
do
    # echo "${f}" # if file names contain spaces

    # 3 tasks
    # 1. how many procs?
    # 2. selezionare solo righe con walltime
    # 3. find max walltime
    # p=$(grep 'walltime' "${f}" | wc -l)
    # wt=$(grep 'walltime' "${f}" | awk '{print $NF}' | sort -n | tail -1)

    # # 4. organize output
    # printf "%10s %10f\n" ${p} ${wt}

    awk 'BEGIN{wt=0} /walltime/ {wt=(wt<$NF? $NF : wt); ++p}
         END {printf "%10d %10f\n", p, wt}' "${f}"
    
done | sort -n |
    awk 'NR==1 {x=$2} 
     {printf "%s %10.3f\n", $0, x/$2}'

