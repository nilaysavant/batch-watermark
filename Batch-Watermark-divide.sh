#!/bin/bash

# Author : Nilay Savant
# script to watermark (*png) images stored in images directory with logo (logo.png) 
# output images will be named (*-marked.png) 

input_dir="input" # input directory
output_dir="output" # input directory
input_format="png" # image input format
output_format="png" # image output format
logo_file="logo.png" # logo image
logo_gravity="SouthWest" # logo alignment

logo_width=4000
logo_height=601

logo_divide_width=2
logo_divide_height=2

new_width="$((logo_width/logo_divide_width))"
new_height="$((logo_height/logo_divide_height))"

padding=50

logo_cordinates="${padding},${padding},${new_width},${new_height}" # cordinates from bottom (0) and side(0) ie.(x,y,width,height)
convert_bin="convert"

for image in ${input_dir}/*.${input_format}; do
	
	xpath=${image%/*} # get full path
	xbase=${image##*/} # get only base with extension
	xfext=${xbase##*.} # get only extension
	xpref=${xbase%.*} # get prefix (actual name only)

    echo "converting.. "$image
    
	${convert_bin} $image -gravity ${logo_gravity} -draw "image Over ${logo_cordinates} ${logo_file}" ${output_dir}/${xpref}-marked.${output_format}

    echo "done.."
done
