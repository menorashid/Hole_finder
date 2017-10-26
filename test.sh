#!/bin/bash

input_dir="./image_test"
output_dir="./image_results"
count=1

for entry in "$input_dir"/*
do
  ./darknet detector \
            test_one \
            seoho/cfg/seoho.data \
            seoho/cfg/yolo-seoho.2.0.cfg \
            /home/SSD3/yumeng-data/seoho_backup/new/yolo-seoho_10000.weights \
            "$entry" \
            >>test.log
  str1="$entry"
  str2=${str1::-4}
  str3="_predict.png"
  str4="$str2$str3"
  str5=${str4:12}
  str6="$output_dir$str5"
  echo "$str1"
  echo "$str6"
  cp predictions.png "$str6"
done
