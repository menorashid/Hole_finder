#!/bin/bash

search_dir="./image_test"
count=1

for entry in "$search_dir"/*
do
  ./darknet detector test_one seoho/cfg/seoho.data seoho/cfg/yolo-seoho.2.0.cfg /home/SSD3/yumeng-data/seoho_backup/new/yolo-seoho_2000.weights "$entry"
  str1="$entry"
  str2=${str1::-4}
  str3="_predict.png"
  str4="$str2$str3"  
  echo "$str1"
  echo "$str4"
  cp predictions.png "$str4"

done
