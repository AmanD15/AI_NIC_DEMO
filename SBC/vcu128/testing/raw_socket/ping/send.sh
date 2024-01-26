#for i in $(seq 1 18); do sudo python3 SendFile.py ./weights/weights$i.txt; done
#for i in $(seq 1 5); do sudo python3 SendFile.py ./inputs/input.txt; done
#for i in $(seq 1 1); do sudo python3 RecvFile.py ./output/stage$i.txt $i; done
#sudo python3 RecvFile.py ./output/stage2_prepool.txt $i
#for i in $(seq 2 3); do sudo python3 RecvFile.py ./output/stage$i.txt $i; done
#sudo python3 RecvFile.py ./output/stage4_prepool.txt $i
#for i in $(seq 4 5); do sudo python3 RecvFile.py ./output/stage$i.txt $i; done
#sudo python3 RecvFile.py ./output/stage6_prepool.txt $i
#for i in $(seq 6 18); do sudo python3 RecvFile.py ./output/stage$i.txt $i; done

a=./ouput_stage_wise/stage
b=../../accl_demo/testbench/intermediateOutputs/stage

for i in $(seq 1 18); do sudo python3 SendFile.py ./weights/weights$i.txt; done
for i in $(seq 1 5); do sudo python3 SendFile.py ./inputs/input.txt; done
for i in $(seq 1 1); do sudo python3 RecvFile.py $a$i.txt $i; sudo python3 SendFile.py $b$i.txt $i; done
sudo python3 RecvFile.py ${a}2_prepool.txt $i
sudo python3 SendFile.py ${b}2_prepool.txt $i
for i in $(seq 2 3); do sudo python3 RecvFile.py $a$i.txt $i; sudo python3 SendFile.py $b$i.txt $i; done
sudo python3 RecvFile.py ${a}4_prepool.txt $i
sudo python3 SendFile.py ${b}4_prepool.txt $i
for i in $(seq 4 5); do sudo python3 RecvFile.py $a$i.txt $i; sudo python3 SendFile.py $b$i.txt $i; done
sudo python3 RecvFile.py ${a}6_prepool.txt $i
sudo python3 SendFile.py ${b}6_prepool.txt $i
for i in $(seq 6 18); do sudo python3 RecvFile.py $a$i.txt $i; sudo python3 SendFile.py $b$i.txt $i; done


