#!/bin/bash

if [ ! -d "myfolder" ]; then
  mkdir "myfolder"
fi

cd "myfolder"

echo -e "Привет!\n$(date)" > file1.txt

touch file2.txt
chmod 777 file2.txt

echo $RANDOM > file3.txt

touch file4.txt

touch file5.txt

