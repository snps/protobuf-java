JFLAGS = -g -cp .:libs/*
JC = javac

all: Test.class

Test.class: Test.java com/example/tutorial/AddressBookProtos.java
	$(JC) $(JFLAGS) $<

com/example/tutorial/AddressBookProtos.java: addressbook.proto
	docker run --rm -v ${PWD}:/home/proto snps/protoc --java_out=. addressbook.proto

.PHONY: run
run:
	@java -cp .:libs/* Test

.PHONY: clean
clean:
	$(RM) *.class
	$(RM) -rf com
