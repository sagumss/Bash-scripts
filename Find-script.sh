##Looking for filename:
find . -name "<filename>" -exec ls -ltr {} \;

##Looking for file a day ago:
find . -name -type f -mtime +1 -exec ls -ltr {} \;

##Looking for largest file in a directory (Top 10)
find /home -type f -ls | sort -k7rn | head -n 50

##Looking for large files:
find / -xdev -type f -size +30000 -exec ls -lathr {} \;
du -xm / |sort -nr |head -5 

##FIND user AND UPDATE
for i in `find . -user lawre912`; do chown wpad:staff $i; done

##FIND files with size +30000
find . -xdev -type f -size +30000 -exec ls -lathr {} \;
#----------- script to check if file is compressed data ------------

#!/bin/bash

files=`cat files_dat.list`

for f in ${files} ; do
        file $f |grep "gzip compressed data" |awk -F: '{print $1}'
done

# change permission of the script to 774: # chmod 774 script2.sh
# execute with file output on the compressed files only: # ./script2.sh > compressed.files

#-------------------------------------------------------------------------
#--------------- script to rename compressed files (.dat) to .gz then uncompress (gunzip) ---------

#!/bin/bash

files=`cat compressed.files`

for f in ${files} ; do
               mv $f $f.gz
        gunzip $f 
done

# change permission of the script to 774: # chmod 774 script3.sh
# execute: # ./script3.sh 
#----------------------------------------------------------------------------------------
