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
