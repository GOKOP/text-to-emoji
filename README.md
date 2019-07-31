Bash script to replace text with emoji that contain appropiate letters, if possible.

Usage:
```
./text-to-emoji.sh "The most boring sentence in the world."
```

Requires basic stuff like bash (obviously), bc, awk, grep, cat and head.
You most likely have these installed already.

If you can run all of the above on Windows then the script will work there.
Otherwise nope.

It runs into a problem when given regex characters;
I use regex when matching a snippet of user input to check if it's at a line beginning.
Because of that, any regex in the actual snippet also gets interpreted and output doesn't look as it should.
Currently I'm not too sure how to solve this 
(exhaustive function escaping any regex seems ridiculous to me but maybe it's the solution)
so I moved to a [go rewrite](https://github.com/GOKOP/text-to-emoji-go) which doesn't have this problem.
It runs faster too
