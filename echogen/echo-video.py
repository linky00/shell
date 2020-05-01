import os
import moviepy.editor as editor
import random

INPUT_FOLDER = "media/2-prepared/video"
OUTPUT_FOLDER = "media/3-echoes/video"
CLIPS_PER_VIDEO = 3
MIN_LENGTH = 3.0
MAX_LENGTH = 7.0

for filename in os.listdir(INPUT_FOLDER):
    for i in range(CLIPS_PER_VIDEO):
        clip = editor.VideoFileClip(INPUT_FOLDER + "/" + filename)
        desired_length = random.uniform(MIN_LENGTH, min(MAX_LENGTH, clip.duration))
        subclip_start = random.uniform(0.0, clip.duration - desired_length)
        subclip_end = subclip_start + desired_length
        print(f"file {filename}")
        print(f"clip {i}")
        print(f"length {desired_length}")
        print(f"start {subclip_start}")
        print(f"end {subclip_end}")
        subclip = clip.subclip(subclip_start, subclip_end)
        name, extension = os.path.splitext(filename)
        subclip.write_videofile(OUTPUT_FOLDER + "/" + name + "-" + str(i) + extension)
