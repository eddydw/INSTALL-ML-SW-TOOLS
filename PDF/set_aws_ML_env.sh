#!/bin/sh

: '
## Set the environment in your local AWS to be "equal" to what the tutorial expects.
## It is assumed that you have copied the "ML-CIFAR10-Caffe-tutorial-master.zip" into
## your home ($HOME or "~"), unzipped it and renamed into "cifar10", that is,
## the folder "~/cifar10" already exists.
## It also maps the caffe tools as if they were in "/caffe".

## The above mentioned explanation, means you should have done the following commands:
# cd $HOME
# unzip ML-CIFAR10-Caffe-tutorial-master.zip
# mv ML-CIFAR10-Caffe-tutorial-master cifar10
# cd cifar10/
# source set_aws_MK_env.sh
#cd /home/ML/cifar10
'

##################################################################################
# remove previous installs
sudo unlink /caffe/Caffe-SSD-Ristretto/distribute/bin/caffe.bin
sudo unlink /caffe/Caffe-SSD-Ristretto/distribute
sudo unlink /caffe/Caffe-SSD-Ristretto
sudo unlink /home/ubuntu/src/caffe_python_2/build/install/bin/compute_image_mean.bin
sudo rm -rf /caffe /home/ML

##################################################################################
# set working dir
sudo mkdir /home/ML
sudo mkdir /home/ML/cifar10 # folder for the ML-CIFAR10-Tutorial
sudo mkdir /home/ML/catsvsdogs # folder for the ML-CIFAR10-Tutorial

sudo chown $USER /home/ML
sudo chgrp $USER /home/ML
#cp -r /home/ubuntu/ML/cifar10 /home/ML/cifar10
ln -s /home/ubuntu/ML/cifar10 /home/ML/cifar10

##################################################################################
# set caffe dir
sudo mkdir /caffe
#sudo chown ubuntu /caffe
#sudo chgrp ubuntu /caffe
sudo chown $USER /caffe
sudo chgrp $USER /caffe

sudo ln -s /home/ubuntu/src/caffe_python_2/                           /caffe/Caffe-SSD-Ristretto
sudo ln -s /home/ubuntu/src/caffe_python_2/build/install              /caffe/Caffe-SSD-Ristretto/distribute
sudo ln -s /home/ubuntu/src/caffe_python_2/build/install/bin/caffe    /caffe/Caffe-SSD-Ristretto/distribute/bin/caffe.bin
sudo ln -s /home/ubuntu/src/caffe_python_2/build/install/bin/compute_image_mean /home/ubuntu/src/caffe_python_2/build/install/bin/compute_image_mean.bin

##################################################################################
# set DNNDK dir
sudo mkdir /home/ML/DNNDK
sudo chown $USER /home/ML/DNNDK
sudo chgrp $USER /home/ML/DNNDK
#cp -r /home/ubuntu/ML/cifar10/deephi_host_tools/ /home/ML/cifar10 #if you use the soft link this would be the same directory
cd /home/ML/cifar10/deephi_host_tools/
#join the various parts in a single file
cat dnndk_host_libs.tar.parta* > dnndk_host_libs.tar
cp dnndk*.tar /home/ML/DNNDK
cp *_activate_dnndk.sh /home/ML/DNNDK
#rm -f *dnndk*
cd /home/ML/DNNDK
##check the md5 sum values
#md5sum dnndk_host_libs.tar
#md5sum dnndk_host_tools.tar
## extract the host tools
tar -xvf dnndk_host_libs.tar
tar -xvf dnndk_host_tools.tar
cd ./tools
## unzip all the files recursively
gzip -v -d -r *
## make this soft link
ln -s ./0719/deephi_compress ./deephi_compress

##################################################################################
# install missing packages on the AWS
source activate tensorflow_p27
conda install keras
source deactivate tensorflow_p27
source activate caffe_p27
conda install python-lmdb pydot scikit-learn
source deactivate caffe_p27

##################################################################################
# now you can run the aws caffe flow script to
# build the CIFAR10 dataset and train the miniVggNet and make predictions

cd /home/ML/cifar10/caffe
source aws_caffe_flow_miniVggNet.sh 2>&1 | tee ./rpt/logfile_aws_caffe_flow_miniVggNet.txt

##################################################################################
# quantize the miniVggNet just trained with DeePhi DNNDK tools
source /home/ML/DNNDK/aws_activate_dnndk.sh
cd /home/ML/cifar10/deephi/miniVggNet/quantiz
source decent_miniVggNet.sh 2>&1 | tee ./rpt/aws_logfile_decent_miniVggNet_autotest.txt
source dnnc_miniVggNet.sh 2>&1 | tee ./rpt/aws_logfile_dnnc_miniVggNet_autotest.txt
