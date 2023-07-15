# Experiment 5B: DC Motor

```{admonition} Objective
:class: note
- Investigate steady state and dynamic characteristics of a permanent magnet DC Motor.
- In 5A, the fundamental parameters of a DC Motor will be measured and the concepts of power transfer and conservation of energy will be demonstrated. 
- In 5B, computer simulation will be used to predict the steady state and dynamic operating characteristics.
- The analytical and simulated results will be compared with experimental measurements.
```

## Outline

- Prelab
- Figures
- In the Laboratory
    1. Torque versus speed measurement.
    2. Inertia measurement.
    3. Free acceleration startup characteristics.
- Postlab

## Prelab

In the previous experiment we assumed that the torque due to friction could be described usinga simple constant $B_m$ times the rotor speed $w_r$. The measured frictional torque versus speed plot shows that this is not a reasonable assumption since the slope of the measured data is significantly larger at low rotor speed than at high rotor speed. A better way to model the torque due to friction might be to have an `affine` rather than a linear function to describe torque due to friction, such as:

$T_friction = B_m * w_r + T_{stick}$ --- (5B.1)

where $T_{stick}$ is the `stiction` torque which opposes rotation at low speed.

Using your measured fricitonal torque versus rotor speed data, re-establish $B_m$ and find $T_stick$. To do this determine the average slope and the y-intercept of the measured data when the rotor speed is greater than zero.

Assuming $L_{AA}$ can be neglected, the equations of a permanent magnet DC machine may be expressed as

$k_T * i_a = J*\frac{dw_r}{dt} + B_m*w_r + T_{stick}$ --- (5B.2)

$v_a = r_a * i_a + k_v * w_r$ ---(5B.3)

Starting with equations (5B.2) and (5B.3), show that by including $T_{stick}$ in our model, the effective voltage applied to the motor is smaller than we might predict. That is, substitute the motor voltage equation and re-arrange the differential equation to relate $v_a$ to $w_r$ and show that a constant times $T_{stick}$ is subtracted from $v_a$.

## Figures 
Figure 1 
Figure 2 
Figure 3

## In the Laboratory

```{warning} SAFETY GLASSES MUST BE WORN AT ALL TIMES DURING THIS LABORATORY```

- Torque versus speed measurement

    1. Use the same mechanical setup shown in {numref}`Figure 1`. Implement a Simulink Model to apply 4V DC to the armature of Motor 1 (red with respect to black) at the panel output Channel 1 and apply -4V DC to the armature of Motor 2 (red with respect to black) at the panel output Channel 2. Both motors should turn with the torque reading zero.

    2. Measure the current supplied to Motor 1 (Test Motor) on oscilloscope Channel 1. Measure the tachometer speed on Channel 2 and torque transducer output voltage on Channel 3. 

    3. Repeat and record the measurements by varying the Motor 2 voltage from -4V to +4V in 1V steps. Calculate the rotor speed in rad/s and the torque in N-m.

- Dynamic Response

    Objective in this section is to measure the actual step response with the oscilloscope. We will then establish the motor transient response using a Simulink Model simulation based on measured parameters and compare results.

- Experimental Data

    1. Using the Simulink Model shown in {numref}`Figure 2`, apply a 0 to 4 V step to the armature of the DC motor.

    2. Measure the transient armature current on Channel 3 and tachometer voltage (speed) on Channel 2 using the digital oscilloscope. Measure the armature voltage on Channel 1 and set the trigger input to Channel 1 as well. Use single trigger mode to capture the turn-on transient. Using {file}`BenchVue`, save the data displayed to a `.mat` file in your Lab 5B directory. Find the steady state value and time constant of the experimental response by executing the following command:

    `[wrss04,tau04] = fit_wr([75,0.1], time, wr)`

    where `time` and `w_r` are from the measured file data. This function executes a non linear least squares curve fitting routine, that can be found in your Lab 5B directory. Using your value for $\tau_m$, determine the rotor moment of inertia J.

    3. Repeat the experiment for a voltage step from 4 to 8 V. Save the data into a new `.mat` file and re establish the steady state rotor speed, mechanical time constant and rotor moment of inertia. The rotor has already developed a speed in this test, so the previous value of steady state speed must be subtracted before executing the curve fitting for the algorithm to work. The data can be shifted back after the program has finished. To do this execute the following commands:

    `[wrss48_shifted,tau48] = fit_wr([75,0.1]',time,wr-wrss04);`

    `wrss48 = wrss48_shifted + wrss04;`

    4. How do the values from the 4 to 8 V step differ from the values from the 0 to 4V step and by how much do they differ? What are the potential reasons for any differences?

- Computer Simulation

    1. Simulate the startup characteristics using the electrical and mechanical parameters measured in lab. A Simulink program, {program}`motorsiml.slx` is available to perform this simulation (Refer {numref}`Figure 3`).

    2. Enter the motor parameters by double clicking on the `DC Motor Dynamics` block. Generate a printout of the simulated response of a 0-4V step input. Also, record the electrical and mechanical parameters that were used to generate the plots, measure simulated time constant (For use in Postlab) and final speed. 
    ```{warning} BE SURE TO USE YOUROWN PARAMEETERS ```

## Postlab

1. Plot the measured torque versus speed and the predicted characteristics from Lab 5A postlab on the same axis and compare the results.

2. Why is it reasonable to neglect $L_{AA}$?

3. Using MATLAB, implement the closed form of the equation of $w_r(t)$ derived in last week's prelab, generate a plot of $w_r$ versus time for a 0 to 4 V step input. Record the parameters ($k_T$, $k_v$, $r_a$ and $B_m$)used to generate these plots.

4. What were some of the differences between the measured rotor speed response to the 0 to 4V input versus the 4V to 8V input? What do you think caused the differences?

5. How closely did the experimental and simulated $w_r(t)$ curves match (consider the difference in time constant and final speed). What are some possible explanations for the differences between the predicted and measured curves?

6. Why do we use a tachometer instead of armature terminal voltage to measure the rotor speed?

7. Which measure (an encoder or a tachometer) is more accurate? In what situation is a tachometer more desirable than an encoder? 
```{note} The encoder is a digital device used in previous labs to measure rotor position.```