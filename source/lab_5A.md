# Experiment 5A: DC Motor

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
    1. Measurement of electrical parameters.
- Postlab

## Prelab

The electromechanical equations of a permanent magnet DC machine can be expressed as

$ T_e - T_l = J*\frac{dw_r}{dt} + B_m * w_r $ --- (5A.1)

$ v_a = r_a*i_a + L_{AA}*\frac{di_a}{dt} + k_v * w_r $ --- (5A.2)

$ T_e = K_T * i_a $ --- (5A.3)

Here, $T_L$ is the applied load torque and $v_a$ is the applied armature voltage. If all the variables are expressed in SI units, $k_T = k_v$.

The power delivered to the mechanical load may be expressed as

    $ P_m = T_L * w_r $  --- (5A.4)

During steady state operation with a constant applied armature voltage and constant load torque, all electrical and mechanical variables will be constant. Express (5A.1) through (5A.3) assuming the steady state operating conditions. Use upper case letters to designate steady state variables.

Assume $L_{AA}$ is small enough so that it can be neglected. Simplify (5A.1) - (5A.3) and express the first order transfer function relating speed $w_r$ to armature voltage $v_a$ when $T_L = 0$ and $w_r$ to the load torque $T_L$ when $v_a = 0$.


Express $w_r(t)$ for a step change in armature voltage from 0 to $V_a$. You may either use a Laplace transform technique or you can solve the first order differential equation using the method of undetermined coefficients. 

```{hint} For a first order transfer function 
        $w_r(t) = w_{r,ss}*(1-e^(-t/\tau_{m}))$ --- (5A.6)
```

Relate $w_{r,ss}$ and $\tau_{m}$ to the machine parameters and $V_a$. Finally, read through the laboratory procedure before coming to the lab.

## Figures 
Figure 1 
Figure 2
Figure 3
Figure 4
Figure 5

## In the Laboratory

```{warning} SAFETY GLASSES MUST BE WORN AT ALL TIMES DURING THIS LAB```

The rotors if two identical motors (numbered 1 and 2) are connected to the torque transducer as shown in {numref}`Figure 1`. 

### Objective 1: To measure the electrical parameters $L_{AA}$ , $r_a$ and $k_v$

- Armature Resistance and Inductance

1. Block the rotor to prevent it from turning. Using Simulink as in previous experiments, apply 2 V (DC) to the motor terminals (Positive to Red, Negative to Black) through a high power output channel, $V_a$ = 2V. Measure the DC current and voltage using the probe and oscilloscope. Vary the rotor position by hand to determine if the DC current (consequently resistance) varies as a function of the rotor position. Record the maximum and minimum current, then calculate a maximum, minimum and average resistance $r_a$.

2. Using the Simulink target model to apply 4V (DC) to the armature terminals. Measure the armature current with the lower BNC connector on the same `Analog Output` module and the torque using the torque transducer amplifier. 

3. Connect the current output signal to the oscilloscope Channel 1 and the output of the torque transducer amplifier to Channel 2. The output of the torque transducer amplifier is calibrated to produce 1 V for 20 oz-in torque. You will need to convert to SI units later.

4. Vary the armature voltage of Motor 1 from +4 V to -4V in 1V steps, keeping the rotor blocked and recording the armature current and the torque transducer output voltage at each step.

5. Calculate and plot the torque (in N-m) versus the current. Calculate $k_T$ by creating a line of best fit fromthe resulting plot, and recording the slope. Express your answer in (N-m/A).

- Voltage Constant

1. Using the Simulink Model apply 8 V DC to the armature of Motor 2 (causing both motors to rotate). Leave the armature of Motor 1 (test motor) open circuited.

2. Measure the armature voltage of Motor 1 (Its armature is still open circuited) on Channel 1 of the oscilloscope, and the tachometer voltage of Motor 1 on Channel 2. (Refer {numref}`Figure 5A.3`)

3. Connect the torque transducer amplifier output to Channel 3 of the oscilloscope. This represents a measure of the frictional torque of Motor 1.

4. Vary the voltage applied to the armature of Motor 2 from +8V to -8V in 2V steps and record the Motor 1 open circuit voltage, the tachometer voltage and the torque transducer output voltage at each step.

5. Calculate the rotor speed from the tach voltage and convert to rad/s. Speed is calculated using $w_r$ = $V_{a,tach} / k_{v,tach}$ where $V_{a,tach}$ is the tachometer voltage and $k_{v,tach}$ is the tachometer voltage constant (3V/krpm) converted to V/rad/sec.

6. Plot the open circuit voltage of Motor 1 versus the rotor speed (rad/sec). Generate a best fit line and determine $k_v$ from the slope of the given plot. 

7. Express the result in V-sec/rad. Verify that $k_T = k_v$ when both are expressed in SI units.
    ```{note} 1 V-sec/rad = 1 N-m/A```.

8. From the torque transducer voltage, calculate the frictional torque in N-m. Plot the frictional torque versus speed. Generate a best fit line and determine $B_m$ from the slope of the given plot.

## Postlab

1. How much do $r_a$ and $L_{AA}$ vary? Why do they vary?

2. What were your experimental values for $k_T$, $k_v$, $r_a$, $L_{AA}$ and $B_m$?

3. What is the relationship between open circuit voltage and speed? What is the relationship between torque and current? How does this relationship change with rotor speed?

4. What is the relationship between $k_T$ and $k_v$? What is the percentage difference between $k_T$ and $k_v$? Provide possible explanations for this difference.

5. Using $r_a$, $k_v$ and $k_T$ established in lab, calculate and plot the predicted first quadrant $T_e$ versus $w_r$ characteristics for this motor with $V_a$ = 4V Dc. Identify the stall torque ($T_e$ with $w_r = 0$) and the no load speed ($w_r$ with $T_e = 0$).