# Experiment 8B: Induction Motor and 2 phase servo motors

```{admonition} Objective
:class: note
- To demonstrate the operating principles of induction and two phase servo motors.
- Measure the basic parameters of Two phase servo motor and use them to predict its torque versus speed characteristics for balanced operating conditions.
- Measure steady state characteristics and compare with analytical solutions.
- Illustrate servo operation by varying the amplitude of one of the phase voltages.
```

## Outline:

- Prelab
- Introduction
- Figures 
- In the Laboratory
    1. Measurement of Torque versus speed characteristics
    2. Servo Operation
    3. Single Phase Operation
- Postlab

## Prelab

Read and Review Section 8.8 of ECE 32100 Textbook.

## Introduction

The Steady State equivalent circuit of a 2 phase induction motor is shown in {numref}`Figure 1` below.

where 

s = $(w_e - w_r)/w_e$ --- (8B.1)

and 

$ w_r = \frac{P}{2} * w_rm$ --- (8B.2)

The electromagnetic torque can be expressed as

$T_e = 2 * \frac{P}{2} * L_{ms} * Re[j*\tilde{I_as}^* * \tilde{I_ar}^']$ --- (8B.3)

With constant amplitude constant frequency balanced voltages applied to the stator windings

$T_e = \frac{2 * \frac{P}{2} * \frac{X_{ms}^2}{w_e}*r_r'*s|\tilde{V_{as}}^2|}{[r_s*r_r' + s*(X_{ms}^2 - X_{ss}^2 - X_{ss}*X_{rr}')]^2 + (r_r'*X_{ss} + s*r_s*X_{rr}')^2}$ --- (8B.4)

In {numref}`Figure 8B.4`, all X's represent L's multiplied by the source frequency, X = $w_e$*L. Also,

$X_{ss} = X_{ls} + X_{ms}$ --- (8B.5)

$X_{rr}' = X_{lr}' + X_{ms}$ --- (8B.6)

## Figures

Figure 1 ..

## In the Laboratory

### Objective 1: To measure the steady state torque versus speed characteristics

- Torque versus Speed Characteristics

1. Connect the analog output of the torque transducer to `Analog Input Channel 1`. Set the gain switch to 1.

2. Connect the tachometer output to `Analog Input Channel 2`. Set the gain switch to 10.

3. Connect the `Analog Output Channel 1` to phase A of the Induction Motor (red to red), `Analog Output Channel 2` to phase B of the Induction Motor (Blue to red), and the induction motor return lead to the ground of either `Analog Output Channel 1` or `Analog Output Channel 2` (White to Black).

4. Connect the `Analog Output Channel 3` to the armature of the DC motor (Red to Red, Black to Black).

5. Use the Simulink Model, {program}`sliptorq_tgt.slx` {numref}`Figure 2` , to provide a 10 V balanced 2 phase set of voltages to the stator windings connected to the power amplifier outputs, Channels 1 and 2 with a frequency of 10 Hz. In addition, this model will provide a DC output to Channel 3. Initially set the DC voltage to 0. Set the {guilabel}`To_IP_address` to IP address of the host computer.

6. With the Simulink Model {program}`sliptorq_tgt.slx` running on the target computer, open and start the Simulink Model {program}`sliptorq_host.slx`. Set the {guilabel}`FromAddress` to the IP address of the target computer. The host model will display the torque and speed of the induction motor. Vary the voltage applied to the DC motor so that the rotor speed varies over a broad range, roughly -60 to 60 radians per second. This corresponds to an armature voltage of -4.5V to 6.5 V respectively. At each value of DC voltage, allow the motor to settle to its steady state torque and speed, and then toggle the switch from 1 to 0 to record a data point. After recording 10 data points, stop the host simulation and save your MATLAB workspace by typing `save lab8b_ts`.

7. Copy the file {file}`lab8b_ts.mat` to your ECN account and email it to your partner in a zipped folder. You will need this file to complete the Postlab.

8. Compare the measured torque versus speed characteristics with those predicted in last week's Postlab by plotting them on the same axis. Print the results.

- Servo Operation

1. Leave the induction mototr connected to the torque transducer. Block the end of the torque transducer connected to the DC motor to prevent it from turning. Execute the program {program}`sliptorq_tgt.slx` and set the amplitude of the phase A voltage to 10 V, the amplitude of the phase B voltage to 0, and unplug the DC motor from Channel 3. Record the steady state torque using {program}`sliptorq_host.slx` by toggling the switch from 1 to 0.

2. Increase the amplitude of the phase B voltage to 2 V and record the average steady state torque. Repeat the previous measurement in 2 V  increments up to 20 V leaving the host model running during the duration of the test. Clear the workspace, then stop the host model upon completing all measurements and save the torque data by typing `save lab8b_servo.mat`. Plot the average torque versus the amplitude of phase B voltage. The resulting plot should be linear.

3. The analysis for this mode of operation is given in Chapter 9 of the ECE 32100 textbook. The purpose of this exercise is to demonstrate the operation of the induction motor as a servo motor wherein the amplitude of the control winding voltage is used to control the motor torque. This might be useful in position control systems.

- Single Phase Operations

1. Ask your instructor to disconnect the torque transducer from the induction motor. Run the program {program}`sliptorq_tgt.slx'.

2. Disconnect the phase B winding from `Analog Output Channel 2`. This is not the same as setting the output of the `Analog Output Channel 2` to zero. Why?

3. Apply a 20 V sinusoidal voltage to phase A. Does the rotor begin to turn? (It shouldn't). With a twist of your finger, spin the rotor in one direction. Does the rotor continue to rotate in the opposite direction? (It Should)

4. With your fingers, apply a load torque to stop the rotor. With a twist of your fingers, rotate the rotor in the opposite direction. Does it continue to rotate in the opposite direction? (It should)

5. This represents the single phase mode of operation which is frequently used in home appliances. The analysis for this mode of operation is given in Chapter 9 of the ECE 32100 textbook. In this mode, the phase current produces two equal amplitude CW and CCW rotating magnetic fields as was demonstrated in Lab 6a. When you turn the motor in one direction, it attempts to follow one of the rotating field. When turned in the other direction, it follows the other rotating field. At stall, the tendency to rotate in one direction is canceled by an equal tendency to rotate in the other direction. Unfortunately, we can't get into much more detail without covering chapter 9.