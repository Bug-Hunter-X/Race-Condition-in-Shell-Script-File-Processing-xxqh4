# Shell Script Race Condition

This repository demonstrates a race condition in a bash script that processes multiple files concurrently. The script uses `find` to locate files and then attempts to process them using `grep`. However, the way the loop is structured can lead to unreliable results.  The `sleep` command highlights this.

## Bug Description
The script's primary issue lies in its handling of the `grep` command's exit code.  Because of the asynchronous nature of the loop, the check of `$?` after `grep` might be checking the exit code of a previous command, leading to incorrect error reporting or omission of errors.

## Solution
The solution ensures that the `grep` command's exit status is correctly associated with its execution before it is evaluated. This is done by moving the code within the loop that handles exit status properly.