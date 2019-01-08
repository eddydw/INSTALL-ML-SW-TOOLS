# INSTALL-ML-SW-TOOLS


This tutorial is about how to install ML SW Tools as **Caffe** and **Keras** for **Deep Learning** on a **Ubuntu 16.04 Linux PC** equipped with one **NVIDIA GPU** at least, using **CUDA 8.0** -or also **CUDA 9.0**- **cuDNN 7.0.5** and **NCCL1** NVIDIA libraries.
Note also that Caffe was originally delivered with Python 2.7 and CUDA 8.0, this is why I prefer tu use CUDA 8.0, being compatible also with Keras/TensorFlow in the same Python2.7 virtual environment.

This tutorial also tells you about how to install the [DeePhi DNNDK](http://www.deephi.com/technology/dnndk) 2.0.8 beta release to quantize a CNN on [XILINX Zynq SoC and MPSoC FPGAs](https://www.xilinx.com/products/silicon-devices/soc.html).

Finally, this tutorial tells you how to install those tools on an Ubuntu 16.04 AMI **p2.xlarge EC2 on AWS**.  


## 1.0 Getting Started ##

You can find very detailed instructions about how installing Ubuntu 16.04, Caffe, Python 2.7 and its virtual environments,
all the GPU libraries in this PDF document [Installing_ML_SW_DellPrecision5820TowerPC](./PDF/Installing_ML_SW_DellPrecision5820TowerPC.pdf), which collects all the experience I have done on different machines (Laptop, Desktop and [AWS](https://aws.amazon.com)).

Note that **Section 11** of such document explains how to install the DeePhi tools on the **Host** and **Target** with many more details than what available in the official [DNNDK User Guide 1327](http://www.deephi.com/assets/ug1327-xilinx-dnndk-user-guide.pdf).

Note also that **Section 12** tells you how setting correctly a **p2.xlarge** EC2 on a Ubuntu 16.04 AMI on the **AWS**.

I recommend you to skip **Sections 8 and 9** and try to run directly **Section 10**, which contains a sophisticated script to install automatically 
Caffe, TensorFlow, Keras, provided you have already correcly installed the NVIDIA libraries according to Sections 6 and 7.
 
Assuming you have copied the [install_caffe_scripts.tar](./PDF/install_caffe_scripts.tar) to your $HOME directory,  all what you need to do is to run the following commands from your Ubuntu Linux PC:
```
cd ~
tar –xvf install_caffe_scripts.tar
mkdir $HOME/caffe_tools
source $HOME/scripts/caffe/install_caffe.sh
```



## 2.0 References ##

1) Here is the official online [Caffe tutorial](http://caffe.berkeleyvision.org/tutorial/).

2) Here are some very good posts - among many others - available from [PyImageSearch](https://www.pyimagesearch.com/):

- https://www.pyimagesearch.com/2016/11/14/installing-keras-with-tensorflow-backend/
- https://www.pyimagesearch.com/2016/10/24/ubuntu-16-04-how-to-install-opencv/
- https://www.pyimagesearch.com/deep-learning-computer-vision-python-book/
