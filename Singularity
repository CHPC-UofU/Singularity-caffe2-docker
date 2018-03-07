# Ubuntu 17.10 
# !!! Update to 18.04 when released in April 2018
#

#
#
# If you use this to create a container inside a virtual machine with no access to
# a GPU, comment out the final test.
# need Ubuntu 17.10, 17.04 does not have caffe-cuda

BootStrap:docker
From: caffe2ai/caffe2:c2v0.8.1.cuda8.cudnn7.ubuntu16.04

#From:nvidia/cuda:9.1-runtime-ubuntu17.04

%runscript
  exec python "$@" 

%post

  # need to create mount point for home dir, scratch
  mkdir /uufs /scratch

  # need to create mount point for nvidia-smi - it complains when trying to launch writable image
  touch /bin/nvidia-smi


%test
  # Sanity check that the container is operating

  # Test numpy 
#  /opt/conda/bin/python -c "import numpy as np;np.__config__.show()"
  # Ensure that TensorFlow can be imported and session started (session start touches GPU)
  # 2.4 - no GPU seems to be imported during test so skip
  # /usr/bin/python3 -c "import caffe;caffe.set_device(0);caffe.set_mode_gpu()"
  # python /opt/conda/lib/python2.7/site-packages/caffe2/python/convnet_benchmarks_test.py
  # python /usr/local/caffe2/python/convnet_benchmarks.py --batch_size 1 --model AlexNet --cudnn_ws 500 --iterations 50



