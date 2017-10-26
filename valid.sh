#!/bin/bash

./darknet detector valid \
				   seoho/cfg/seoho.data \
				   seoho/cfg/yolo-seoho.2.0.cfg \
				   /home/SSD3/yumeng-data/seoho_backup/new/yolo-seoho_10000.weights \
#				   > train.log
