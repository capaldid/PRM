# Parametric Response Mapping

This repository is an implementation of "[Parametric Response Mapping of Coregistered Positron Emission Tomography and Dynamic Contrast Enhanced Computed Tomography to Identify Radioresistant Subvolumes in Locally Advanced Cervical Cancer.](https://doi.org/10.1016/j.ijrobp.2020.03.023)" in the _International Journal of Radiation Oncology * Biology * Physics_ 2020 by Dante Capaldi and colleagues.

![PRM](https://github.com/capaldid/PRM/blob/master/PRM_Figure.png)

## Requirements

- MATLAB 2017b or newer
- [imshow3D](https://www.mathworks.com/matlabcentral/fileexchange/41334-imshow3d)
- Registered DCE-CT with PET/CT dataset

## Files and Documentation

The PRM code as well as the synthetic datasets are provided.

```
src\PRM_PET_DCE_CT.m        - main code
src\PRM_Test_Dataset_1.mat  - Simple synthetic 2D square with equal compartments
src\PRM_Test_Dataset_2.mat  - Synthetic 3D volume
```

## Citation

```
@article{capaldi2020parametric,
  title={Parametric Response Mapping of Co-registered Positron Emission Tomography and Dynamic Contrast Enhanced Computed Tomography to Identify Radio-resistant Sub-volumes in Locally Advanced Cervical Cancer},
  author={Capaldi, Dante PI and Hristov, Dimitre H and Kidd, Elizabeth A},
  journal={International Journal of Radiation Oncology* Biology* Physics},
  year={2020},
  publisher={Elsevier}
}
```

## License

MIT License

Copyright 2020 Dante Capaldi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
