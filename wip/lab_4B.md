# Experiment 4B : Variable Reluctance Stepper Motor

```{admonition} Objective
:class: note
- To investigate the electromechanical characteristics of a variable reluctance motor.
- Experimental measurement of basic parameters.
- Measurement of static torque versus position characteristics.
- Examination of steady-state operation at constant step rates and experimentally establish the maximum start rate and maximum step rate.
```

## Outline
- Prelab
- Introduction
- Figures
- In the Laboratory
    1. Measurement of static torque versus position characteristics.
    2. Steady state operation at constant stepping rate.
    3. Maximum start rate.
    4. Maximum stepping rate.
- Postlab

## Prelab
- Review the lab and postlab sections.
- Keep postlab questions in mind when performing experiments.
- Make sure to keep accurate notes in your lab notebook in order to be able to answer postlab questions.

## Introduction
 The voltage equations of a three stack variable reluctance stepper motor may be expressed as

$V_{as} = r_s * i_{as} + \frac{d\lambda_{as}}{dt}$ --- (4B.1)

$V_{bs} = r_s * i_{bs} + \frac{d\lambda_{bs}}{dt}$ --- (4B.2)

$V_{cs} = r_s * i_{cs} + \frac{d\lambda_{cs}}{dt}$ --- (4B.3)

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
\end{bmatrix} --- (4B.4)

The self inductances may be expressed as

$L_{asas} = L_A + L_B * cos(RT\theta_{rm})$        --- (4B.5)

$L_{bsbs} = L_A + L_B * cos(RT(\theta_{rm} + SL))$ --- (4B.6)

$L_{cscs} = L_A + L_B * cos(RT(\theta_{rm} - SL))$ --- (4B.7)

where RT denotes the number of rotor teeth and SL is the step length. From (9.2-3) of the ECE 32100 Textbook.

SL = $2*\pi$ / RTN   --- (4B.8)

Here, N = 3 is the number of phases. The electromagnetic torque may be expressed as

$T_e = -(RT/2) * L_B * [i_{as}^2*sin(RT\theta_{rm}) + i_{as}^2*sin(RT(\theta_{rm} + SL)) + i_{as}^2*sin(RT(\theta_{rm} - SL))]$     --- (4B.9)

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

- Measurement of static torque versus position characteristics
    
    1. The torque versus position will be measured using the pre built Simulink Models {guilabel}`T_vs_position_tgt.slx` and {guilabel}`T_vs_position_host.slx`. The top level views of these models are shown in {numref}`Figure 2` and {numref}`Figure 3` respectively. 

    2. Connect the analog output of the torque transducer (red wire) to `Analog Output 1`.

    3. Set the range of `Analog Input 1` to +1 V (middle position). The output of the position transducer should be still connected to the 25 pin Digital Input Port.

    4. Open {guilabel}`T_vs_position_tgt.slx`. Build, connect to target and run this model. A successful build will be noted in the `View Diagnostics` window.

    5. The simulation that will run on the host computer is configured as a `Normal` simulation. Thi simulation samples the output of blocks in target computer simulatio, {guilabel}`T_vs_position_tgt.slx`. The position and torque of the stepper motor are displayed in digital displays of the model window.

    6. Zero out the torque transducer by pressing the "tare" button before running the host simulation. Allow the rotor to settle to its equilibrium position. In the model window {guilabel}`T_vs_position_tgt.slx`, select `Run` to begin the host simulation.

    7. Record the position of the rotor from the numeric display. Using your hand, move the motor slowly and smoothly from encoder end to torque transducer end. As the motor rotates, the computer calculates a new value of torque for each position and motor rotates through and updates the digital displays of the host simulation. After rotating the rotor, through one complete revolution, stop the host simulation. Use the following MATLAB command to save the data:

    `steptorq ('ta.mat',position,torque)`

    The resulting {file}`ta.mat` file can be used for subsequent plotting and analysis using MATLAB.

    8. Disconnect the power amplifier output from the phase A and connect it to phase B. Restart the host simulation. Measure the torque versus position of the phase B winding as done with the phase A winding. Save the data in {file}`tb.mat` and {file}`tc.mat` for B and C phases. Load `ta.mat` in MATLAB. The data will be stored in 2 column matrices of position(radians) and torque(N-m). Seperate the data into vectors of torque and position.

    `qrma = position`
    `torquea = torque`

    9. Repeat these MATLAB commands for phases B and C by loading `tb.mat` and `tc.mat`, substituting the appropriate letter for the `a` in `qrma` and `torquea`. Plot the three torque curves.
        `plot(qrma,torquea,qrmb,torqueb,qrmc,torquec)`

    10. Compare the plotted results with those predicted in the previous Postlab by plotting them on the same axis. Try to resolve gross discrepancies. Print the results and save to your MATLAB workspace as `lab_4BT_e`. Email this file to your lab partner. You will need it for the Postlab.

- Steady state operation at a constant stepping rate
    
    1. Open the Simulink target model {file}`full_step.slx` shown in Figure 4. Excite the three stator phases with full step square waves at a rate of 10 step/sec (Phase A winding is excited with a positive DC voltage, then phase B, then phase C and then phase A etc.) by setting the frequency of the signal generator to 10 Hz with an amplitude of 1. Start the target computer by connecting to target and pressing `Run on Target`. Clicking the manual switch should cause the motor to start rotating. Since this is a 3 phase motor, the frequency of each of the applied stator voltages (i.e frequency of phase A, B and C) is 1/3 the step rate. Based upon the known step length, what is the corresponding average rotor speed (in rad/sec) of the 10 Hz step rate?

    2. Using the digital oscilloscope and {file}`BenchVue`, record and print the voltage of Phase A, B and C in the full stepping mode. Do you see any similarity to the current waveform and the current waveform for the solenoid pull in measured in Experiment 3? Be prepared to explain the similarities/differences in Postlab.

    3. Apply a small load torque (pressing on the pulley with your finger) to the rotor, but not so large as to cause the motor to fall out of step. Note any differences between the loaded and unloaded current waveforms.

    4. Which direction does the motor turn for the abc step sequenc (CW and CCW with respect to the motor mounting face)? What happens if one of the motor phase's polarity is reversed (Say Phase A polarity). What happens if two phases (Say A and B) are swapped?

- Maximum initial start rate:

    1. With the rotor initally at rest (0 steps/sec), change the step rate to 10 steps/sec. Did the motor fall out of step? If not, stop the rotor and repeat the step change of the step rate from 0 to 20 steps/sec. Repeat this experiment in increments of 10 steps/sec until you have established the maximum step rate that can be suddenly applied to the motor. (i.e. how big a step in step rate) from the rest. ```{note} When the motor does not rotate at the applied step rate, this is called falling out of step.```

- Maximum rotation rule

    1. With the rotor initially at rest (0 steps/sec), change the step rate to 10 steps/sec. Increase the rotor step rate (without stopping) in increments of 10 steps/sec until you have established the maximum step rate that the motor can sustain. How does this rate compare with the initial step rate measured in the previous section?

- Modes of commutation

    1. Stepper motors can be run in half step and full step modes. Full stepping is accomplished by driving the motor with only one phase energized at a time (a-b-c-a...). Half stepping is accomplished by overlapping two phases (a-ab-b-bc-c-ca-a...). By energizing two phases at a time, the stepper motor will effectively have twice as many steps due to ab, ac, and bc half steps between the a,b and c full steps. The half step mode will give the motor more step resolution and make the motor run smoother but requires more power due to each phase being driven longer.

    2. Open the Simulink Model {file}`half_step.slx` shown in {numref}`Figure 5`. Using the digital oscilloscope and {file}`BenchVue`, record and print the phase A voltage, phase B voltage, phase A current and phase B current in half stepping mode. What is the duty cycle of each phase for half stepping? (i.e. What is the percentage of time each phase is ON?) What is the duty cycle for full stepping?

## Postlab

1. Compare the measured and predicted torque versus rotor position characteristics. Specifically, superimpose the phase A measured and predicted torque versus position on the same plot (Make sure units are the same). Try to explain any discrepancies.

2. What is the difference between half stepping and full stepping? Consider the relationships between the phase A, B and C.

3. What happened when the polarity of phase A was reversed? Explain briefly. What happened when the phases A and B werer swapped? Explain briefly.

4. Discuss the shape of the phase A current waveforms for half step and full step modes. Compare (Qualitatively) with the results of Experiment 3.

5. What factors might influence the maximum start rate and maximum step rate (i.e. How might we increase the achievable step rate?)