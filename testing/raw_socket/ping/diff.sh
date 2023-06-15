for i in $(seq 1 18); do echo weights$i; diff ./weights/weights$i.txt ./output/stage$i.txt | wc -l; done
for i in $(seq 1 5); do echo input$i; diff ./inputs/input.txt ./output/image$i.txt | wc -l; done
