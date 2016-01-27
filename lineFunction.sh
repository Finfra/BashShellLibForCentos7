#!/bin/bash
#!/bin/bash
#
# Copyright (c) 2003-2016 finfra.com <nowage@gmail.com>
#
# Source from : https://github.com/Finfra/BashShellLibForCentos7.git
#
#
#	This script give two function.
#		insertLine
#		replaceLine
#


###################################################################
# Format : insertLine __SearchTarget__ __LineToAdd__ __fileName__ #
# Usage  : insertLine bbb data x                                  #
###################################################################
function insertLine()
{
    local m=$2
	local file=$3
	local s=$1
	#echo '----orignal-----------------'
	#cat $file

	# Mismatch Case
	local lineNum=`grep -n $s $file|sed "s/:.*//"`
	if [ ${#lineNum} -eq 0 ]; then
		echo 'Search Line is not found.'
	else
		let h=$lineNum
		head -n $h $file >tmph
		let c=`cat $file|wc -l|sed 's/ *//'`
		let t=$c-$h
		tail -n $t $file >tmpt
		cat tmph>$file
		echo $m>>$file
		cat tmpt>>$file
		#echo '-----inserted--------------'
		#cat $file
		rm -f tmph
		rm -f tmpt
	fi
}
####################################################################
# Format : replaceLine __SearchTarget__ __LineToAdd__ __fileName__ #
# Usage  : replaceLine bbb data x                                  #
####################################################################
function replaceLine()
{
    local m=$2
	local file=$3
	local s=$1
	#echo '----orignal-----------------'
	#cat $file

	# Mismatch Case
	local lineNum=`grep -n $s $file|sed "s/:.*//"`
	if [ ${#lineNum} -eq 0 ]; then
		echo 'Search Line is not found.'
	else
		let h=$lineNum
		let h=$h-1            #ᅟ insertLine하고 다른 부분
		head -n $h $file >tmph
		let c=`cat $file|wc -l|sed 's/ *//'`
		let t=$c-$h-1         #ᅟ insertLine하고 다른 부분
		tail -n $t $file >tmpt
		cat tmph>$file
		echo $m>>$file
		cat tmpt>>$file
		#echo '-----inserted--------------'
		#cat $file
		rm -f tmph
		rm -f tmpt
	fi
}

# It is Test Code
# cat>x<<EOF
# aaaa
# bbbb
# cccc
# dddd
# EOF
# echo -------------------------------------------------------
# insertLine xxbbb data x
# cat x
# echo -------------------------------------------------------
# insertLine bbb data x
# cat x
# echo -------------------------------------------------------
# replaceLine xxbbb data x
# cat x
# echo -------------------------------------------------------
# replaceLine bbb data x
# cat x
