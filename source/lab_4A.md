# Experiment 4A: Variable Reluctance Stepper Motor

```{admonition} Objective
:class: note
- To investigate the electromechanical characteristics of a variable reluctance motor.
- Experimental measurement of basic parameters.
- Prediction of static torque versus position characteristics.
```

## Outline

- Prelab
- Introduction
- Figures and Screenshots
- In the Laboratory
    1. Step lenght measurement.
    2. Inductance versus position measurement.
    3. Torque versus position measurement.
- Postlab

## Prelab

Review Sections 9.1 through 9.4 of ECE 32100 Textbook.
Link for Textbook: ()

## Introduction

The voltage equations of a three stack variable reluctance stepper motor may be expressed as

$V_{as} = r_s * i_{as} + \frac{d\lambda_{as}}{dt}$ --- (4A.1)

$V_{bs} = r_s * i_{bs} + \frac{d\lambda_{bs}}{dt}$ --- (4A.2)

$V_{cs} = r_s * i_{cs} + \frac{d\lambda_{cs}}{dt}$ --- (4A.3)

where

\begin{bmatrix} 
$\lambda_{as}$ \\
$\lambda_{bs}$ \\
$\lambda_{cs}$ \\
\end{bmatrix} = \begin{bmatrix} 
$L_{as}$ 0 0 \\
0 $L_{bs}$ 0 \\
0 0 $L_{cs}$ \\
\end{bmatrix} * \begin{bmatrix} 
$i_{as}$ \\
$i_{bs}$ \\
$i_{cs}$ \\
\end{bmatrix} --- (4A.4)

The self inductances may be expressed as

$L_{asas} = L_A + L_B * cos(RT\theta_{rm})$        --- (4A.5)

$L_{bsbs} = L_A + L_B * cos(RT(\theta_{rm} + SL))$ --- (4A.6)

$L_{cscs} = L_A + L_B * cos(RT(\theta_{rm} - SL))$ --- (4A.7)

where RT denotes the number of rotor teeth and SL is the step length. From (9.2-3) of the ECE 32100 Textbook.

SL = $2*\pi$ / RTN   --- (4A.8)

Here, N = 3 is the number of phases. The electromagnetic torque may be expressed as

$T_e = -(RT/2) * L_B * [i_{as}^2*sin(RT\theta_{rm}) + i_{as}^2*sin(RT(\theta_{rm} + SL)) + i_{as}^2*sin(RT(\theta_{rm} - SL))]$     --- (4A.9)

## Figures and Screenshots 
Figure 1
Figure 2 
Figure 3
Figure 4
Figure 5

## In the Laboratory

In the first part of the lab, we will determine the step length and number of rotor teeth. The given motor is a 3-phase device with polarity markings defined as follows:

|               |   Positive     |  Negative  |
| :-------------|----------------|-----------:|
|  Phase a      |    Black       |  Yellow    |
|  Phase b      |    Orange      |  Blue      |
|  Phase c      |    Red         |  Green     |

- Measurement of Number of Rotor Teeth
    
    1. Ensure that the rotor of the stepper motor is connected to the position encoder through the torque transducer and the cable from the position encoder to the 25-pin Digital Input port of the patch panel as shown in {numref}`Figure 1`.

    2. Open the model {guilabel}`lab4a_tgt.slx` located in the Lab 4A directory. The main window should look similar to {numref}`Figure 2`. ```{note} Switches are actuated by mouse double click.```

    3. Set the {guilabel}`To_IP_Address` to the IP number of the host computer on your station.

    4. From the real time tab, connect to target on your station and press {guilabel}`Run On Target`.

    5. Open the Simulink Model {guilabel}`lab4a_host.slx` which reads the position transducer in radians. The main window should look similar to {numref}`Figure 3`.

    6. Set the {guilabel}`FromAddress` to the IP number of the target computer at your station. The model is configures as a {guilabel}`Normal` simulation with the simulation parameters set to {guilabel}`Variable-Step` with {guilabel}`inf` as the Stop Time. The Model runs on host computer so it should not be compiled or built.

    7. Apply the 10 V DC signal to the phase A winding by clicking on the manual switch in the {guilabel}`lab4a_tgt.slx` model window. In {guilabel}`lab4a_host.slx` window, Press {guilabel}`Run`.

    8. Allow the motor to settle to equillibrium position. Record the position of the rotor from the alphanumeric display.

    9. Rotate the rotor by hand in either CW or CCW direction and let it settle to its closest neighbouring equillibrium position.

    10. Continue turning and stopping the motor until it has made a full revolution. How many equillibrium points are there in one motor revolution? How many teeth does the motor possess?
    ``` {hint} Refer 4A.8 ```

- Step Length Measurement

    1. Record the position of the rotor. Without disturbing the rotor, turn off the DC signal to the phase A winding and then energize the Phase B winding and allow the rotor to settle to its equillibrium position.

    2. Turn off phase B and turn on phase C. Continue to manually step the phase voltages through the a-b-c sequence until the motor has made one full revolution.

    3. Record the number of steps required to complete a full revolution. 

    4. Calculate the step length and verify (4A.8).

- DC Resistance measurement

    1. Measure the DC resistance of the stator winding by applying a DC voltage to one of the windings and measuring the resulting current.

    2. Record this value for use in Postlab.

- Measurement of Inductance versus position

    1. This procedure requires the use of the prebuilt target based Simulink Model {guilabel}`L_vs_pos_tgt.slx`, and the host based Simulink Model {guilabel}`L_vs_pos_host.slx`. The top level view of {guilabel}`L_vs_pos_tgt.slx` is shown in {numref}`Figure 4`. This Model generates a 5 V 20 Hz sinusoidal voltage that is to be applied to one phase of the stepper motor. The voltage output signal of the power amplifier will be used to measure the phase voltage and current output signal of the power amplifier will be used to measure the corresponding phase current. 

    2. The voltage output signal is connected to {guilabel}`Analog Input Channel 1` with the gain knob set to 10. The current output signal should be connected to the {guilabel}`Analog Input Channel 2` with gain knob of that input channel set to 1. 

    3. The measured voltage and current signals along with the 20 Hz sine and cosine signals are supplied to a block that calculates the inductance at the selected rotor positions. This block is described in Appendix A. The calculated inductance and measured rotor position are then supplied to the host model {guilabel}`L_vs_pos_host.slx`. The top level view of {guilabel}`L_vs_pos_host.slx` is shown in Figure 5. Therein, the numerical values of the measured position and calculated inductance will be displayed in the numeric blocks.

    4. Open {guilabel}`L_vs_pos_tgt.slx`. 
    
    5. Build, connect to target and start this model. 
    
    6. Excite the phase A winding with the AC voltage from Channel 1. 
    
    7. Connect the stepper motor phase A to {guilabel}`Analog Output 1`.

    8. Remove the connection to the {guilabel}`Analog Outputs 2 and 3`.

    9. Connect the voltage signal from {guilabel}`Analog Output 1` to {guilabel}`Analog Input 1`.
    
    10. Connect the current signal from {guilabel}`Analog Output 1` to {guilabel}`Analog Input 2`.

    11. Set the range of {guilabel}`Analog Input 1` to 10 and the range of {guilabel}`Analog INput 2` to 1 (Middle Position).

    12. Allow the motor to settle to a stable equilibrium position.

    13. Open {guilabel}`L_vs_pos_host.slx` and Run to begin the host simulation. This simulation is configured as a 'Normal' simulation. This host model samples the selected signals in the target code {guilabel}`L_vs_pos_tgt.slx` and displays the measured values in numerical display blocks. Using both hands, rotate the motor rotor slowly and smoothly. As the rotor rotates, the computer calculates a new value for the inductance for each rotor position and updates the digital displays in the host model. After rotating the rotor through one complete revolution, stop the host simulation. In the MATLAB command window, type `plot(position,inductance);` to verify that the position and inductance data have been written to the MATLAB workspace. 

    14. Use this MATLAB command to save the Inductance versus position data:`stepind('la.mat',position,inductance);`

    15. The resulting data file {file}`la.mat` can be used for subsequent plotting and analysis using MATLAB.

    16. Disconnect the A phase from Analog Output 1 and connect the B phase to Analog Output 1. Restart the host simulation.

    17. Measure the inductance versus position of phase B winding with the A winding. Save the data in file {file}`lb.mat`. Repeat the same steps for C phase and save data in {file}`lc.mat`.

    18. Load {file}`la.mat` into MATLAB with the command `load la.mat;` in your plotting script. The data will be stored as 2 column matrices of position (radians) and inductance (Henry's). Seperate the data into vectors of inductance and position.
        `qrma = position;`
        `las  = inductance;`

    19. Repeat these command for phase B and C. Plot inductance curves on one axis and add appropriate labels.
        `plot(qrma,las,qrmb,lbs,qrmc,lcs);`

    20. Print the results and save your MATLAB workspace by typing `save lab4a_ind`. Send the file {file}`lab_4a_ind.mat` and the provided file {file}`fit8.m` to a zipped folder and E-mail them to your lab partner. You will need these files in Postlab.
    
## Postlab

1. Use the provided function {file}`fit8.m` described in Appendix B to fit a sinusoidal function to the measured inductance versus position data. Express each of the phase inductances in the form:
        
    $ L = L_A + L_C * cos(RT\theta_{rm}) + L_S * sin(RT\theta_{rm})$ --- (4A.10)

    Where $L_A$, $L_C$ and $L_S$ are contained in the output of {file}`fit8.m`. Using the calculated values of $L_A$, $L_C$ and $L_S$, generate arrays of data for the fitted inductance versus position characteristics. Plot $L_{asas}$ versus $\theta_{rm}$ for both the fitted and the measured data. Example:

    `lascurvefit = L_A + L_C*cos(RT*qrma) + L_S*sin(RT*qrma);`
    `plot (qrma,las,qrma,lascurvefit);`

2. Repeat the previous steps for the phase B and phase C windings. Compare the measured and the fitted data. Provide possible explanations for any differences.

3. On the basis of fitted inductance versus position characteristics, calculate and plot the predicted torque versus position for one phase ON at a time excitation. Specifically, based upon (4A.10), calculate co-energy and then $T_e$ assuming $I_{as} = 10/r_s$ and $I_{bs} = I_{cs} = 0$. Repeat the torque versus position calculations for phase B and phase C windings individually. Store the calculated torques in vectors `Teacalc, Tebcalc, Teccalc`. You will need these plots to complete Postlab 4B so retain your M file and check your torque with the TA during the next lab session.

## Appendix A : Measurement of Inductance versus Position

In order to establish the winding inductance, we apply a 20 Hz voltage to the winding, i.e. 
   
$5 cos(40*\pi*t)$ --- (4A.11)

In phasor form
 
$V = 5*\angle 0$ --- (4A.12)

The measured signal can be expressed in the following general form 

$f = A_f*cos(40*\pi*t) + B_f*sin(40*\pi*t)$ --- (4A.13)

where f can be substituted for v or i. It is important to measure v, since the voltage applied may not match the voltage measured. To establish A, we multiply the measured current waveform by $cos(40*\pi*t)$ and average the resulting signal over a period,

$A_f = \frac{2}{T} * \int_(t-T)^t f(\tau)*cos(40*\pi*t)*d\tau$ --- (4A.14)

This formula can be verified by substituting (4A.13) into (4A.14) and using the identities

$cos(x) * cos(y) = (1/2)*[1 - cos(x+y)]$ --- (4A.15)

$cos(x) * sin(y) = (1/2)*cos(x+y)$       --- (4A.16)

Likewise, 

$B_f = \frac{2}{T} * \int_(t-T)^t f(\tau)*sin(40*\pi*t)*d\tau$ --- (4A.17)

Given $A_i$ and $B_i$, the current phasor can be expressed as

$\tilde{I} = A_i - jB_i$ --- (4A.18)

and the voltage phasor is expressed as

$\tilde{V} = A_v - jB_v$ --- (4A.19)

```{note} Assume the magnitude of the phasor corresponds to the peak (not RMS) amplitude of the corresponding sinusoid```

The impedance of the winding can be calculated as $ Z = \tilde{V} / \tilde{I}$. The resistance and the reactance correspond to the real and imaginary components i.e.

R = Real(Z) = $\frac{A_v*A_i + B_v*B_i}{A_i^2 + B_i^2}$  --- (4A.20)

X = Imag(Z) = $\frac{A_v*A_i - B_v*B_i}{A_i^2 + B_i^2}$  --- (4A.21)

Finally teh inductance can be established from the reactance as 

L = $ \frac{X}{40*\pi}$  --- (4A.22)

A Simulink Model that implements the previous procedure is shown in {numref}`Figure 4A.6`. Therein, the blocks labeled `maf` implement (4A.14) and (4A.17). The resistance and reactance along with the encoder position are sampled by the host model which is responsible for plotting and storing the results.


## Appendix B : Fitting parameters to measured data

It is assumed that the inductance can be expressed in terms of position as 

$ L_s = L_A + L_C * cos(8\theta_{rm}) + L_S * sin(8\theta_{rm})$ --- (4A.23)

In the lab, we measured an array of inductances and a corresponding array of positions. Substituting the measured inductances and positions into (22) results in the following over-specified system of equations.

\begin{bmatrix}
1 $cos(8\theta_1)$ $sin(8\theta_1)$ \\ 
1 $cos(8\theta_2)$ $sin(8\theta_2)$ \\ 
................................... \\
1 $cos(8\theta_{N})$ $sin(8\theta_{N})$ \\
\end{bmatrix} *  \begin{bmatrix}
$L_A$ \\ 
$L_B$ \\ 
$L_C$ \\
\end{bmatrix} = \begin{bmatrix}
$L_{1m}$ \\
$L_{2m}$ \\
........ \\
$L_{Nm}$ \\
\end{bmatrix} --- (4A.24)

Here, N is the number of data points. This set of equations is called over specified since there are more equations (N) than unknowns ($L_A,L_C,L_S$). Symbollically, (4A.23) can be expressed as 

Ax = b --- (4A.25)

where x is a vector of unknown parameters, while A and b are known. Since (4A.22) only approximates the inductance versus position characteristics, (4A.24) is not exact. Denote the error as e. Equation (4A.24) is rewritten as

Ax - b = e --- (4A.26)

The objective is to find x such that

$||e||^2 = e_1^2 + e_2^2 + ... + e_N^2 = e^Te$ --- (4A.27)

is minimized. Substituting (4A.25) into (4A.26) yields

$||e||^2 = (Ax-b)^T (Ax-b) = x^T * A^T * A * x - x^T * A^T * b - b^T*A*x + b^T*b $ --- (4A.28)

$||e||^2 = x^T * A^T * A * x - 2 * x^T * A^T * b + b^T *b$ --- (4A.29)

Since $b^T*b$ is constant, it suffices to minimize the following scalar valued function

$f(x) = x^T * A^T * b$ --- (4A.30)

with respect to x where Q = $A^T * A$ and y = $A^T$ * b. To minimize (4A.29) with respect to x, we differentiate with respect to x and set the result to zero. With a little work, it can be shown that this procedure results in the matrix equation

Qx = y --- (4A.31)

Here, Q is a nonsingular square matrix (3*3). Thus, there exists a unique solution x that is established by solving (4A.31). A simple MATLAB script that evaluates the vector of unknown parameters is given below.

```{code-cell} MATLAB
    function x = fit8(las,theta)
        for i = 1:length(las)
            A(i,1) = 1;
            A(i,2) = cos(8*theta(i));
            A(i,3) = sin(8*theta(i));
        end
        Q = A' * A;
        y = A' * las;
        x = Q\y; % Solve Q*x = y for x
```