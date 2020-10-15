# TCLB_singularity


This is highly experimental. This repo contains a singularity image and scripts intended to bootstrap development environment. While GPU support was tested and works, be aware that GPU+MPI will most likely not work in HPC environment out-of-the-box.

Image should contain all dependencies for full-futured TCLB.

HOWTO:

- install (Singularity)[https://sylabs.io/guides/3.6/user-guide/quick_start.html]
- pull image `singularity pull --arch amd64 library://mdzik/tclb/tclb:latest`
- edit paths in 'startEnvironment.sourceMe'
- source It! :)
- go to TCLB directory
- `scmd ./configure --disable-cuda --with-python --enable-double --enable-keepcode  --enable-rinside`
- `make XXX`