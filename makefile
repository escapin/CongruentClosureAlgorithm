build:
	if [ ! -e build/ ]; then mkdir build/ ; fi
	rm -fr build/*
	cp -r src/* build/
	cd build/parser/ ; \
	java -jar ../../javacc.jar parser.jj ; \
	rm -f parser.jj ; 

compile:
	if [ ! -e CCAlgorithm/ ]; then mkdir CCAlgorithm/ ; fi
	rm -fr CCAlgorithm/*
	javac -d . build/bean/*.java build/parser/*.java build/*.java

createJar:
	jar cmf MANIFEST.MF CCAlgorithm.jar CCAlgorithm/

clean:
	rm -fr build CCAlgorithm formulaGenerator.class
	
all: build compile createJar

clall: clean all
