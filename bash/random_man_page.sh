find /usr/share/man/man1 -type f | shuf | awk -F '/' '/1/ {print $6}' | sed 's/.gz//g' | head -1 | xargs alarcritty -e man

man -k . | awk '{print $1}' | dmenu -i -l 20 -c -bw 4 -p 'Search manpages: ' | xargs alacritty -e man

man $(find /usr/share/man/man1 -type f | shuf | head -1)