#SRC =../../../../code/NicWithMacIf/Nic/src
SRC=../../NIC/src/

all:tester

makedir : ./tester.aa
	rm -rf .linked
	mkdir .linked


tester : makedir
	AaLinkExtMem $(SRC)/pipes.aa ./tester.aa | vcFormat > .linked/tester.linked.aa

clean :
	rm -rf .linked
	rm .gsi.aa

PHONY : all clean
