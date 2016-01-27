#!/bin/bash
#
# Copyright (c) 2003-2016 finfra.com <nowage@gmail.com>
#
# Source from : https://github.com/Finfra/BashShellLibForCentos7.git
#
#
#	Example
#   $ . getFileInfoAsJson.sh
#   {fileInfo:[
#   {fileName:a.txt,size:0,date:2.16-17:07},{fileName:b.txt,size:0,date:2.16-17:07}
#   ]}
#	$ . getFileInfoAsJson.sh > file
#	Written by NamJungGu
#	nowage@gmail.com
#
#   Todo : extension parameter
#
###################################################################

echo '{fileInfo:['
export s=''
for i in $(ls -asl|grep '\.txt$'|awk '{print "fileName:"$NF",size:"$6",date:"$7"."$8"-"$9}'); do
    s=$s"{"$i"}",
done
echo ${s%,}
echo ']}'
