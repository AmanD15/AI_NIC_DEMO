import sys
import os

stage_in_file =  [
        "intermediateOctaveInputs/stage1.txt",
        "intermediateOctaveInputs/stage2.txt",
        "intermediateOctaveInputs/stage3.txt",
        "intermediateOctaveInputs/stage4.txt",
        "intermediateOctaveInputs/stage5.txt",
        "intermediateOctaveInputs/stage6.txt",
        "intermediateOctaveInputs/stage7.txt",
        "intermediateOctaveInputs/stage8.txt",
        "intermediateOctaveInputs/stage9.txt",
        "intermediateOctaveInputs/stage10.txt",
        "intermediateOctaveInputs/stage11.txt",
        "intermediateOctaveInputs/stage12.txt",
        "intermediateOctaveInputs/stage13.txt",
        "intermediateOctaveInputs/stage14.txt",
        "intermediateOctaveInputs/stage15.txt",
        "intermediateOctaveInputs/stage16.txt",
        "intermediateOctaveInputs/stage17.txt",
        "intermediateOctaveInputs/stage18.txt"
]
stage_out_file = [
        "intermediateOutputs/stage1.txt",
        "intermediateOutputs/stage2.txt",
        "intermediateOutputs/stage3.txt",
        "intermediateOutputs/stage4.txt",
        "intermediateOutputs/stage5.txt",
        "intermediateOutputs/stage6.txt",
        "intermediateOutputs/stage7.txt",
        "intermediateOutputs/stage8.txt",
        "intermediateOutputs/stage9.txt",
        "intermediateOutputs/stage10.txt",
        "intermediateOutputs/stage11.txt",
        "intermediateOutputs/stage12.txt",
        "intermediateOutputs/stage13.txt",
        "intermediateOutputs/stage14.txt",
        "intermediateOutputs/stage15.txt",
        "intermediateOutputs/stage16.txt",
        "intermediateOutputs/stage17.txt",
        "intermediateOutputs/stage18.txt"
]

cct = [
        "intermediateOutputs/stage2_prepool.txt",
        "intermediateOutputs/stage4_prepool.txt",
        "intermediateOutputs/stage6_prepool.txt",
]

command =  [
    "cat configs/ind1.txt inputs/input.txt ../weights/weights1.txt > "+stage_in_file[0],
    "cat configs/ind2.txt " + stage_out_file[0] +  " ../weights/weights2.txt > "+stage_in_file[1],
    "cat configs/ind3.txt " + stage_out_file[1] + " ../weights/weights3.txt > "+stage_in_file[2],
    "cat configs/ind4.txt " + stage_out_file[2] + " ../weights/weights4.txt > "+stage_in_file[3],
    "cat configs/ind5.txt " + stage_out_file[3] + " ../weights/weights5.txt > "+stage_in_file[4],
    "cat configs/ind6.txt " + stage_out_file[4] + " ../weights/weights6.txt > "+stage_in_file[5],
    "cat configs/ind7.txt " + stage_out_file[5] + " ../weights/weights7.txt > "+stage_in_file[6],
    "cat configs/ind8.txt " + stage_out_file[6] + " ../weights/weights8.txt > "+stage_in_file[7],
    "cat configs/ind9.txt " + stage_out_file[7] + " ../weights/weights9.txt > "+stage_in_file[8],
    "cat configs/ind10.txt " + stage_out_file[8] + " " + cct[2] + " ../weights/weights10.txt > "+stage_in_file[9],
    "cat configs/ind11.txt " + stage_out_file[9] + " ../weights/weights11.txt > "+stage_in_file[10],
    "cat configs/ind12.txt " + stage_out_file[10] + " ../weights/weights12.txt > "+stage_in_file[11],
    "cat configs/ind13.txt " + stage_out_file[11] + " " + cct[1] + " ../weights/weights13.txt > "+stage_in_file[12],
    "cat configs/ind14.txt " + stage_out_file[12] + " ../weights/weights14.txt > "+stage_in_file[13],
    "cat configs/ind15.txt " + stage_out_file[13] + " ../weights/weights15.txt > "+stage_in_file[14],
    "cat configs/ind16.txt " + stage_out_file[14] + " " + cct[0] + " ../weights/weights16.txt > "+stage_in_file[15],
    "cat configs/ind17.txt " + stage_out_file[15] + " ../weights/weights17.txt > "+stage_in_file[16],
    "cat configs/ind18.txt " + stage_out_file[16] + " ../weights/weights18.txt > "+stage_in_file[17]
]

num_stages = 18

for i in range(num_stages):
    print(command[i])
    os.system(command[i])
    if (i in [1,3,5]):
        tmp_val = cct[i//2]
    else:
        tmp_val = ""
    octaveCMD = "octave octaveFile < "+stage_in_file[i]+" > "+tmp_val+" "+stage_out_file[i]
    print(octaveCMD)
    os.system(octaveCMD)
