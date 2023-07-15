# Experiment 3B : Electromagnetic Forces

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
    1. Computer simulation.
    2. Dynamics of solenoid motion.
- Postlab.

## Introduction

In this lab, we will consider  the cylindrical solenoid represented in {numref}`Figure 3B.2`.
Self Inductance can be approximated as:

$$ L(x) = L_l + (K/(k_0 + x))$$ --- (3B.1)

Here, K and $$k_0$$ are known to be constants and $$L_l$$ is the leakage inductance. In the prelab, we will establish an expression for force versus position and express the electrical and mechanical equations in state space form.


## Prelab

Let M denote the mass of the plunger and f the externally applied force.
Newton's law of Motion may be expressed.

$ f + f_e(i,x) = M(d^x/dt^2)$ --- (3B.2)

The second order differential equation may be expressed as two first order equations

$ dv_x/dt = (1/M) [f_e(i,x) + f]$ --- (3B.3)

$ dx/dt = v_x$ ---(3B.4)

where $v_x$ is the velocity, x is the position, i is the current, v is the applied voltage and f is the externally applied force. 

The electrical equation may be expressed symbollically as

$ d\lambda/dt = g(\lambda,v,x) $ --- (3B.5)

where g is a function of the indicated arguments. Starting with $ v = r*i + d\lambda/dt$ and $\lambda = L(x)i$.

Derive an expression for g in terms of $\lambda$, v and x. Equations (3B.3)-(3B.5) represent the state equations of the electromechanical system where $v_x$ and x are the state variables while v and f are the inputs. The parameters are K, $k_0$ and r(Coil Resistance).

Three coupled first order differential equations contain non-linear terms and therefore are difficult to solve analytically. A Simulink model of the solenoid is shown in {numref}`Figure 3B.3`. This model is based upon the equations set forth in (3B.1) - (3B.5). Additional logic is provided to prevent the solenoid position from becoming negative(Impossible in classical Physics). In particular, when x tries to go negative, the output Q of the SR flip flop is set high , which in turn, sets and holds the integrator that calculates $v_x$ to zero. When the net applied force is greater than zero, the flip flop is reset, which "releases" the integrator that calculates $v_x$ (Allowing $v_x$ to become positive). Study this model carefully and prepare for a quiz at the beginning of the lab.

## Figures
Figure 3B.1
Figure 3B.2
Figure 3B.3 

## In the Laboratory

Try to resolve the gross discrepancies between measured and calculated plots by repeating necessary measurements. Identify discrepancies encountered.

### Objective: To Investigate Solenoid Dynamics

- Solenoid Dynamics

    1. Execute the program {file}`proj3.mdl` that is in the Lab 3B directory. This opens a Simulink project window.

    2. Simulate the solenoud pull in characteristics for [$x_0$ = 1/8", 3/8"] and [M = 0, 50, 100 and 150 grams]. In {file}`proj3.mdl`, M is the external mass. The plunger mass is 35 grams.

    3. Double click the {guilabel}`Subsystem` block to open a dialog window and fill the parameters ($x_0$, M, r, $L_l$, K and $k_0$)

    4. Right select the block in the Simulink project window and choose {guilabel}`Look Under Mask`. This opens a second window that displays the model in {numref}`Figure 3B.3`. 

    5. Run the model as a normal Simulink Model. ```{note} DO NOT BUILD A TARGET MODEL``` 

    6. Record the time for plunger to reach x = 0. 

    7. Make printouts of the waveforms for the (1/8" / 150 g) and (3/8" / 0 g) simulations.

- Measuring Plunger Pull in time

    1. Remove the weights from the solenoid plunger. 

    2. Position the plunger at 1/8" using the set screw for calibration. 

    3. Position the mechanical stop ({numref}`Figure 3B.1`) so that x cannot exceed 1/8". Then, remove the set screw. 

    4. Apply a 12 V step to the solenoid coil so that the solenoid should pull in the plunger.

    5. Set the oscilloscope to  single sweep mode and set the time scale to 20 ms/div. Capture the measured current waveform as the solenoid "pulls in". 
    ```{note} You will most likely need to repeat the above step to get the desired data.```

    6. Measure the time from the application of hte step voltage to the "dip" in current waveform using paired cursors.

    7. Add 50g, 100g, and 150g weights to the solenoid plunger and repeat the pull in time measurements.

    8. Use {program}`BenchVue` to get a print of the respone of the 1/8" , 150 gram showing the paired cursor measurement.

    9. Repeat the transition time measurements using a starting position of 3/8".

    10. Using {program}`BenchVue` capture and print the simulated and measured current versus time data for he 3/8" 0 g trial. Explain the discrepancies between the simulated and the experimental results.


## Postlab

1. Provide an explanation for the "dip" in solenoid current when the plunger pulls in. How do L(x), dL/dx, dx/dt vary during the pull in transient? Use relevant equations to provide answers to the following questions.
```{note} HINT : $ v = r*i + d[L(x)i]/dt = r*i + L(x)*(di/dt) + (dL(x)/dx)*(dx/dt) $ ```

2. Why does the solenoid inductance decrease as the plunger position increases?

3. Why does the solenoid force decrease as the plunger position increases?

4. What is the relationship between force and current? What is the relationship between force and position?

5. What happens to the plunger if the solenoid polarity is reversed?

6. Can the plunger be made to "push out" instead of "pull in". Explain.