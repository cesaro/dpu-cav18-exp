DPU download URL:
https://github.com/cesaro/dpu/archive/v0.5.2.zip

As of April 12, 2018.

Modifications:
- removing some useless old files
- configuring the size of the memory allocator in config.mk
- adding -D_GLIBCXX_USE_CXX11_ABI=0 to the steroids compilation files
  (defs.mk), due to versioning problems of the C++ standard library
