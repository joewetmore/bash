# Install prereqs
#
#  Install HomeBrew, ffmpeg and gifsicle
#		  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#     brew install ffmpeg
#     brew install gifsicle
#
# chmod +x convert_mp4_to_gif.sh
#

#!/bin/bash

# Loop over all MP4 files in the current directory
for file in *.mp4; do
    # Extract the base name (without extension) of the file
    base_name="${file%.*}"

    # Convert MP4 to GIF using ffmpeg and gifsicle
    ffmpeg -ss 00:00:00.000 -i "$file" -pix_fmt rgb8 -r 10 "${base_name}.gif" && gifsicle -O3 "${base_name}.gif" -o "${base_name}.gif"

    # Check if the conversion was successful
    if [ $? -eq 0 ]; then
        echo "Successfully converted $file to ${base_name}.gif"
    else
        echo "Failed to convert $file"
    fi
done
