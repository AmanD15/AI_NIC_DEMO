for i in $(seq 1 18); do sudo python3 SendFile.py ./weights/weights$i.txt; done
for i in $(seq 1 5); do sudo python3 SendFile.py ./inputs/input.txt; done
for i in $(seq 1 18); do sudo python3 RecvFile.py ./output/stage$i.txt $i; done
for i in $(seq 1 5); do sudo python3 RecvFile.py ./output/image$i.txt $i; done
for i in $(seq 1 18); do echo weights$i; diff ./weights/weights$i.txt ./output/stage$i.txt; done
for i in $(seq 1 5); do echo input$i; diff ./inputs/input.txt ./output/image$i.txt; done
