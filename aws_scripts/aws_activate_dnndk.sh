#!/bin/sh


source deactivate tensorflow_p27
source deactivate caffe_p27
export LD_LIBRARY_PATH=/home/ML/DNNDK/tools/dnndk_libs/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib/:/usr/local/cuda-8.0/lib64/:$LD_LIBRARY_PATH
export PATH=/home/ML/DNNDK/tools/:$PATH
