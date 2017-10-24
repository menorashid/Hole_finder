#!/bin/bash

./darknet detector train \
				   seoho/cfg/seoho.data \
				   seoho/cfg/yolo-seoho.2.0.cfg \
				   yolo-seoho_5000.weights \
#				   > train.log
