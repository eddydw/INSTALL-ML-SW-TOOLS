#!/bin/sh


source deactivate tensorflow_p27
source deactivate caffe_p27
export LD_LIBRARY_PATH=/home/ML/DNNDK/cuda9_tools/:$LD_LIBRARY_PATH
export PATH=/home/ML/DNNDK/cuda9_tools/:$PATH
