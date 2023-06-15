for i in $(ls stage*); do echo $i; diff -a -y --suppress-common-lines <(nl $i) <(nl ../../../accl_demo/testbench/intermediateOutputs/$i) > diff_$i; done
