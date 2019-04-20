name=arc
problems="c d e f"

num=0

if [ $# -ne 0 ] ; then
	num=$1
else
	for dir in $name* ; do
		n=${dir:3:3}
		[[ $n -gt $num ]] && num=$n
	done
	let ++num
fi

num=$(printf %03d $num)

if [ ! -e $name$num ] ; then
	mkdir $name$num
	for i in $problems; do
		mkdir $name$num/$i
		cp ../template $name$num/$i/a.cpp
	done
fi

ln -nfs $name$num cur
