#!/usr/bin/env zsh

mime=$(file -bL --mime-type "$1")
category=${mime%%/*}
kind=${mime##*/}
type=$(echo "$1" | grep -o '\.[^.]*$' | cut -d. -f2-) 
if [ -d "$1" ]; then
	if command -v exa &>/dev/null; then
		exa  -hla --no-user --icons  --no-permissions  --color=always "$1"
	else
        ls -hgG "$1"
	fi
elif [ "$category" = image ]; then
	if command -v chafa &>/dev/null; then
		chafa -s x20 "$1" || less "$1"
	else
		echo "chafa not installed"
	fi
	
	if command -v exiftool &>/dev/null; then
		exiftool "$1"
	else
		echo "exiftool not installed"
	fi
elif [ "$mime" = application/pdf ]; then
	if command -v pdftotext &>/dev/null; then
		pdftotext $1 - |less
	else
		echo "pdftotext not installed"
	fi
elif [ "$mime" = application/json ]; then
	if command -v bat &>/dev/null; then
		bat -p --style numbers --color=always "$1" 
	else
        cat -n "$1"
	fi
elif [ "$category" = text ]; then
	if command -v bat &>/dev/null; then
		(bat -p --style numbers --color=always "$1") 2>/dev/null | head -1000
	else
        cat -n "$1"
	fi
elif [ "$type" = xlsx ]; then
	if command -v xlsx2csv &>/dev/null; then
		(xlsx2csv "$1" | xsv table | bat -ltsv --color=always) 2>/dev/null
	elif command -v in2csv &>/dev/null; then	
		(in2csv "$1" | xsv table | bat -ltsv --color=always) 2>/dev/null
	else
		echo "xlsx2csv or in2csv not installed"
	fi
elif [ "$type" = xls ]; then
	if command -v xls2csv &>/dev/null; then
		(xls2csv "$1" | xsv table | bat -ltsv --color=always) 2>/dev/null
	elif command -v in2csv &>/dev/null; then
		(in2csv "$1" | xsv table | bat -ltsv --color=always) 2>/dev/null
	else
		echo "xls2csv or in2csv not installed"
	fi	
elif [ "$type" = docx ] ; then
	if command -v pandoc &>/dev/null; then
		pandoc -s -t markdown -- "$1" 
	else
		echo "pandoc not installed"
	fi
	# rga "" "$1" |less
elif [[ "$type" =~ ^(a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
        rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip|7z|rar) ]]; then
	if command -v atool &>/dev/null; then
		atool --list -- "$1"
	else
		echo "atool not installed"
	fi
	 # bsdtar --list --file "$1" 
# else
	# echo $1 是一个 $mime 文件 
fi