```{include} ./macros.md
```
(induction_and_servo_motors_a)=
# Induction Motors and Two Phase Servo Motors (A)


```{admonition} Objective
:class: note

The purpose of this experiment is to demonstrate the operating principles of
induction and two-phase servo motors.  The basic parameters of a 2-phase servo
motor will be measured and used to predict its torque-versus-speed
characteristics for balanced operating conditions.  The steady-state
characteristics will be measured and compared with analytical predictions.
Servo operation will be illustrated by varying the amplitude of one of the phase
voltages.

```


(induction_and_servo_motors_a_introduction)=
## Introduction

The steady-state equivalent circuit of a 2-phase induction machine, as it will
be established in Chapter 8 of ECE 32100 text, is shown in
{numref}`fig:13:equivalent_cuicuit` below.

```{figure} ./figures/lab_13/equivalent_circuit.png
:name: fig:13:equivalent_cuicuit
:width: 80%

Induction motor steady-state equivalent circuit.
```

The electromagnetic torque can be expressed

```{math}
:label: eq:13:torque

T_e
= 2 \left( \frac{P}{2} \right) L_{ms} \RE{\left[
   j \tilde I_{as}^* \tilde I_{ar}^\prime
\right]}.
```

With constant-amplitude constant-frequency balanced voltages applied to the stator windings

```{math}
:label: eq:13:torque_2

T_e
= \frac
   {2 ( P / 2 ) (X_{ms}^2 / \omega_e) r_r^\prime s |\tilde V_{as}|^2}
   {
      \left[ r_s r_r^\prime + s (X_{ms}^2 - X_{ss} X_{rr}^\prime) \right]^2
      + \left( r_r^\prime X_{ss} + s r_s X_{rr}^\prime \right)^2
   }.
```

Where $s = \dfrac{\omega_e - \omega_r}{\omega_e}$ is the slip (not to be confused
with the Laplace operator). 

In {eq}`eq:13:torque_2` and {numref}`fig:13:equivalent_cuicuit`, all $X$'s represent $L$'s multiplied by the source frequency, $X = \omega_e L$. Also,

```{math}
:label: eq:13:stator_impedance

X_{ss}=X_{ls}+X_{ms}
```

```{math}
:label: eq:13:rotor_impedance

X_{rr}^\prime=X_{lr}^\prime+X_{ms}
```


## Prelab

Read the preceding {ref}`induction_and_servo_motors_a_introduction`, and
subsequent {ref}`induction_and_servo_motors_a_in_lab` portions of this
experiment.


(induction_and_servo_motors_a_in_lab)=
## In the Laboratory


Our first objective will be to measure the electrical parameters of the motor.
This can be accomplished by taking impedance measurements of the stator at stall
and no-load conditions.

### Stator Resistance

1. Using the Simulink model 
   {download}`resistance_target.slx<lab_files/lab_13/resistance_target.slx>`,
   apply a $10$-$\V$ DC voltage to one of the AC windings. Measure the winding
   current.

2. Calculate the DC resistance of the stator. This represents an approximation
   to $r_s$.


### Blocked Rotor Test

1. Connect the current transducer (bottom BNC connector) outputs to *Analog
   Input Channels 1* and *2*.  Set the range switch of *Analog Inputs Channels
   1* and *2* to $1$.  Connect the power amplifier outputs *Channels 1* and *2*
   to the two stator phases of the induction motor.

% 1. Connect the current transducer (bottom BNC) outputs so that the *Analog Input
%    Channel 1* current measurement is made from the phase supplied by the
%    *Analog Output Channel 1* voltage, and *Analog Input Channel 2*
%    current measurement is made from the phase supplied by the *Analog Output
%    Channel 2* voltage.

2. Use the Simulink model 
   {download}`impedance_target.slx<lab_files/lab_13/impedance_target.slx>`
   ({numref}`fig:13:impedance_target`) to provide a $10$-$\V$ balanced 2-phase
   set of voltages to the stator windings connected to the power amplifier
   outputs, *Channels 1* and *2*, with a frequency of $\qty{10}{\hertz}$.

   ```{figure} ./figures/lab_13/impedance_target.png
   :name: fig:13:impedance_target
   
   Target model for measuring impedance.
   ```

3. Prior to energizing the motor, block the rotor with your hands to prevent it
   from turning.  With the Simulink model, {file}`impedance_target.slx`, running
   the on the target, open and start the Simulink model
   {download}`impedance_host.slx<lab_files/lab_13/impedance_host.slx>`
   ({numref}`fig:13:impedance_host`).  The host model will display the
   resistance and reactance for both the $a$- and $b$-phases. Allow the measured
   values to settle down (approx. $\qty{30}{\second}$) then flip the manual
   switch from $1$ to $0$ to record the resistance, reactance and frequency data
   in the {program}`MATLAB` workspace.  Save your {program}`MATLAB` workspace by
   stopping the host model and typing {matlab}`save lab_13_br`.

   ```matlab
   save lab_13_br
   ```

   ```{figure} ./figures/lab_13/impedance_host.png
   :name: fig:13:impedance_host

   Simulink host model for measuring impedance.
   ```

4. From the equivalent circuit, the blocked-rotor impedance may be approximated as

   ```{math}

   (r_s + r_r^\prime) + j \omega_e ( L_{ls} + L_{lr}^\prime )
   ```

   Assuming $L_{ls} = L_{lr}^\prime$, establish the parameters $r_r^\prime$,
   $L_{ls}$, and $L_{lr}^\prime$.


### No-Load Test

1. Now, repeat the blocked-rotor test, using the same procedure as the
   blocked-rotor test, but allowing the rotor to rotate freely.

2. The host model will display the resistance and reactance for both the $a$ and
   $b$ phases.  Remember to let the measured values settle down then flip the
   manual switch from $1$ to $0$ to record the resistance, reactance, and
   frequency data in the {program}`MATLAB` workspace. Save your
   {program}`MATLAB` workspace by stopping the host model and typing
   {matlab}`save lab_13_nl`.

   ```matlab
   save lab_13_nl
   ```

3. Copy and save the file {file}`lab_13_nl.mat`. You will need this file to
   complete the postlab.

4. From the steady-state equivalent circuit, the no-load impedance may be
   approximated as

   ```{math}
   :name: eq:Z_nl
   
   r_s + j \omega_e ( L_{ls} + L_{ms} )
   ```

   Approximate $L_{ms}$.


### Blocked-Rotor Frequency Response

Our next objective will be to calculate the frequency response of the stator.

1. Block the rotor with your hands to prevent it from turning.

2. Use the same {program}`Simulink` models as used for the blocked-rotor test.
   Start the real-time code.

3. Step the frequencies from $1$ to $\qty{100}{\hertz}$ (using intervals $1$,
   $1.5$, $2$, $3$, $4$, $6$, $8$, $10$, $15$, $20$, $30$, $40$, $60$, $80$,
   $100$) by clicking on the 2-phase source block in
   {file}`impedance_target.slx`. Let the measured values settle (approx.
   $\qty{30}{\second}$).  At each frequency, add the resistance, reactance, and
   frequency data to the workspace by flipping the manual switch from $1$ to $0$ in
   {file}`impedance_host.slx`.  Save your {program}`MATLAB` workspace by
   stopping the host model and typing {matlab}`save lab_13_fr`.

   ```matlab
   save lab_13_fr
   ```

4. Copy and save the file {file}`lab_13_fr.mat`. You will need this file to
   complete the post lab.

5. Plot the stator impedance as a function of frequency. Make a printout of the
   frequency response.


## Postlab

1. For the values of $r_s$, $L_{ls}$, $L_{ms}$, $L_{lr}^\prime$, and
   $r_r^\prime$ established using the no-load and blocked-rotor tests, write a
   {program}`MATLAB` script that calculates and plots the blocked rotor ($ \omega_r = 0$)
   impedance versus frequency as measured from the stator, i.e.

   ```{math}
   :label: eq:Z
   
   Z
   = (r_s + j \omega_e L_{ls})
   + (j \omega_e L_{ms}) \parallel (r_r^\prime + j \omega_e L_{lr}^\prime)
   ```

   Where the "$\parallel$" operator refers to the parallel combination of the two
   impedances.  Compare this plot with measured impedance versus frequency.
   Explain discrepancies.

2. For a given frequency $\omega_e$, why does the impedance of the motor change
   with rotor speed $\omega_r$?

3. How much torque will the induction motor generate with a DC input current
   when the rotor is stationary? How much torque is produced with a DC input
   current when the rotor is moving? 

4. Plot the predicted torque-versus-speed characteristics described in (8a.2)
   with $V_s = \qty{10 / \sqrt 2}{\V}$, RMS. Let $\omega_r$ vary from $-2
   \omega_e$ to $3 \omega_e$.

   ```{admonition} Hint
   :class: hint dropdown
   
   $P=4$ and $\omega_e = \qty{2\pi 10}{\radian\per\second}$. 
   ```

5. At what rotor speed(s) will the electromagnetic torque be zero? Explain briefly.

% ## Appendix
% 
% ```matlab
% load lab_13_fr;
% Zas = Ras + j.*Xas;
% loglog(freq, abs(Zas), 'o');
% semilogx(freq, abs(Zas), 'o');
% ```