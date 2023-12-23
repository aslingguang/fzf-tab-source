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
	chafa -s x20 "$1" || less "$1"
	exiftool "$1"
elif [ "$mime" = application/pdf ]; then
	pdftotext $1 - |less
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
	else	
		(in2csv "$1" | xsv table | bat -ltsv --color=always) 2>/dev/null
	fi
elif [ "$type" = xls ]; then
	if command -v xls2csv &>/dev/null; then
		(xls2csv "$1" | xsv table | bat -ltsv --color=always) 2>/dev/null
	else	
		(in2csv "$1" | xsv table | bat -ltsv --color=always) 2>/dev/null
	fi	
elif [ "$type" = docx ] ; then
	pandoc -s -t markdown -- "$1" 
	# rga "" "$1" |less
elif [[ "$type" =~ ^(a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
        rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip) ]]; then
	atool --list -- "$1"
	 # bsdtar --list --file "$1" 
elif [ "$type" = rar ]; then
	unrar lt -p- -- "$1" 
elif [ "$type" = 7z ]; then
	 7z l -p  -- "$1" 
else
	echo $1 是一个 $mime 文件 
fi