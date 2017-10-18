#!/bin/bash

search_dir="./test_files"
count=1

for entry in "$search_dir"/*
do
  ./darknet detector test_one seoho/cfg/seoho_large.data seoho/cfg/yolo-seoho.2.0.cfg seoho/weights/yolo-seoho_5000.weights "$entry"
  
done
