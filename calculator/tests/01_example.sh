#!/usr/bin/env bash

# (The absolute path to the program is provided as the first and only argument.)
CALCULATOR=$1

echo "We've set up a GitHub Actions Workflow that will run all"
echo "of the shell scripts in this directory as a series of tests."
echo
echo "To fail any test, you should use the exit 1 command;"
echo "To end a test early as a success, you should use the exit 0 command."

echo "Invoke your program with the \$CALCULATOR variable; an example is below"


# Test 01: Ensure the program runs without error with a simple, valid invocation.
if ! $CALCULATOR 1 + 1; then  # If the return code of $PROGRAM is non-zero (i.e. error)...
  echo 'ERROR! A valid run of the calculator (1 + 1) failed!'
  exit 1
fi

# Test 02: Ensure simple case has correct output...
if [[ $($CALCULATOR 1 + 1) -ne 2 ]]; then  # If the output of the program is not 2...
  echo 'ERROR! A valid run of the calculator (1 + 1) failed to produce 2 as an output!'
  exit 1
fi

# Test 03: Ensure program errors with an invalid operand
if $CALCULATOR 3 @ 2; then  # If the return code of $PROGRAM is zero (i.e. success)...
  echo 'ERROR! An invalid run of the application (3 @ 2) apparently succeeded?!'
  exit 1
fi

# Test 04: Ensure simple case of subtraction has correct output...
if [[ $($CALCULATOR 2 - 1) -ne 1 ]]; then  # If the output of the program is not 1...
  echo 'ERROR! A valid run of the calculator (2 - 1) failed to produce 1 as an output!'
  exit 1
fi

# Test 05: Ensure simple case of multiplication has correct output...
if [[ $($CALCULATOR 2 * 5) -ne 10 ]]; then  # If the output of the program is not 10...
  echo 'ERROR! A valid run of the calculator (2 * 5) failed to produce 10 as an output!'
  exit 1
fi

# Test 06: Ensure simple case of division has correct output...
if [[ $($CALCULATOR 10 / 5) -ne 2 ]]; then  # If the output of the program is not 2...
  echo 'ERROR! A valid run of the calculator (10 / 5) failed to produce 2 as an output!'
  exit 1
fi

# Test 07: Ensure the program runs without error given the first value is negative...
if [[ $($CALCULATOR -2 + 5) -ne 3 ]]; then  # If the output of the program is not 3...
  echo 'ERROR! A valid run of the calculator (-2 + 5) failed to produce 3 as an output!'
  exit 1
fi

# Test 08: Ensure the program runs without error given the second value is negative...
if [[ $($CALCULATOR 2 - -1) -ne 3 ]]; then  # If the output of the program is not 3...
  echo 'ERROR! A valid run of the calculator (2 - -1) failed to produce 3 as an output!'
  exit 1
fi

# Test 09: Ensure the program runs without error given the output is negative...
if [[ $($CALCULATOR -2 - 5) -ne -7 ]]; then  # If the output of the program is not -7...
  echo 'ERROR! A valid run of the calculator (-2 - 5) failed to produce -7 as an output!'
  exit 1
fi