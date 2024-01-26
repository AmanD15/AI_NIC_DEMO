for i in $(seq 1 18); do sudo python3 SendFile.py ./weights/weights$i.txt; done
for j in $(seq 1 4);
	do for i in $(seq 1 5); do sudo python3 SendFile.py ./inputs/input.txt; done;
done
for j in $(seq 1 4);
	do sudo python3 RecvFile.py ./ReceivedOutputs/final_output$j.txt $j;
done;
#for i in $(seq 1 1); do sudo python3 RecvFile.py ./ReceivedOutputs/stage$i.txt $i; done
#sudo python3 RecvFile.py ./ReceivedOutputs/stage2_prepool.txt 2_prepool
#for i in $(seq 2 3); do sudo python3 RecvFile.py ./ReceivedOutputs/stage$i.txt $i; done
#sudo python3 RecvFile.py ./ReceivedOutputs/stage4_prepool.txt 4_prepool
#for i in $(seq 4 5); do sudo python3 RecvFile.py ./ReceivedOutputs/stage$i.txt $i; done
#sudo python3 RecvFile.py ./ReceivedOutputs/stage6_prepool.txt 6_prepool
#for i in $(seq 6 18); do sudo python3 RecvFile.py ./ReceivedOutputs/stage$i.txt $i; done

a=./ouput_stage_wise/stage
b=../../accl_demo/testbench/intermediateOutputs/stage

#for i in $(seq 1 18); do sudo python3 SendFile.py ./weights/weights$i.txt; done
#for i in $(seq 1 5); do sudo python3 SendFile.py ./inputs/input.txt; done
#for i in $(seq 1 1); do sudo python3 RecvFile.py $a$i.txt $i; sudo python3 SendFile.py $b$i.txt $i; done
#sudo python3 RecvFile.py ${a}2_prepool.txt $i
#sudo python3 SendFile.py ${b}2_prepool.txt $i
#for i in $(seq 2 3); do sudo python3 RecvFile.py $a$i.txt $i; sudo python3 SendFile.py $b$i.txt $i; done
#sudo python3 RecvFile.py ${a}4_prepool.txt $i
#sudo python3 SendFile.py ${b}4_prepool.txt $i
#for i in $(seq 4 5); do sudo python3 RecvFile.py $a$i.txt $i; sudo python3 SendFile.py $b$i.txt $i; done
#sudo python3 RecvFile.py ${a}6_prepool.txt $i
#sudo python3 SendFile.py ${b}6_prepool.txt $i
#for i in $(seq 6 18); do sudo python3 RecvFile.py $a$i.txt $i; sudo python3 SendFile.py $b$i.txt $i; done


