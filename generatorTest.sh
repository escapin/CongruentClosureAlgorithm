#!/bin/bash
javac formulaGenerator.java
tmp=$(make all)
	
	echo "Clauses;Nodes;Edges;Result;Time;Result(heur);Time(heur)" > testResult.csv
	echo -e "\t;\t;\t;\t;\t;\t" >> testResult.csv

echo "Test with random clauses"
for clauses in 6 10 16 32 48 64 128 160 256 384 512 768 1024 1152 1280
do
	echo -n -e "\r\tTest with $clauses clauses (with heuristics)     " 
	java -Xmx512m formulaGenerator $clauses 4 > .formulaTemp.t.xt
	java -jar CCAlgorithm.jar -h .formulaTemp.t.xt > .outputTemp.t.xt
	
	nNode=$(grep "DAG" .outputTemp.t.xt | egrep -o '[0-9]+' | head -n1 )
	nEdges=$(grep "DAG" .outputTemp.t.xt | egrep -o '[0-9]+' | head -n2 | tail -n1)
	result1=$(grep "SAT" .outputTemp.t.xt)
	time1=$(tail -n1 .outputTemp.t.xt | cut -f2 -d"(" | cut -f1 -d"m" )
	
	echo -n -e "\r\tTest with $clauses clauses (without heuristics)"
	java -jar CCAlgorithm.jar .formulaTemp.t.xt > .outputTemp.t.xt
	result2=$(grep "SAT" .outputTemp.t.xt)
	time2=$(tail -n1 .outputTemp.t.xt | cut -f2 -d"(" | cut -f1 -d"m" )
	
	echo "$clauses;$nNode;$nEdges;$result2;$time2$result1;$time1" >> testResult.csv
done
echo ""
	
	echo -e "\t;\t;\t;\t;\t;\t" >> testResult.csv
	
echo "Test with positives clauses that make a satisfiable formula"
for clauses in 6 10 16 32 48 64 128 160 256 384 512 768 1024 1152 1280
do
	echo -n -e "\r\tTest with $clauses clauses (with heuristics)     "
	 
	java -Xmx512m formulaGenerator $((clauses/3)) 0 0 $((clauses/3)) $((clauses/3)) 0 4 > .formulaTemp.t.xt
	java -jar CCAlgorithm.jar -h .formulaTemp.t.xt > .outputTemp.t.xt
	
	nNode=$(grep "DAG" .outputTemp.t.xt | egrep -o '[0-9]+' | head -n1 )
	nEdges=$(grep "DAG" .outputTemp.t.xt | egrep -o '[0-9]+' | head -n2 | tail -n1)
	result1=$(grep "SAT" .outputTemp.t.xt)
	time1=$(tail -n1 .outputTemp.t.xt | cut -f2 -d"(" | cut -f1 -d"m" )
	
	echo -n -e "\r\tTest with $clauses clauses (without heuristics)"
	java -jar CCAlgorithm.jar .formulaTemp.t.xt > .outputTemp.t.xt
	result2=$(grep "SAT" .outputTemp.t.xt)
	time2=$(tail -n1 .outputTemp.t.xt | cut -f2 -d"(" | cut -f1 -d"m" )
	
	echo "$clauses;$nNode;$nEdges;$result2;$time2$result1;$time1" >> testResult.csv
done
echo ""

rm -f .formulaTemp.t.xt
rm -f .outputTemp.t.xt

