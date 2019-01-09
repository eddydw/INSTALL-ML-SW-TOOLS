#/bin/sh

###############################################################################
##ASSUMING YOU HAVE EXECUTED AT LEAST ONCE THE FOLLOWING COMMANDS:
# mkdir /home/ML/DNNDK 
# cd /home/ML/cifar10/deephi_host_tools/
##join the various parts in a single file
#cat dnndk_host_libs.tar.parta* > dnndk_host_libs.tar
#cp dnndk*.tar /home/ML/DNNDK
#cd /home/ML/DNNDK
##check the md5 sum values
#md5sum dnndk_host_libs.tar
#md5sum dnndk_host_tools.tar 
## extract the host tools
#tar -xvf dnndk_host_libs.tar
#tar -xvf dnndk_host_tools.tar
#cd ./tools
## unzip all the files recursively
#gzip -v -d -r *
## make this soft link
# ln -s ./0719/deephi_compress ./deephi_compress
## launch this script
# cd /home/ML/cifar10/deephi_host_tools
# source activate_dnndk.sh

##################################################################################

source deactivate tensorflow_p27
source deactivate caffe_p27
export LD_LIBRARY_PATH=/home/ML/DNNDK/tools/dnndk_libs/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib/:/usr/local/cuda-8.0/lib64/:$LD_LIBRARY_PATH
export PATH=/home/ML/DNNDK/tools/:$PATH
