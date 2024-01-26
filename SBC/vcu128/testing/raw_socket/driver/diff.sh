for i in $(ls ReceivedOutputs/ | grep stage*); do diff -a -y -s --suppress-common-lines ReceivedOutputs/$i ExpectedOutputs/$i --width=1; done
