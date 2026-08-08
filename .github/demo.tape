# VHS tape (https://github.com/charmbracelet/vhs) — records docs/demo.gif
# for the README. Run by the "demo" workflow; the programs execute for real.

Output demo.gif

Set FontSize 16
Set Width 960
Set Height 540
Set Padding 12
Set TypingSpeed 35ms

Type "make -C pwordcount"
Enter
Sleep 1.5s
Type "cd pwordcount && ./pwordcount input.txt"
Enter
Sleep 3s

Type "cd ../cpmfs && make"
Enter
Sleep 1.5s
Type "./cpmRun"
Enter
Sleep 4s

Type "cd ../aubatch && make && gcc -o micro micro.c"
Enter
Sleep 2s
Type "./aubatch"
Enter
Sleep 1.5s
Type "run ./micro 3 1"
Enter
Sleep 1s
Type "run ./micro 2 5"
Enter
Sleep 1s
Type "list"
Enter
Sleep 2s
Type "sjf"
Enter
Sleep 1.5s
Type "quit"
Enter
Sleep 6s
