function colormap() {
  for i in {0..255}; do
    print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}
  done
}

function disappointed() {
  echo -n " ಠ_ಠ " |tee /dev/tty| xclip -selection clipboard
}

function flip() {
  echo -n "（╯°□°）╯ ┻━┻" |tee /dev/tty| xclip -selection clipboard
}

function shrug() {
  echo -n "¯\_(ツ)_/¯" |tee /dev/tty| xclip -selection clipboard
}

function matrix() {
  echo -e "\e[1;40m"
  clear
  while :; do
    echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 ))
    sleep 0.05
  done | awk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4;        letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'
}
