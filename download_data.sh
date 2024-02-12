#!/bin/bash

function get_data { fasterq-dump $1 -O $1; }

echo "Provide sample datasets"
read -a sample_data
input_sample_data=$(echo "${sample_data[*]}" | tr ' ' ,)

echo "Is a control included - yes or no?"
read control_included

if [ "$control_included" = "yes" ];
then
	echo "Provide control datasets";
	read -a control_data;
	input_control_data=$(echo "${control_data[*]}" | tr ' ' ,)
fi

for file in "${sample_data[@]}"; do get_data "$file"; cd "$file"; rm -r *.sra*; cd ..; done;
fi