Some quick and dirty cmds that can be useful

1. `:echo $HOME` - See HOME path
2. <C-w> s - horizontal split
3. <C-w> v - vertical split
4. <C-w> c - Close window
5. <C-w> w - Cycle window anticlockwise
6. <C-w> W - Cycle window clockwise
7. <C-w> p - Moves to previous window
8. <C-w> T - Focus top left
9. <C-w> B - Focus bottom right
10. <C-w> rR - rotate window clock or anti
11. <C-w> x - exchange window position
12. <C-w> t - move to new Tab
13. <C-w> o - Focus on current window
14. bn - next buffer
15. bp - prev buffer
16. bd - delete buffer
17. - unsave change = readonly % current
18. ba - open all buffer
19. :g/foo/# - find line with foo
20. :g/^$/d - delete blank lines
21. :g/pattern/+y - yank line after the ones that match
22. :g/bacon/normal RANDOM - puts RANDOM before each line has bacon
23. <C-n> autocomplete
24. zM - on fold
25. zR - off fold
26. :echo stdpath('config')

Very Magic \v Similar to PRP
Magic \m The default but awkward
No Magic \M Rarely used
Very No Magic \V Rarely used

/\v(.y){3}

## Filtering

ggVG!uniq
gg!Guniq
:1,$!uniq
:%!uniq

## Sort

:1,$ sort
:1,$ sort!

gq

VS<id>

v$hS<id>

yss<id>
