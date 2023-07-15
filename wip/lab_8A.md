# Experiment 8A: Induction Motors and Two Phase Servo Motors

```{admonition} Objective
:class: note
- To demonstrate the operating principles of induction and two phase servo motors.
- Measure the basic parameters of Two phase servo motor and use them to predict its torque versus speed characteristics for balanced operating conditions.
- Measure steady state characteristics and compare with analytical solutions.
- Illustrate servo operation by varying the amplitude of one of the phase voltages.
```

## Outline

- Prelab
- Introduction
    1. Measure electrical parameters.
- Postlab

## Prelab

Read Introduction and In-lab portions of this document.

## Introduction

The steady state equivalent circuit of a 2 phase induction machine, as it will be established in Chapter 8 of ECE 32100 Textbook is shown in Figure 1 below. The electromagnetic torque can be expressed as

$T_e = 2 * \frac{P}{2} * L_{ms} * Re[j*\tilde{I_as}^* * \tilde{I_ar}^']$ --- (8A.1)

With constant amplitude constant frequency balanced voltages applied to the stator windings

$T_e = \frac{2 * \frac{P}{2} * \frac{X_{ms}^2}{w_e}*r_r'*s|\tilde{V_{as}}^2|}{[r_s*r_r' + s*(X_{ms}^2 - X_{ss}^2 - X_{ss}*X_{rr}')]^2 + (r_r'*X_{ss} + s*r_s*X_{rr}')^2}$ --- (8A.2)

where s = $\frac{w_e - w_r}{w_e}$ is the slip (```{warning} DO NOT CONFUSE WITH LAPLACE OPERATOR)```). In (8A.2) and {numref}`Figure 8A.1`, all X's represent L's multiplied by the source frequency, X = $w_e*L$.

Also,

$X_{ss} = X_{ls} + X_{ms}$ --- (8A.3)

$X_{rr}' = X_{lr}' + X_{ms}$ --- (8A.4)

## Figures


## In the Laboratory

### Objective 1: To measure the electrical parameters of the motor. This can be accomplished by taking impedance measurements of the stator at stall and no load conditions.

- Stator Resistance

1. Using the Simulink Model {program}`lab8a.slx`, apply a 10 V DC voltage to one of the AC windings. Measure the Winding current.

2. Calculate the DC resistance of the stator. This represents an approximation to $r_s$.

- Blocked rotor test

1. Connect the current transducer (Bottom BNC Connector) outputs to `Analog Input Channels 1 and 2`. Set the range switch of `Analog Input Channels 1 and 2` to 1. Connect the power amplifier outputs Channels 1 and 2 to the two stator phases of the Induction Motor.

2. Use the Simulink Model {program}`impedanc_target.slx` {numref}`Figure 2` to provide a 10 V balanced 2 phase set of voltages to the stator windings connected to the power amplifier outputs, Channels 1 and 2 with a frequency of 10 Hz.

3. Connect `Analog Output Channel 1` to phase A of the Induction Motor (Red to Red), `Analog Output Channel 2` to phase B of the Induction Motor (Blue to Red) and the induction motor return lead to the ground of either `Analog Output Channel 1` or `Analog Output Channel 2` (White to Black).

4. Prior to energizing the motor, block the rotor with your hands to prevent it from turning. With the Simulink Model, {program}`impedanc_target.slx`, running on the target, open and start the Simulink model {program}`impedanc_host.slx` {numref}`Figure 3`. The host model will display the resistance and reactance for both the A and B phases. Allow the measured values to settle down (Approx 30 seconds) then flip the manual switch from 1 to 0 to record the resistance, reactance and frequency data in the MATLAB workspace. Save your MATLAB workspace by stopping the host model and typing save {program}`lab8a_br`.

5. From the equivalent circuit, the blocked rotor impedance may be approximated as

    $(r_s + r_r') + jw_e(L_{ls} + L_{lr}') $ --- (8A.5)

Assuming $L_{ls} = L_{lr}'$, establish the parameters $r_r'$, $L_{ls}$ and $L_{lr}'$

- No Load Test

1. Now, repeat the blocked rotor test using the same procedure but allow the rotor to rotate freely.

2. The host model will display the resistance and the reactance for both the A and B phases. Remember to let the measured values settle down then flip the manual switch from 1 to 0 to record the resistance, reactance and frequency data in the Matlab workspace. Save your Matlab workspace by stopping the host model and typing `save lab8a_nl`.

3. Copy and save the file {file}`lab8a_nl.mat`. You will need this file to complete the postlab.

4. From the steady state equivalent circuit, the no load impedance may be approximated as

    $r_s + j*w_e(L_{ls} + L_{ms})$ --- (8A.6)

Approximate $L_{ms}$

### Objective 2: To calculate tge frequency response to stator.

- Blocked Rotor Frequency Response:

1. Block the rotor with your hands to prevent it from turning.

2. Use the same Simulink Models as used for the block rotor test. Start the real time code.

3. Step the frequencies from 1 to 100 Hz (Using intervals 1, 1.5, 2, 3, 4, 6, 8, 10, 15, 20, 30, 40, 60, 80, 100) by clicking on the 2 phase source block in {program}`impedanc_target.slx`. Let the measured values settle (approx. 30s). At each frequency, add th resistance, reactance and frequency data to the workspace by flipping the manual switch from 1 to 0 in {program}`impedanc_host.slx`. Save your MATLAB workspace by stopping the host model and typing

    `save lab8a_fr`

4. Copy and save the file {program}`lab8a_fr.mat`. You will need this file to complete the Postlab.

5. Plot the stator impedance as a function of frequency. Print the frequency response.

## Postlab

1. For the values of $r_s$, $L_{ls}$, $L_{ms}$, $L_{lr}'$ and $r_r'$ established using the no load and blocked rotor tests, write a MATLAB script that calculates and plots the blocked rotor ($w_r$ = 0) impedance versus frequency as measured from the stator, i.e.

Z = $(r_s + j*w_e*L_{ls}) + (j*w_e*L_{ms}) || (r_r' + j*w_e*L_{lr}') $ --- (8A.7)

where the '||' operator refers to the parallel combination of the two impedances. Compaare this plot with measured impedance versus frequency. Explain discrepancies.

2. For a given frequency, $w_e$, why does the impedance of the motor change with rotor speed $w_r$?

3. How much torque will the induction motor generate with a DC input current when the rotor is stationary? How much torque is produced with a DC input current when the rotor is moving?

4. Plot the predicted torque versus speed characteristics described in {numref}`Figure 8A.2` with $V_s = 10/\sqrt(2)$ V RMS. ```{hint} P = 4 and $w_e = 2*\pi*10$ rad/s```. Let $w_r$ vary from -2$w_e$ to 3$w_e$.

5. At what rotor speed (s) will the electromagnetic torque be zero? Explain briefly.
