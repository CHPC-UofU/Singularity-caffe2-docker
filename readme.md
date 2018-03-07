Caffe2 container from Docker

This is a Caffe2 container that we built from Docker image provided by the developers. It is relatively old but it works.

To test, run
```
python /usr/local/caffe2/python/convnet_benchmarks.py --batch_size 1 --model AlexNet --cudnn_ws 500 --iterations 50
```
By default, this runs on a GPU, `--cpu` will make it run on a CPU.

The original plan was to install a newer Anaconda binary as described at the [installation page](https://caffe2.ai/docs/getting-started.html), but, it was tedious to find the correct CUDA, CUDNN and NCLL libraries and in the end we got error `Encountered CUDA error: invalid device function `. So, I suspect something is wrong with the Anaconda binary build.

If newer version of Caffe2 is needed, we may need to build from the source after installing all the dependencies as listed in `Singularity.anaconda` definition file, following [Nvidia Caffe2 installation page](https://www.nvidia.com/en-us/data-center/gpu-accelerated-applications/caffe2/). This page provides a good overview of the installation and a testing command that actually runs on the GPU.

The Docker container is wrapped over a module file which defines alias to `python` so to run the testing benchmark, all we need to do is:
```
ml caffe2
python /usr/local/caffe2/python/convnet_benchmarks.py --batch_size 1 --model AlexNet --cudnn_ws 500 --iterations 50
```
(note that the Caffe2 is installed in `/usr/local/caffe2`).

A few other useful links:
* [CUDA/CUDNN install script](https://gist.github.com/mjdietzx/0ff77af5ae60622ce6ed8c4d9b419f45)
* [CUDNN download](https://developer.nvidia.com/rdp/cudnn-download)
* [Caffe2 github](https://github.com/caffe2/caffe2/)
* [Caffe2 Docker](https://hub.docker.com/r/caffe2ai/caffe2/)
