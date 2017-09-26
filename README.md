# Hole finder project report

### Requires: 
* **Linux GCC>=4.9 or Windows MS Visual Studio 2015 (v140)**: https://go.microsoft.com/fwlink/?LinkId=532606&clcid=0x409  (or offline [ISO image](https://go.microsoft.com/fwlink/?LinkId=615448&clcid=0x409))
* **CUDA 8.0**: https://developer.nvidia.com/cuda-downloads
* **OpenCV 3.x**: https://sourceforge.net/projects/opencvlibrary/files/opencv-win/3.2.0/opencv-3.2.0-vc14.exe/download
* **or OpenCV 2.4.13**: https://sourceforge.net/projects/opencvlibrary/files/opencv-win/2.4.13/opencv-2.4.13.2-vc14.exe/download
  - OpenCV allows showing image or video detection in the window and store result to file that specified in command line `-out_filename res.avi`

### Training data:

Training images are in directory `seoho\images`. We extracted 40 frames from 4 videos in `152350_Day_Pos3_20ft_Unlock_Rainy` subfolder. To increase the number of training data, we flipped the images horizontally and vertically and rotated them by 180 degrees. Therefore, we get 160 training images in total. 

The label files have same file names with images but with '.txt' extension. They are in the following format: [category number] [object center in X] [object center in Y] [object width in X] [object width in Y] (one line per object). In this project, we have only one category which is container holes, so category number is always 0. We generated labels using an open-source software written by AlexeyAB (https://github.com/AlexeyAB/Yolo_mark).

Note: We did not share the images in Github page. Please let me know if you are interested in the images and labels. My email address is ymzhang (at) ucdavis (dot) edu.

### Validation and testing data.

Validation and testing images are in directory `seoho\valid\test`. We extracted 36 frames from 4 videos in `153526_Day_Pos3_20ft_Unlock_Rainy` subfolder. We used 16 of them as validation data set and 20 of them as training data set. The testing results are in `seoho\results`. The detected objects are labeled by the pink box. 

Note: We did not share the images in Github page. Please let me know it you are interested in sample result images. My email address is ymzhang (at) ucdavis (dot) edu.

### Detector 

This detector is modified from Yolo_v2 detector made by Joseph Redmon and AlexeyAB. (https://github.com/pjreddie/darknet and https://github.com/AlexeyAB/darknet). We trained this model using pre-trained weights for the convolutional layers for Pascal VOC data. Configuration files are in `seoho\cfg`. We trained it for 20000 iterations, and the final weights file is in google drive([link](https://drive.google.com/a/ucdavis.edu/file/d/0B1gETrWPTbXpVnhPTDF2VmZBeTg/view?usp=sharing)). 

### How to detect objects in your own image:

1. Just do `make` in the darknet directory.
2. Download trained weights from google drive ([link](https://drive.google.com/a/ucdavis.edu/file/d/0B1gETrWPTbXpVnhPTDF2VmZBeTg/view?usp=sharing)) and place it in `seoho\weights`.
3. Run `./darknet detector test seoho/cfg/seoho_large.data seoho/cfg/yolo-seoho.2.0.cfg seoho/weights/yolo-seoho_20000.weights [path_to_your_image] -thresh 0.5`. If you don't have OpenCV installed, the result will be save in `predictions.png`. 

====================================
# Update 09/25/2017

### Training, validation and testing data:

Seoho people provided 3516 new images. I used 70% of them as training images, 15% of them as validation images and 15% of them as testing images. Images are in directory `seoho\images`. 

Note: We did not share the images in Github page. Please let me know if you are interested in the images and labels. My email address is ymzhang (at) ucdavis (dot) edu.

### Detector 

This detector is modified from Yolo_v2 detector made by Joseph Redmon and AlexeyAB. (https://github.com/pjreddie/darknet and https://github.com/AlexeyAB/darknet). We trained this model using pre-trained weights for the convolutional layers for Pascal VOC data. Configuration files are in `seoho\cfg`. We trained the detetor for 5000 iterations with batch size 64, and the final weights file is in google drive([link](https://drive.google.com/file/d/0B1gETrWPTbXpNkc5MGx6WExST0E/view?usp=sharing)). 

### Results

This new model shows average 88.43% IOU (intersection over union) and 98.86% recall(intersection over ground truth), comparing to previous model that shows average 58.19% IOU and 77.38% recall on the same validation images.

### How to detect objects in your own image:
1. Just do `make` in the darknet directory.
2. Download trained weights from google drive ([link](https://drive.google.com/file/d/0B1gETrWPTbXpNkc5MGx6WExST0E/view?usp=sharing)) and place it in `seoho\weights`.
3. Run `./darknet detector test_one seoho/cfg/seoho_large.data seoho/cfg/yolo-seoho.2.0.cfg seoho/weights/yolo-seoho_5000.weights [path_to_your_image]`. If you don't have OpenCV installed, the result will be save in `predictions.png`. 
