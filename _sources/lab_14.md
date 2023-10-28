```{include} ./macros.md
```
(induction_and_servo_motors_b)=
# Induction Motors and Two Phase Servo Motors (B)

```{admonition} Objective
:class: note

The purpose of this experiment is to demonstrate the operating principles of
induction and servo motors.  The basic parameters of a 2-phase servo motor will
be measured and used to predict its torque-versus-speed characteristics for
balanced operating conditions.  The steady-state characteristics will be
measured and compared with analytical predictions.  Servo operation will be
illustrated by varying the amplitude of one of the phase voltages.

```


(induction_and_servo_motors_b_introduction)=
## Introduction

The steady-state equivalent circuit of a 2-phase induction motor is shown in
{numref}`fig:14:equivalent_circuit` below.

```{figure} ./figures/lab_14/equivalent_circuit.png
:name: fig:14:equivalent_circuit
:width: 80%

Induction motor steady-state equivalent circuit.
```

where

```{math}
:label: eq:14:slip

s = \frac{\omega_e - \omega_r}{\omega_e}
```
and
```{math}
:label: eq:14:speed

\omega_r = \frac{P}{2} \omega_{rm}.
```

The electromagnetic torque can be expressed
```{math}
:label: eq:14:torque

T_e
= 2 \left( \frac{P}{2} \right) L_{ms} \RE{\left[
   j \tilde I_{as}^* \tilde I_{ar}^\prime
\right]}.
```

With constant-amplitude constant-frequency balanced voltages applied to the stator windings

```{math}
:label: eq:14:torque_2

T_e
= \frac
   {2 ( P / 2 ) (X_{ms}^2 / \omega_e) r_r^\prime s |\tilde V_{as}|^2}
   {
      \left[ r_s r_r^\prime + s (X_{ms}^2 - X_{ss} X_{rr}^\prime) \right]^2
      + \left( r_r^\prime X_{ss} + s r_s X_{rr}^\prime \right)^2
   }.
```

In {eq}`eq:14:torque_2`, all $X$'s represent $L$'s multiplied by the source
frequency, $X = \omega_e L$. Also,

```{math}
:label: eq:14:stator_impedance

X_{ss} = X_{ls} + X_{ms}
```

```{math}
:label: eq:14:rotor_impedance

X_{rr}^\prime = X_{lr}^\prime + X_{ms}
```


## Prelab

Read the preceding {ref}`induction_and_servo_motors_b_introduction`, and read or
review Section 8.8 of EE 32100 text.


## In the Laboratory


(induction_and_servo_motors_b_torque_vs_speed)=
### Torque-Versus-Speed Characteristics

Our first objective will be to measure the steady-state torque-versus-speed
characteristics.

% 1. Connect the rotor shaft of the induction motor to one end of the torque
%    transducer.  Connect the other end of the torque transducer to the DC motor
%    used in {numref}`Experiment {number} - {name}<dc_motor_a>`.

1. Connect the analog output of the torque transducer to *Analog Input Channel
   1*.  Set the gain switch to $1$.

2. Connect the tachometer output to *Analog Input Channel 2*. Set the gain
   switch to $10$.

3. Connect *Analog Output Channel 1* to phase $a$ of the induction motor (red to
   red), *Analog Output Channel 2* to phase $b$ of the induction motor (blue to
   red), and the induction motor return lead to the ground of either *Analog
   Output Channel 1* or *Analog Output Channel 2* (white to black).

4. Connect *Analog Output Channel 3* to the armature of the DC motor (red to
   red, black to black).

5. Use the {program}`Simulink` model,
   {download}`slip_torque_target.slx<lab_files/lab_14/slip_torque_target.slx>`
   ({numref}`fig:14:slip_torque_target`) , to provide a $10$-$\V$ balanced
   2-phase set of voltages to the stator windings connected to the power
   amplifier outputs, Channels 1 and 2, with a frequency of $\qty{10}{\hertz}$.
   In addition, this model will provide a DC output to Channel 3.  Initially set
   the DC voltage to $0$. Set the {guilabel}`To_IP_Address` to the IP address of
   the host computer.

   ```{figure} ./figures/lab_14/slip_torque_target.png
   :name: fig:14:slip_torque_target
   
   {program}`Simulink` target model for lab 14.
   ```

6. With the {program}`Simulink` model {file}`slip_torque_target.slx` running on
   the target computer, open and start the {program}`Simulink` model
   {download}`slip_torque_host.slx<lab_files/lab_14/slip_torque_host.slx>`.  Set the
   {guilabel}`FromAddress` to the IP address of the target computer.  The host
   model will display the torque and speed of the induction motor.  Vary the
   voltage applied to the DC motor so that the rotor speed varies over a broad
   range, roughly $-60$ to $60$ $\radian\per\second$. This corresponds to an
   armature voltage of $-4.5$ to $\qty{6.5}{\V}$, respectively.  At each value
   of DC voltage, allow the motor to settle to its steady-state torque and
   speed, and then toggle the switch from $1$ to $0$ to record a data point.
   After recording $10$ data points, stop the host simulation, and save your
   {program}`MATLAB` workspace by typing {matlab}`save lab_14_ts`.

   ```matlab
   save lab_14_ts
   ```

   ```{figure} ./figures/lab_14/slip_torque_host.png
   :name: fig:14:slip_torque_host

   {program}`Simulink` host model for lab 14.
   ```

7. Copy the file {file}`lab_14_ts.mat` to your ECN account and email it to your
   partner in a zipped folder.  You will need this file to complete the post
   lab.

8. Plot the measured torque-versus-speed characteristics with those predicted
   in last week's postlab on the same axis. Print the results.


### Servo Operation

1. Leave the induction motor connected to the torque transducer.  Block the end
   of the torque transducer connected to the DC motor to prevent it from
   turning.  Execute the program {file}`slip_torque_target.slx` and set the
   amplitude of the phase-$a$ voltage to $\qty{10}{\V}$, the amplitude of the
   phase-$b$ voltage to $0$, and unplug the DC motor from *Channel 3*.  Record
   the steady-state torque using {file}`slip_torque_host.slx` by toggling the
   switch from $1$ to $0$.

2. Increase the amplitude of the phase-$b$ voltage to $\qty{2}{\V}$, and record
   the average steady-state torque.  Repeat the previous measurement in $2$-$\V$
   increments up to $\qty{20}{\V}$, leaving the host model running for the
   duration of this test. Clear the workspace, then stop the host model upon
   completing all measurements, and save the torque data by typing {matlab}`save
   lab_14_servo`.  Plot the average torque versus the amplitude of the
   phase-$b$ voltage.  The resulting plot should be linear.

   ```matlab
   save lab_14_servo
   ```

3. The analysis for this mode of operation is given in Chapter 9 of the ECE
   32100 text, which is not normally covered in ECE 32100.  The purpose of this
   exercise is to demonstrate the operation of the induction motor as a
   servomotor wherein the amplitude of the control winding voltage is used to
   control the motor torque.  This might be useful in position control systems.


### Single-Phase Operation

1. Ask your instructor to disconnect the torque transducer from the induction
   motor.  Run the program {file}`slip_torque_target.slx`.

2. Disconnect the phase-$b$ winding from *Analog Output Channel 2*.  This is not
   the same as setting the output of *Analog Output Channel 2* to zero.  Why?

3. Apply a $20$-$\V$ sinusoidal voltage to phase $a$. Does the rotor begin to
   turn?  (It shouldn't).  With a twist of your finger, spin the rotor in one
   direction.  Does the rotor continue to rotate? (It should).

4. With your fingers, apply a load torque to stop the rotor.  With a twist of
   your fingers, twist the rotor in the opposite direction.  Does it continue to
   rotate in the opposite direction? (It should).

5. This represents the single-phase mode of operation which is frequently used
   in home appliances.  The analysis for this mode of operation is given in
   Chapter 9 of the ECE 32100 text which is normally covered in a more advanced
   class.  In this mode, the phase current produces two equal-amplitude CW and
   CCW rotating magnetic fields as was demonstrated in {numref}`Experiment
   {number} - {name}<pmag_sync_motor_a>`.  When you turn the motor in one
   direction, it attempts to follow one of the rotating fields.  When you turn
   it in the other direction, it tries to follow the other rotating field.  At
   stall, the tendency to rotate in one direction is canceled by an equal
   tendency to rotate in the other direction.  Unfortunately, we can't get into
   much more detail without covering Chapter 9.


## Postlab

1. Compare the analytical and measured torque-versus-speed characteristics that
   you plotted in {ref}`induction_and_servo_motors_b_torque_vs_speed` (include
   your plot).  Explain discrepancies.

2. For servo mode, plot the average stall torque versus the amplitude of the
   control-winding voltage. Can we make the amplitude of the control winding
   voltage negative? Will this result in a negative average torque? (Yes and
   Yes). Explain briefly.

3. In the single-phase mode of operation, how do the amplitudes of the forward
   and backward rotating magnetic fields compare to the amplitude of the
   rotating magnetic field for normal two-phase operation. (You may want to
   review the results of {ref}`pmag_sync_motor_a` before answering this
   question). How much torque can be produced during single-phase operation
   compared with normal two-phase operation? (An educated guess with a brief
   explanation will suffice).
