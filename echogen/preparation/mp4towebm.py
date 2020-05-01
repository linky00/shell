"""
Converts mp4 to webm
"""

import os
import ffmpeg

INPUT_FOLDER = "media/1-original/video"
OUTPUT_FOLDER = "media/2-prepared/video"

for filename in os.listdir(INPUT_FOLDER):
    name, extension = os.path.splitext(filename)
    if extension == ".mp4":
        stream = (ffmpeg
            .input(INPUT_FOLDER + "/" + filename)
            .output(OUTPUT_FOLDER + "/" + name + ".webm")
        )
        ffmpeg.run(stream)