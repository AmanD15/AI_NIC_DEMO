if test -f ./receivedData/final_output.txt; then
    rm -f ./receivedData/final_output.txt
fi

# for i in $(seq 1 5); do sudo python3 SendFile.py ./weights/weights$i.txt; done

for i in $(seq 1 10000); 
do 
    sudo python3 send_receive.py ./images/inputs$i.txt ./receivedData/final_output.txt; 
    # sudo python3 RecvFile.py ./receivedData/final_output.txt;
done
