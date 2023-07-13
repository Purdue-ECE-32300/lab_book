# Experiment 7A: Brushless DC Motor

```{admonition} Objective
:class: note
- The rotor position of the permanent magnet synchronous machine considered in Experiment 6 will be measured and used to control the frequency of a variable frequency source (inverter). 
- The purpose of this experiment is to show that the torque speed characteristics of the motor inverter combination, which constitute a brushless DC motor, is similar to that of the conventional brush type permanent magnet DC machine.
```

## Outline:
- Prelab
- Introduction
- Figures
- In the Laboratory
    1. Relation of Hall effect sensor output to rotor position.
    2. Steady State Operation
- Postlab

## Prelab

Read the Introduction below.

## Introduction

The electromechanical equations of a 3 phase P pole permanent magnet AC machine can be expressed in the form

$v_{as} = r_s * i_{as} + (L_{ls} + L_{ms})*pi_{as} - (1/2)*L_{ms}*p*i_{bs} - (1/2)*L_{ms}*p*i_{cs} + e_{as}$ --- (7A.1)

$v_{bs} = r_s * i_{bs} + (L_{ls} + L_{ms})*pi_{bs} - (1/2)*L_{ms}*p*i_{as} - (1/2)*L_{ms}*p*i_{cs} + e_{bs}$ --- (7A.2)

$v_{cs} = r_s * i_{cs} + (L_{ls} + L_{ms})*pi_{cs} - (1/2)*L_{ms}*p*i_{as} - (1/2)*L_{ms}*p*i_{bs} + e_{cs}$ --- (7A.3)

where

$e_{as} = \frac{d\lambda_{asm}}{d\theta_{r}} * \frac{\theta_{r}}{dt} = w_r * frac{d\lambda_{asm}}{d\theta_{r}}$ --- (7A.4)

$e_{bs} = \frac{d\lambda_{bsm}}{d\theta_{r}} * \frac{\theta_{r}}{dt} = w_r * frac{d\lambda_{bsm}}{d\theta_{r}}$ --- (7A.5)

$e_{cs} = \frac{d\lambda_{csm}}{d\theta_{r}} * \frac{\theta_{r}}{dt} = w_r * frac{d\lambda_{csm}}{d\theta_{r}}$ --- (7A.6)

Here $\lambda_{asm}$,$\lambda_{bsm}$ and $\lambda_{csm}$ represent the flux linkages of the stator as, bs and cs windings respectively due to the permanent magnet rotor while $e_{as}$, $e_{bs}$ and $e_{cs}$ represent the corresponding induced voltages. Also,

$\theta_r =(P/2)*\theta_{rm}$ --- (7A.7)

where $\theta_r$ represents the electrical position of the rotor whereas $\theta_{rm}$ represents the actual mechanical position. If $i_{as}$ = $-i_{bs} - i_{cs}$, which is true due to Kirchoff's current law, show that (6B.1) can be expressed as

$v_{as} = r_s * i_{as} + (L_{ls} + (3/2)*L_{ms})*pi_{as} + e_{as} $ --- (7A.8)

Equivalently,

$v_{as} = r_s * i_{as} + L_{ss}*pi_{as} + e_{as}$ --- (7A.9)

where $L_{ss} = L_{ls} + (3/2)*L_{ms}$. Similarly,

$v_{bs} = r_s * i_{bs} + L_{ss}*pi_{bs} + e_{bs}$ --- (7A.10)

$v_{cs} = r_s * i_{cs} + L_{ss}*pi_{cs} + e_{cs}$ --- (7A.11)

The electromagnetic torque may be expressed as

$T_e = (P/2)*(i_{as}*\frac{d\lambda_{asm}}{d\theta_{r}} + i_{bs}*\frac{d\lambda_{bsm}}{d\theta_{r}}+i_{cs}*\frac{d\lambda_{csm}}{d\theta_{r}})$ --- (7A.12)

In an ideal machine,

$\lambda_{asm} = \lambda_m' sin(\theta_r)$ --- (7A.13)

$\lambda_{bsm} = \lambda_m' sin(\theta_r - 120^\circ)$ --- (7A.14)

$\lambda_{csm} = \lambda_m' sin(\theta_r - 120^\circ)$ --- (7A.15)

Substitute (7A.13) - (7A.15) into (7A.12) and show that 

$T_e = (P/2)*\lambda_m'[i_{as}*cos(\theta_r) + i_{bs}*cos(\theta_r - 120^\circ) +  i_{cs}*cos(\theta_r + 120^\circ)]$ --- (7A.16)

In an ideal brushless DC motor, the applied stator voltages are of the form

$v_{as} = \sqrt(2)*v_s*cos(\theta_r + \phi_v)$ --- (7A.17)

$v_{bs} = \sqrt(2)*v_s*cos(\theta_r + \phi_v - 120^\circ)$ --- (7A.18)

$v_{cs} = \sqrt(2)*v_s*cos(\theta_r + \phi_v + 120^\circ)$ --- (7A.19)

where $v_s$ and $\phi_s$ are control (input) variables. In a practical device, the applied voltages may not be true sinusoidal functions. However, we will assume that the applied voltages may be approximated as sinusoidal functions with $v_s$, respresenting the RMS amplitude of the fundamental component of $v_{as}$, $v_{bs}$ and $v_{cs}$.

To analyze three phase brushless DC machines, we define the transformation of variables

$\begin{bmatrix} f_{qs}^r // f_{ds}^r // f_{0s} \end{bmatrix} = \frac{2}{3} \begin{bmatrix} cos\theta_r cos(\theta_r - 120^\circ) cos(\theta_r + 120^\circ) // sin\theta_r sin(\theta_r - 120^\circ) sin(\theta_r + 120^\circ) // \frac{1}{2} \frac{1}{2} \frac{1}{2} \end{bmatrix}$ --- (7A.20)

where f = v,i and $\lambda$. In terms of rotor reference frame (transformed) variables, the voltage equations may be expressed

$v_{qs}^r = r_s * i_{qs}^r + L_{ss} * pi_{qs}^r + w_r * L_{ss} * i_{ds}^r + w_r * \lambda_m'$ --- (7A.21)

$v_{ds}^r = r_s * i_{ds}^r + L_{ss} * pi_{ds}^r - w_r * L_{ss} * i_{qs}^r$ --- (7A.22)

where

$ v_{qs}^r = \sqrt(2)*v_s*cos\phi_v $ --- (7A.23)

$ v_{ds}^r = -\sqrt(2)*v_s*cos\phi_v $ --- (7A.24)

Equation (7A.11), when expressed in terms of transformed variables becomes

$T_e = \frac{3}{2} * \frac{P}{2} * \lambda_m' * i_{qs}^r$ --- (7A.25)

In the steady state, $v_{qs}^r$ and $v_{ds}^r$ are constant. Thus the steady state operation may be analyzed by neglecting terms proportional to p in (7A.21) and (7A.22) and, for notational purposes, replacing lower case variables with upper case variables. Solving the resulting equations for $I_{qs}^r$ and substituting into (7A.25) yields

$T_e = \frac{3}{2} * \frac{P}{2} * \frac{r_s*\lambda_m'}{r_s^2 + w_r^2 * L_{ss}^2} * [\sqrt(2) * V_s * cos\phi_v + \frac{w_r*L_{ss}}{r_s} * \sqrt(2) * V_s * sin\phi_v - w_r * \lambda_m'] $ --- (7A.26)

## Figures

Figure 1
Figure 2 
Figure 3
Figure 4

## In the Laboratory

### Objective 1: To relate Hall effect output voltages to the rotor position.

```{warning} NEVER APPLY MORE THAN 5V TO EITHER STATOR WINDING OR IRREPARABLE DAMAGE TO MOTOR MAY RESULT```

- Hall effect output voltages:

Hall effect sensors are solid state devices that can be used to detect the polarity of a magnetic field. In a given device, the three Hall effect devices are mounted on the stator of the brushless DC motor (permanent magnet AC motor). The outputs of the Hall effect sensors are conditioned such that when the North Pole of the rotor is beneath a sensor, the correspondinf output is 5V. When the South Pole is beneath the sensor its output is 0.

1. Leave the stator windings of the brushless DC motor open circuited. Create a Simulink Model to apply -5V DC to the armature of the DC motor, causing both motors to rotate at a constant speed. Note: The brushless DC motor should rotate CW when looking from the DC motor.

2. Using the oscilloscope, measure the output of S! on Channel 1, the induced open circuit voltage $e_{ab}$ = $v_{ab}$ on Channel 2 and the induced open circuit voltage $e_{cb}$ = $v_{cb}$ on Channel 3. MEasure both open circuit voltages relative to the phase B and trigger the scope on S1.

3. Transfer the corresponding wave shapes to the digital computer using {file}`BenchVue`. Print out the results. Store the data as {program}`phasevolt.mat`.

4. Turn off the power to the DC Motor. Leave he Channel 1 oscilloscope probe connected to Sensor 1. Connect the Channel 2 probe to Sensor 2. Connect the Channel 3 probe to Sensor 3. Again, trigger on the output voltage of Sensor 1. Reapply -5V to the DC Motor. Be sure to use the same horizontal scale on the oscilloscope as before. Transfer the corresponding wave shapes to the digital oscilloscope as before. Transfer the corresponding wave shapes to the digital computer using {file}`BenchVue`. Print out the results. Store the data pertaining to the sensors as {program}`sensor.mat`.\

- Steady State Operation:   

1. Open {program}`lab7a_bdc3` {numref}`Figure 2`. Build, connect to target and start the real time code. This program applies the appropriate voltages to the permanent magnet AC Motor such that it operates as a brushless DC Motor. $V_{dc}$ is set to 1.0 V. Let the motor spin up at a steady speed.

2. Connect the three stator phase terminals to power the Channels 1, 2 and 3. In addition, connect the digital I/O cable to the digital I/O connector.

3. Measure the applied voltage $V_{ag}$ (Voltage from phase A to ground) and the output voltage of the Hall Effect sensor 1. Then, measure the applied voltage $V_{bg}$ (Voltage from phase B to ground) and the output voltage of Hall effect sensor 2. Similarly check $V_{cg}$ and output voltage of Hall effect sensor 3. What is the relationship between these voltages, the sensor outputs and $V_{dc}$?

## Postlab

1. From MATLAB load {program}`phasevolt.mat` and {program}`sensor.mat`. Calculate `eas`, `ebs` and `ecs` from `eab` and `ecb`. Plot on one graph $e_{as}$, $e_{bs}$, $e_{cs}$. Plot og another graph `hall1`, `hall2`, `hall3`. What was the speed of the motor?

2. Knowing how the applied voltages relate to the Hall effect sensors, calculate and plot the applied stator voltages $v_{as}$, $v_{bs}$ and $v_{cs}$. Approximate these voltages as sinuoids of the form (7A.17)-(7A.19) by calculating their fundamental components using Fourier Analysis. What is the relationship between $v_s$ and $V_{dc}$. Plot the Hall effect Sensor 1 voltage and $e_{as}$ on top of one another. What is the value of $\phi_v$?