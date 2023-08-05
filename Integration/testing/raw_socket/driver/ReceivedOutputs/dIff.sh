for i in $(ls stage*); do diff -a -y --suppress-common-lines <(nl $i) <(nl ../../../accl_demo/testbench/intermediateOutputs/$i) > diff_$i; done
