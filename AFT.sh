#!/bin/sh
echo "WELCOME TO AUTOMATED FILE TRANSFER"
SPATH="source"
DPATH="destination"
today=`date +"%Y%m%d"`
# echo $today
# echo $SPATH
read -p "Input DATE (YYYY/MM/DD)" indate

#LOG FILE
COPY_LOG=COPY-`date +"%d-%m-%y"`.log
ACTION_TIME=`date +"[%d-%m-%y %T]:"`

echo "getting  file from source folder"

FILENAME="Antwak_Daily_Data_$indate.csv"

if [ -e "${DPATH}/${FILENAME}" ]   #if the  file exists in destination folder, skip it
   then
      echo "${ACTION_TIME} Skipping: File ${DPATH}/${FILENAME} already exist" >> ${COPY_LOG}
      exit 1
fi

if [ -f "$SPATH/$FILENAME" ]
then
  echo "STARTING AUTOMATED FILE TRANSFER"
	echo "${ACTION_TIME} Trying to copy ${FILENAME}" >> ${COPY_LOG}
    cp $SPATH/$FILENAME $DPATH/$FILENAME >> ${COPY_LOG}
    if [ $? -eq 0 ]
    then 
    	echo "${ACTION_TIME} COPY SUCCESS" >> ${COPY_LOG}

    else
    	echo "${ACTION_TIME} COPY FAILED"  >> ${COPY_LOG}
    fi
 else
 	echo "${ACTION_TIME} $FILENAME NOT PRESENT IN" $SPATH  >> ${COPY_LOG}
 fi

echo "END AUTOMATED FILE TRANSFER" 


