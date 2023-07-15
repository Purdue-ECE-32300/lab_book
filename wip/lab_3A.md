# Experiment 3A : Electromagnetic Forces

```{admonition} Objective
:class: note
- To study the interaction between electrical and mechanical systems that are magnetically coupled.
- Electromechanical relay used in Experiment 2 will be analyzed to predict its steady state force versus position and force versus current characteristics.
- Computer simulation will be used to predict the dynamic foce versus time characteristics in the following lab.
- Analytical and simulated results will be compared with laboratory measurements.
```
## Outline
- Introduction
- Prelab
- Figures
- In the Laboratory
    1. Measurement of Force versus Position
    2. Measurement of Force versus Current
- Postlab

## Introduction

In this lab, we will consider the cylindrical solenoid depicted in {numref}`Figure 3A.1`. In the previous experiment, it was shown that the self inductance can be approximated as 

$ L(x) = L_l + (K/(k_0 + x))$ --- (3A.1)

Here, K and $$k_0$$ are assumed to be known constants and $$L_l$$ is the leakage inductance. In the prelab, we will establish an expression for the force versus position. We will also form the equations for electrical and mechanical systems in state-space form. Hopefully, our experimental measurements will conform the general form of this equation.

## Prelab

1. For an electromechanical device whose inductance versus position is given by (3A.1), express the electromagnetic force as a function of current and position.

    $f_e(i,x) = (Some function of i,x,K,k_0)$ --- (3A.2)

2. Using the values of K and $$k_0$$ (In Metric Units) determined in Experiment 2, plot $f_e$ versus i for 0 < i < 200 mA and 
x = 0.0032m. Plot $f_e$ versus x for 0 < x < 0.0127m and i = 200 mA.

## Figures
Figure 3A.1

## In the Laboratory

### Objective 1: Measure the force versus position characteristics with a constant current.

```{warning} EYE PROTECTION IS REQUIRED FOR THIS LAB```
```{note} 
- You will need to measure current in the solenoid.
- A voltage signal propotional to the current is available on one of the BNC connectors of the power amplifier.
- Use the same Simulink Model from Experiment 2.
```

- Force versus Position
1. Energize the solenoid coil with 12 V DC. Use R from the previous experiment, calculate expected current. Measure coil current and compare with expected value. Provide explanation if there is any difference. 

2. Connect the lower BNC output to the oscilloscope to read the current on an open circuit. 

3. Record this value which will be subtracted from future DC current measurements.

4. Position the solenoid plunger at x = 0 (Set screw should be all the way out). 

5. Add weights to the solenoid plunger until the plunger pulls out. 
```{warning} DO NOT DROP WEIGHTS ON LAB PARTNERS FOOT. USE CHAIRS TO PREVENT DROPPING WEIGHTS.```

6. Record the mass required to pull the solenoid plunger out to nearest 10 grams. 
```{warning} BE CONSISTENT. EITHER ROUND UP OR ROUND DOWN FOR ALL MEASUREMENTS.```

7. Repeat the measurements with the plunger position varying from 0 to 1/2" at 1/32" intervals (1 screw turn = 1/32"). 
```{note} Ensure screw is touching the plunger before counting turns.```
```{warning} If minimum weight (50 grams) is reached STOP.```

8. Calculate the plunger force using $F = m*g$ where $g = 9.8 m/sec^2$ and m is the external mass. This is approximately equal to the magnitude of the electromagnetic force developed by the solenoid.

### Objective 2: Measure the force versus current at a fixed position

- Force versus current

1. Apply a DC Voltage to the coil so that i = 60 mA (Peak-to-Peak). 
```{note} Use Ohm's law to determine required voltage. R is known. Adjust voltage if necessary.```

2. Add weight to the plunger until it pulls out. Note the weight required to pull out.

3. Repeat the measurements at the same position from 60 mA to 105 mA in 5 mA intervals. Record the measured currents and weights required to pull out the plunger.


## PostLab

1. Plot the measured and calculated electromagnetic force versus current with x = 1/8" on the same axis. Compare the results and explain discrepancies.
```{note} Convert all the measured data to SI units before making any comparisons.```

2. Plot the measured and calculated electromagnetic force versus position characteristics with constant i on the same axis. Compare the results and explain discrepancies.