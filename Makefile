JFLAGS = -g -sourcepath proto -cp .:libs/*
JC = javac

all: Test.class

Test.class: Test.java proto/com/example/tutorial/AddressBookProtos.java
	$(JC) $(JFLAGS) $<

proto/com/example/tutorial/AddressBookProtos.java: addressbook.proto
	mkdir proto
	docker run --rm -v ${PWD}:/home/proto snps/protoc --java_out=proto addressbook.proto

.PHONY: run
run:
	@java -cp .:libs/*:proto Test

.PHONY: clean
clean:
	$(RM) *.class
	$(RM) -rf proto 
