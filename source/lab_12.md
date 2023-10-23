```{include} ./macros.md
```
(brushless_dc_motor_b)=
# Brushless DC Motor (B)


```{admonition} Objective
:class: note

In this experiment, the rotor position of the permanent-magnet synchronous
machine considered in {numref}`Experiment {number}<brushless_dc_motor_a>` will
be measured and used to control the frequency of a variable-frequency source
(inverter).  The purpose of this experiment is to show that the
torque-versus-speed characteristics of the motor-inverter combination, which
constitute a brushless DC motor, is similar to that of the conventional
permanent-magnet AC machine.

```


## Introduction

Using the parameters established in previous experiments, we should be able to
predict the torque-versus-speed characteristics of the given brushless DC motor.
These characteristics were plotted as part of last week's postlab.  In this lab,
we will attempt to verify these characteristics by experimental measurement.

There are several challenges in measuring the torque-versus-speed
characteristics of this motor.  First, because the motor is relatively small,
the friction and windage torques may be sizable relative to the electromagnetic
torque.  Thus, the reading from the torque transducer, which represents the
shaft torque (electromagnetic torque minus the friction and windage torques),
may not be an accurate indication of the actual electromagnetic torque except at
low speeds where friction and windage effects are less important.  In addition,
during normal operation, we are not applying sinusoidal voltages (we are
applying square-wave voltages).  Consequently, the electromagnetic torque will
not be constant in the steady state but will vary as a function of $\theta_r$. 
Nonetheless, the average torque at a given speed should be in reasonable
agreement with the value established using the analytical torque-versus-speed
characteristics.  The trouble is that we need a means of establishing the
average electromagnetic torque (not the average shaft torque).

The measurement of the average torque-versus-speed characteristic will be
accomplished in two steps.  First, we will measure the so-called static
torque-versus-position characteristics.  In particular, we will measure the
electromagnetic torque as a function of rotor position at stall ($\omega_r =
0$).  In an ideal brushless DC machine, the electromagnetic torque will be
constant (independent of rotor position).  However, because of previously
mentioned factors, the electromagnetic torque will vary as a function of rotor
position. If the torque versus position is averaged over one period (a quarter
rotation in an 8-pole motor), the average torque should be reasonably close to
the value predicted using the analytical torque-versus-speed formula with
$\omega_r = 0$.  Using previously measured data, we should be able to relate the
stator currents $i_{as}$, $i_{bs}$, and $i_{cs}$ to the electromagnetic torque.
We will verify this relationship for the static case ($\omega_r = 0$) and use it
for the general case ($\omega_r \ne 0$).

Although the following relationships were given in previous lab documents, we
will repeat them here for convenience:

```{math}
:label: eq:12:T_e

T_e
= \frac{P}{2} \left(
    i_{as} \frac{d \lambda_{asm}}{d \theta_r}
    + i_{bs} \frac{d \lambda_{bsm}}{d \theta_r}
    + i_{cs} \frac{d \lambda_{csm}}{d \theta_r}
\right)
```

where $\displaystyle \frac{d\lambda_{asm}}{d\theta_r}$, $\displaystyle
\frac{d\lambda_{bsm}}{d\theta_r}$, and $\displaystyle
\frac{d\lambda_{csm}}{d\theta_r}$ are functions of $\theta_r$. In particular,

```{math}
:label: eq:12:lambda_asm

\frac{d\lambda_{asm}}{d\theta_r} = \lambda_m^\prime \cos (\theta_r)
```

```{math}
:label: eq:12:lambda_bsm

\frac{d\lambda_{bsm}}{d\theta_r} = \lambda_m^\prime \cos (\theta_r - \qty{120}{\degree})
```

```{math}
:label: eq:12:lambda_csm

\frac{d\lambda_{csm}}{d\theta_r} = \lambda_m^\prime \cos (\theta_r + \qty{120}{\degree}).
```


## Prelab

Read the preceding introduction.


## In the Laboratory


### Static Torque-Versus-Position Characteristics


%1. Connect the rotor of the brushless DC motor to the torque transducer. Also,
%   connect the end of the torque transducer to the digital position encoder as
%   shown in {numref}`fig:12:setup`.  Secure all couplings. 
%
%   ```{figure} ./figures/lab_12/setup.png
%   :name: fig:12:setup
%   
%   Laboratory setup.
%   ```

1. Connect phase $a$ to the amplifier output of *Channel 1* and phase $b$ to
   ground.  Leave phase $c$ unconnected. The output of the position transducer
   should be connected to the *Digital Data Inputs* port. 

2. Connect the amplifier output of the torque transducer to *Analog Input 1*.
   Set the range of the *Channel 1* input to $\qty{+1}{\V}$ (middle position).
   Tare the torque transducer before applying voltage to the motor.

3. The torque-versus-position will be measured using the prebuilt
   {program}`Simulink` models
   {download}`T_vs_pos_tgt.slx<lab_files/lab_12/T_vs_pos_tgt.slx>` and
   {download}`T_vs_pos_host.slx<lab_files/lab_12/T_vs_pos_host.slx>`.
   The top-level views of these models are shown in {numref}`fig:12:tgt` and
   {numref}`fig:12:host`, respectively.

   ```{figure} ./figures/lab_12/tgt.png
   :name: fig:12:tgt
   :width: 80%
   
   Simulink target model {file}`T_vs_pos_tgt.slx` for measuring torque
   versus position.
   ```

   ```{figure} ./figures/lab_12/host.png
   :name: fig:12:host
   :width: 80%

   Simulink host model {file}`T_vs_pos_host.slx` for measuring torque
   versus position.
   ```

   % TODO update the following description for the new model.
4. Open {file}`T_vs_pos_tgt.slx`.  The model consists of a *Constant* source,
   set to 1, connected to *Channel 1* of the *Analog Output Module*, a *Ground*
   source connected to the remaining channels of the *Analog Output Module*, and
   an Encoder block connected to a *Terminator sink*. It also includes an
   *Analog Input Module* with all ports connected to terminators. Build the
   model, and confirm a successful build in the *View Diagnostics* window.

5. The simulation that will run on the host computer is configured as a Normal
   simulation.  This simulation samples the output of blocks in the target
   computer simulation, {file}`T_vs_pos_tgt.slx`.  The position and torque of
   the BDC motor are displayed in digital displays in the model window.

6. Apply a $\qty{1}{\V}$ DC signal to the phase-$a$ winding by running the
   model.  Open {file}`T_vs_pos_host.slx` and select {guilabel}`Run` to begin
   the host simulation. Allow the rotor to settle out to its equilibrium
   position.  Record the position of the rotor from the numeric display. Measure
   and record $i_{as} = -i_{bs}$.

7. Using your hand, rotate the motor rotor slowly and smoothly from the encoder
   end of the torque transducer. As the rotor rotates, the computer calculates a
   new value of torque for each position the motor rotates through and updates
   the digital displays of the host simulation.
   % the X-Y plot and digital displays of the host simulation.  The resulting
   % torque versus position curve will be displayed on the X-Y plot.  After
   % rotating the rotor through one complete revolution, as verified by the X-Y
   % plot, stop the host simulation. 
   Use the following {program}`MATLAB` command line to save the data:

   ```matlab
   bdctorq ('ta.mat', position, torque)
   ```

   The resulting data file {file}`ta.mat` can be used for subsequent plotting
   and analysis using {program}`MATLAB`.

8. Disconnect the power amplifier output from phase $a$ and connect it to phase
   $b$. Connect phase $c$ to ground. Restart the host simulation and tare the
   torque transducer. Measure the currents and torque versus position of the
   phase $b$ winding as done with the $a$ winding. Again, save the data in file
   {file}`tb.mat`.  Repeat the previous steps for the phase-$c$ winding with
   phase $a$ connected to ground and phase $b$ disconnected, saving the data in
   {file}`tc.mat`.  Load {file}`ta.mat` into Matlab. The data will be stored as
   2-column matrices of position ($\radian$) and torque ($\newtonmeter$).
   Separate the data into vectors of torque and position.

   ```matlab
   qrma = position
   torquea = torque
   ```

9. Repeat these {program}`MATLAB` commands for phases $b$ and $c$, by loading
   {file}`tb.mat` and {file}`tc.mat`, substituting the appropriate letter for
   the `a` in `qrma` and `torquea`. Plot and print the three torque curves.

   ```matlab
   plot(qrma, torquea, qrmb, torqueb, qrmc, torquec)
   ```

   Print the results and save your Matlab workspace by typing

   ```matlab
   save lab12_te
   ```

10. Email the file {file}`lab12_te.mat` to your partner in a zipped folder. You
    will need this file to complete the postlab.  Based upon the measured
    torque-versus-position characteristic and the measured currents, calculate
    $\lambda_m^\prime$.  Use the average current to find
    $\lambda_{m,ab}^\prime$, $\lambda_{m,bc}^\prime$, and
    $\lambda_{m,ca}^\prime$.  Then average to find $\lambda_m^\prime$. Compare
    with previously calculated values.  Stop simulations.

11. Next, connect phases $a$, $b$, and $c$ to the outputs of *Channels 1, 2, and
    3*, respectively and execute
    {download}`lab_11_bdc3_target.slx<lab_files/lab_11/lab_11_bdc3_target.slx>`
    which implements the switching algorithm used in last week's experiment.
    Turn the motor on, and apply a load torque to the motor to stall the motor.
    Measure the torque transducer amplifier output voltage on the oscilloscope
    to establish the shaft torque. Rotate the rotor slowly to determine the
    maximum shaft torque and record this as the measured stall torque. Tare the
    torque transducer prior to this test to obtain the correct value. 

12. Ask your instructor to disconnect the rotor from the torque transducer (to
    reduce friction and windage losses) and turn the motor back on. Measure the
    frequency of the applied voltages $v_{ag}$, $v_{bg}$, and $v_{cg}$ and
    calculate the no-load electrical speed from the average frequency. Plot the
    torque-versus-electrical speed characteristic assuming it is a straight
    line, with the predicted characteristic (from {eq}`eq:11:T_e_4`) on one axis.


## Postlab

1. Plot the predicted torque-versus-electrical speed characteristics and the
   measured results on the same axis.

2. Compare analytical and measured stall torques.

3. Compare analytical and measured no-load electrical speeds.

4. In each of the above items, provide plausible explanations for any
   discrepancies between measured and predicted values.