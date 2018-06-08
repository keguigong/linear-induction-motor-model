# Linear-Induction-Motor-Model
*A LIM simulation model using MATLAB/S-Function.*

The model is established with single sided LIM mathmatical model. The mathmatical model is given below.

votage equation:

![](https://latex.codecogs.com/gif.latex?u_{s\alpha}=R_s&space;i_{s\alpha}&plus;R_rf(Q)(i_{s\alpha}&plus;i_{r\alpha})&plus;\dot{\psi_{s\alpha}})
![](https://latex.codecogs.com/gif.latex?u_{s\beta}=R_s&space;i_{s\beta}&plus;R_rf(Q)(i_{s\beta}&plus;i_{r\beta})&plus;\dot{\psi_{s\beta}})
![](https://latex.codecogs.com/gif.latex?0=R_r&space;i_{s\alpha}&plus;R_rf(Q)(i_{s\alpha}&plus;i_{r\alpha})&plus;\dot{\psi_{r\alpha}}&plus;\omega_r\psi_{r\beta} )
![](https://latex.codecogs.com/gif.latex?0=R_r&space;i_{s\beta}&plus;R_rf(Q)(i_{s\beta}&plus;i_{r\beta})&plus;\dot{\psi_{r\beta}}-\omega_r\psi_{r\alpha} )

flux equation:

![](https://latex.codecogs.com/gif.latex?\psi_{s\alpha}=L_si_{s\alpha}&plus;L_mf(Q)(i_{s\alpha}&plus;i_{r\alpha}))
![](https://latex.codecogs.com/gif.latex?\psi_{s\beta}=L_si_{s\beta}&plus;L_mf(Q)(i_{s\beta}&plus;i_{r\beta}))
![](https://latex.codecogs.com/gif.latex?\psi_{r\alpha}=L_ri_{r\alpha}&plus;L_mf(Q)(i_{s\alpha}&plus;i_{r\alpha}))
![](https://latex.codecogs.com/gif.latex?\psi_{r\beta}=L_ri_{r\beta}&plus;L_mf(Q)(i_{s\beta}&plus;i_{r\beta}))

and the movement equation:

![](https://latex.codecogs.com/gif.latex?F-F_{load}=m&space;\frac{dv}{dt})
![](https://latex.codecogs.com/gif.latex?\omega_r=(\pi&space;v)/\tau)

from the votage equation, we got the current equation:

![](https://latex.codecogs.com/gif.latex?i_%7Bs%5Calpha%7D%3D%5BL_mf%28Q%29%5Cpsi_%7Br%5Calpha%7D-%28L_r&plus;L_mf%28Q%29%29%5Cpsi_%7Bs%5Calpha%7D%5DA%5E%7B-1%7D)
![](https://latex.codecogs.com/gif.latex?i_%7Bs%5Cbeta%7D%3D%5BL_mf%28Q%29%5Cpsi_%7Br%5Cbeta%7D-%28L_r&plus;L_mf%28Q%29%29%5Cpsi_%7Bs%5Cbeta%7D%5DA%5E%7B-1%7D)
![](https://latex.codecogs.com/gif.latex?i_%7Br%5Calpha%7D%3D%5BL_mf%28Q%29%5Cpsi_%7Bs%5Calpha%7D-%28L_r&plus;L_mf%28Q%29%29%5Cpsi_%7Br%5Calpha%7D%5DA%5E%7B-1%7D)
![](https://latex.codecogs.com/gif.latex?i_%7Br%5Cbeta%7D%3D%5BL_mf%28Q%29%5Cpsi_%7Bs%5Cbeta%7D-%28L_r&plus;L_mf%28Q%29%29%5Cpsi_%7Br%5Cbeta%7D%5DA%5E%7B-1%7D)

![](https://latex.codecogs.com/gif.latex?A%3DL_m%5E2f%5E2%28Q%29-%28L_s&plus;L_mf%28Q%29%29%28L_r&plus;L_mf%28Q%29%29)

from the flux equation, we got the flux state equation:

![](https://latex.codecogs.com/gif.latex?\dot{\psi_{s\alpha}}=u_{s\alpha}-R_si_{s\alpha}-R_rf(Q)(i_{s\alpha}&plus;i_{r\alpha}))
![](https://latex.codecogs.com/gif.latex?\dot{\psi_{s\beta}}=u_{s\beta}-R_si_{s\beta}-R_rf(Q)(i_{s\beta}&plus;i_{r\beta}))
![](https://latex.codecogs.com/gif.latex?\dot{\psi_{s\alpha}}=-R_ri_{r\alpha}-R_rf(Q)(i_{s\alpha}&plus;i_{r\alpha})&plus;\omega_r\psi_{r\beta})
![](https://latex.codecogs.com/gif.latex?\dot{\psi_{r\beta}}=-R_ri_{r\beta}-R_rf(Q)(i_{s\beta}&plus;i_{r\beta})&plus;\omega_r\psi_{r\alpha})

the S-Function model writted as `lim_model.m`.

the simulink model is `lim_s_function.slx`.

then the LIM S-Funtion model looks like this:

![](./img/lim.PNG)

the open-loop simulation:

![](./img/whole.PNG) 

The parameters of LIM is listed below.

| parameter | value | unit  |
| :-------: | :---: | :---: |
| Rs        | 1.25  | ohm   |
| Rr        | 2.7   | ohm   |
| Lr        | 40.1  | mH    |
| Ls        | 33.1  | mH    |
| Lm        | 32.6  | mH    |
| m         | 8     | kg    |
| D         | 0.286 | m     |
| tau       | 0.066 | m     |
| p         | 4     | none  |

you can change the parameters to yours.

