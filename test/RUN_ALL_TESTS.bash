## Run all tests in this file

set -u

## Paths
script=$(readlink -f $0)
scriptDir=$(dirname ${script})

## Counters
testCount=0
testsPassed=0

## Test files must start with Test*
for file in ${scriptDir}/Test*; do
	((testCount+=1))
	bash ${file}
	[[ $? -eq 0 ]] && ((testsPassed+=1))
done

## Compute # of failed tests
((testsFailed=testCount-testsPassed))

## Show the results
echo "[ ======== ] Final result, ran ${testCount} tests"
echo "[ PASSED   ] ${testsPassed} tests"
echo "[ FAILED   ] ${testsFailed} tests"
