"""
Converts mp4 to webm
"""

import os
import ffmpeg

INPUT_FOLDER = "media/1-original/video"
OUTPUT_FOLDER = "media/2-prepared/video/alt"

for filename in os.listdir(INPUT_FOLDER):
    print(filename)
    stream = (ffmpeg
        .input(INPUT_FOLDER + "/" + filename)
        # .output(OUTPUT_FOLDER + "/" + filename + ".webm", **{'qscale:v': 3})
        .output(OUTPUT_FOLDER + "/" + filename + ".webm")
    )
    ffmpeg.run(stream)