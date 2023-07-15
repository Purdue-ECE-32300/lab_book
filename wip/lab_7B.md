# Experiment 7B: Brushless DC Motor

```{admonition} Objective
:class: note
- To measure the rotor position of the permanent magnet synchronous machine considered in Experiment 7A and use it to control the frequency of a variable-frequency source (inverter).
- To show that the torque versus speed characteristics of the motor inverter combination, which constitute a brushless DC Motor is similar to that os a conventional permanent magnet AC machine.
```

## Outline

- Prelab
- Introduction
- Figures
- In the Laboratory
    1. Static torque versus position characteristics
    2. Steady state torque versus speed characteristics
- Postlab

## Prelab

Read the Introduction below.

## Introduction

Using the parameters established in previous experiments, we should be able to predict the torque versus speed characteristics of the given brushless DC motor. These characteristics were plotted as part of last week's Postlab. In this lab, we will attempt to verify these characteristics by experimental measurement.

There are several challenges in measuring the torque versus speed characteristics of this motor. First, because the motor is relatively small, the friction and the windage torques may be sizable relative to the electromagnetic torque. Thus, the reading from the torque transducer, which represents the shaft torque (Electromagnetic Torque minus the friction and windage torques), may not be an accurate indication of the actual electromagnetic torque except at low speeds where friction and windage effects are less important. In addition, during normal operation, we are not applying sinusoidal voltages (Square Wave Voltages are used). Consequently, the electromagnetic torque will not be constant in the steady state but will vary as a function of $\theta_r$.

Nonetheless, the average torque at a given speed should be in reasonable agreement with teh value established using the analytical torque versus speed characteristics. The trouble is that we need a means of establishing the average electromagnetic torque (Not the average shaft torque).

The measurement of the average torque versus speed characteristics will be accomplished in two steps. First, we will measure the so called static torque versus position characteristics. In particular, we will measure the electromagnetic torque as a function of rotor position at stall ($w_r = 0$) In an ideal brushless DC machine, the electromagnetic torque will be constant (independent of rotor position). However, because of previously mentioned factors, the electromagnetic torque will vary as a function of rotor position. If the torque versus position is averaged over one period (A quarter rotation in 8 pole motor), the average torque should be reasonably close to the predicted value using the analytical torque versus speed formula with $w_r = 0$. Using previously measured data, we should be able to relate stator currents $i_{as}$, $i_{bs}$ and $i_{cs}$ to the electromagnetic torque. We will verify this relationship for the static case ($w_r = 0$) and use it for the general case ($w_r \neq 0$).

Although the following relationships were given in the previous lab documents, we will repeat them here for convenience:

$T_e = (P/2)*(i_{as}*\frac{d\lambda_{asm}}{d\theta_{r}} + i_{bs}*\frac{d\lambda_{bsm}}{d\theta_{r}}+i_{cs}*\frac{d\lambda_{csm}}{d\theta_{r}})$ --- (7B.1)

where $\frac{d\lambda_{asm}}{d\theta_{r}}$, $\frac{d\lambda_{bsm}}{d\theta_{r}}$ and $\frac{d\lambda_{csm}}{d\theta_{r}}$ are the functions of $\theta_r$. In particular,

$\frac{d\lambda_{asm}}{d\theta_{r}} = \lambda_m' * cos\theta_r$ --- (7B.2)

$\frac{d\lambda_{bsm}}{d\theta_{r}} = \lambda_m' * cos(\theta_r - 120^\circ)$ --- (7B.3)

$\frac{d\lambda_{csm}}{d\theta_{r}} = \lambda_m' * cos(\theta_r + 120^\circ)$ --- (7B.4)

## Figures

Figure 1 
Figure 2
Figure 3

## In the Laboratory

- Static Torque versus Position Characteristics

1. Connect phase A to the amplifier output of Channel 1 and phase B to the ground. Leave phase C unconnected. The output of the position transducer should be connected to the `Digital Data Input` Port.

2. Connect the amplifier output of the torque transducer to Analog Input 1. Set the range of Channel 1 input to +1 V (middle position). Tare the torque transducer before applying voltage to the motor.

3. The torque versus position will be measured using the prebuild Simulink Models {program}`T_vs_position_tgt.slx` and {program}`T_vs_position_host.slx`. The top level views of these models are shown in {numref}`Figure 2` and {numref}`Figure 3` respectively.

4. Open {program}`T_vs_position_tgt.slx`. The model consists of a `Constant` source, set to 1, connected to the remaining channels of the `Analog Output Module`, a Ground source connected to the remaining channels of the Analog Output Module, and an Encoder block connected to a Terminator Sink. It also includes an Analog Input Module with all ports connected to terminators. Build the model and confirm a successful build in the `View Diagnostics` Window.

5. The simulation that will run on the host computer is configured as a Normal simulation. This simulation samples the output of blocks in the target computer simulation, {program}`T_vs_position_tgt.slx`. The position and torque of the BLDC motor are displayed in the digital displays in the model window.

6. Apply a 1 V DC signal to phase A winding by running the model. Open {program}`T_vs_position_host.slx` and select `Run` to begin the host simulation. Allow the rotor to settle out to its equilibrium position. Record the position of the rotor from the numeric display. Measure and record $i_{as}$ = $i_{bs}$.

7. Using your hand, rotate the motor slowly and smoothly from the encoder end of the rorque transducer. As the rotor rotates, the computer calculates a new value of torque for each position the rotor rotates through and updates the digital displays of the host simulation. Use the following MATLAB command line to save the data:

    `bdctorq('ta.mat',position,torque)`

The resulting data file {file}`ta.mat` can be used for subsequent plotting and analysis using MATLAB.

8. Disconnect the power amplifier output from phase A and connect it to phase B. Connect phase C to the ground. Restart the host simulation and tare the torque transducer. Measure the currents and torqueversus position of the phase B winding as done with the phase A winding. Again save the data in a file named {file}`tb.mat`. Repeat the previous steps for the C phase winding with phase A connected to ground and phase B disconnected. Save the data in {file}`tc.mat`. Load the {file}`ta.mat`. The data will be stored as 2 column matrices of position (radians) and torque  (N-m). Seperate the data into vectors of torque and position.

    `qrma = position`
    `torquea = torque`

9. Repeat these MATLAB commands for the phases B and C by loading {file}`tb.mat` and {file}`tc.mat`, substituting the appropriate letter for the a in qrma and torquea. Plot and print the three torque curves.

    `plot(qrma,torquea,qrmb,torqueb,qrmc,torquec)`

    Print the results and save your Matlab workspace by typing

    `save lab7b_te`

10. Email this file to your lab partner, you will need it to complete the Postlab. Based upon the measured torque versus position characteristic and the measured currents, calculate $\lambda_m'$. Use the average current to find $\lambda_{m,ab}'$, $\lambda_{m,bc}'$ and $\lambda_{m,ca}'$. Then the average to find $\lambda_m'$. Compare with previously calculated values. Stop simulations.

11. Next, connect phases A, B and C to the outputs of Channels 1, 2 and 3 respectively and execute {file}`lab7a_bdc3` which implements the switching algorithm used in the last week's experiment. Turn the motor ON and apply a load torque to the motor to stall the motor. Measure the torque transducer amplifier output voltage on the oscilloscope to establish the shaft torque and record this as the measued stall torque. Tare the torque transducer prior to this test to obtain the correct value.

12. Ask your instructor to disconnect the rotor from the transducer (To reduce friction and windage losses) and turn the motor back ON. Measure the frequency of the applied voltages $v_{ag}$, $v_{bg}$ and $v_{cg}$ and calculate the no load speed from the average frequency. Plot the torque versus speed characteristic assuming it is a straight line with the predicted characteristic (From (7A.26)) on one axis.

## Postlab

1. Plot the predicted torque versus speed characteristics and the measured results on the same axis.

2. Compare analytical and measured stall torques.

3. Compare analytical and measured no load speeds.

4. In each of the above items, provide plausible explanations for any discrepancies between measured and predicted values.