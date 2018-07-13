# The 'bash-lib'
Utility functions useful for all BASH scripts.
This collection of functions (asserts, logs, string manipulation..) tries to give you
a coherent bash experience with all bash scripts of your project.

# Contents
This is a developing project and it does not contain much for now.
The plan is to add:
1) string manipulation
2) logging
3) asserts
4) test and test running facilities
5) networking helpers
6) some CLI helpers (countdowns, command line parsers..)

# How to use it
Be careful as many things might not work as expected.

Clone the project using the handle uptop.
Put it into your bash project root into a folder (ex. ThirdParty)
Source the needed files from 'bash-lib'
Use the functions you need.

Example:
```bash
# MyBash script
source "ThirdParty/include/log.bash"

DEBUG=on # this can also be defined in the terminal and exported if needed

cp File /home/me

LOGD "Coppied File to /home/me"

if [ 0 -eq 1 ]
then
  LOGE "1 is really not eqaul to 0.." 
fi
```

# Documentation
As a wise man said once "Tests should be the documentation of your code"
You can find the tests under "test".
They have explicit names and show you which part is tested.

This is meant to be developed in a TDD manner and thus every possible usage should be covered.

To run a test:
```bash
bash TestName.bash
```

Also you can now use the test runner under the test folder:
```bash
./RUN_ALL_TESTS
```
Be careful to launch it in that test folder!

Of course you can make them executable.
In the future, there will be a test runner that takes care of all that.

# This is BETA
Expect many failures for now..
