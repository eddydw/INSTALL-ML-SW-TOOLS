#!/bin/sh

#put here the name of your caffe distribution
export CAFFE_ROOT=/caffe/BVLC1v0-Caffe


# remove previous installs
sudo unlink /home/ubuntu/src/caffe_python_2/distribute/bin/caffe.bin
sudo unlink /home/ubuntu/src/caffe_python_2/distribute
sudo unlink /home/ubuntu/src/caffe_python_2/build/install/bin/compute_image_mean.bin
sudo rm -rf /caffe /home/ML


##################################################################################
# set working dir
sudo mkdir /home/ML
sudo mkdir /home/ML/cifar10      # folder for the ML-CIFAR10-Tutorial
sudo mkdir /home/ML/cats-vs-dogs # folder for the ML-CATSvsDOGS-Tutorial

sudo chown -R $USER /home/ML
sudo chgrp -R $USER /home/ML


##################################################################################
# set caffe dir
sudo mkdir /caffe
sudo chown -R $USER /caffe
sudo chgrp -R $USER /caffe

sudo ln -s /home/ubuntu/src/caffe_python_2/                           $CAFFE_ROOT
sudo ln -s /home/ubuntu/src/caffe_python_2/build/install              $CAFFE_ROOT/distribute
sudo ln -s /home/ubuntu/src/caffe_python_2/build/install/bin/caffe    $CAFFE_ROOT/distribute/bin/caffe.bin
sudo ln -s /home/ubuntu/src/caffe_python_2/build/install/bin/compute_image_mean /home/ubuntu/src/caffe_python_2/build/install/bin/compute_image_mean.bin


##################################################################################
# set DNNDK dir
sudo mkdir /home/ML/DNNDK
sudo chown -R $USER /home/ML/DNNDK
sudo chgrp -R $USER /home/ML/DNNDK

cd ~

#join the various parts in a single file
cp deephi_host_208tools_cuda9.tar.gz /home/ML/DNNDK

cd /home/ML/DNNDK
tar -xvf deephi_host_208tools_cuda9.tar.gz
cd ./cuda9_tools
cp ~/aws_scripts/lib* .

##################################################################################
# install missing packages on the AWS
source activate tensorflow_p27
conda install keras
source deactivate tensorflow_p27
source activate caffe_p27
conda install python-lmdb pydot scikit-learn
source deactivate caffe_p27


#################################################################################
#remove all *.tar files

cd /home/ML/DNNDK
rm *.tar*

#################################################################################
#try decent and dnnc

cd ~/aws_scripts
source aws_activate_dnndk_cuda9.sh
decent --version
dnnc --version
