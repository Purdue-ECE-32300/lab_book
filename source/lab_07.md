```{include} ./macros.md
```
(dc_motor_a_b)=
# DC Motor (A)


```{admonition} Objective
:class: note

In this experiment, the steady-state and dynamic characteristics of a
permanent-magnet DC motor are investigated. In the first lab session, the
fundamental parameters of a DC motor will be measured and the concepts of power
transfer and conservation of energy will be demonstrated. In the second session,
computer simulation will be used to predict the steady-state and dynamic
operating characteristics. The analytical and simulated results will be compared
with experimental measurements.

```

## Prelab

The electromechanical equations of a permanent-magnet DC machine can be expressed
```{math}
:label: eq:7:torque_balance

T_e - T_L = J \frac{d\omega_r}{dt} + B_m \omega_r
```

```{math}
:label: eq:7:voltage_balance

v_a = r_a i_a +L_{AA} \frac{di_a}{dt} + k_v \omega_r
```

where

```{math}
:label: eq:7:drive_torque

T_e = k_T i_a.
```

Here, $T_L$ is the applied load torque and $v_a$ is the applied armature
voltage. If all variables are expressed in SI units, $k_T = k_v$. 

%% This step was commented out of the latest latex version, without explanation.
%Express the previous equations in state-space form.
%
%```{math}
%:label: eq:7:state_space
%
%\frac{d\mathbf{x}}{dt}
%= \mathbf{Ax + Bu}\text{ where }\mathbf{x}
%= \left[
%    \begin{array}{c}
%        \omega _r \\ 
%        i_a 
%    \end{array}
%\right]
%```
%
%That is, express the matrices ${\bf A}$ and ${\bf B}$ in terms of $J$, $B_m$,
%$L_{AA}$, $r_a$,$k_v$, and $k_T$. 

The power delivered to the mechanical load may be expressed

```{math}
:label: eq:7:power_mech

P_m = T_L \omega_r
```

The electric power delivered to the mechanical load may be expressed

```{math}
:label: eq:7:power_elec

P_e = v_a i_a
```

During steady-state operation with a constant applied armature voltage and
constant load torque, all electrical and mechanical variables will be constant.
Express {eq}`eq:7:torque_balance` through {eq}`eq:7:drive_torque` assuming
steady-state operating conditions. Use upper-case letters to designate
steady-state variables.

Assume $L_{AA}$ is small enough so that it can be neglected. Simplify
{eq}`eq:7:torque_balance`&ndash;{eq}`eq:7:drive_torque` and express the
first-order transfer function relating speed $\omega_r$ to armature voltage
$v_a$ when $T_L=0$, and $\omega_r$ to load torque $T_L$ when $v_a=0$. Express
$\omega_r(t)$ for a step change in armature voltage from 0 to $V_a$.  You may
use either Laplace transform techniques or you can solve the first-order
differential equation using the method of undetermined coefficients. Hint: for a
first-order transfer function

```{math}
:label: eq:7:hint

\omega_r(t) = \omega_{r,ss} (1-e^{-t/\tau_m})
```

Relate $\omega_{r,ss}$ and $\tau_m$ to the machine parameters and $V_a$.
Finally, read through the laboratory procedure before coming to lab.

## In the Laboratory:

```{admonition} Attention
:class: Attention

Safety glasses must be worn at all times during this lab.
```

The rotors of two identical motors (numbered 1 and 2) are connected to the
torque transducer as shown in {numref}`fig:7:motor_orientation`.

```{figure} ./figures/lab_07/motor_orientation.png
:name: fig:7:motor_orientation
:width: 80%

Configuration for measuring voltage constant.
```

Our first objective will be to measure the electrical parameters $L_{AA}$ ,
$r_a$, and $k_v$.\\

### Armature Resistance and Inductance:

1. Block the rotor by hand to prevent it from turning. Using Simulink as in
   previous experiments, apply $\qty{2}{\V}$ (DC) to the motor terminals of
   motor 1 (positive to red, negative to black) through a high-power output
   channel, $V_a = \qty{2}{\V}$.  Measure the DC current and voltage over motor
   1 using the current probe and oscilloscope.  Vary the rotor position by hand
   to determine if the DC current (consequently resistance) varies as a function
   of the rotor position. Record the maximum, minimum, and average current, then
   calculate a maximum, minimum, and average resistance $r_a$ from those
   currents.

2. Using the Simulink model shown in {numref}`fig:7:target_model`, apply a
   sinusoidal voltage to the armature terminals

   ```{math}
   :label: eq:7:armature_voltage

   V_a=4\sin(200\pi t)
   ```

   Measure the peak-to-peak current and peak-to-peak voltage.  Vary the rotor
   position by hand and re-measure to see if and by how much $\left|I_a\right|$
   (consequently, the inductance) varies with rotor position.  Record the maximum
   and minimum current magnitude and calculate $\left| Z \right| = \left| V_a
   \right| / \left| I_a \right|$ using the average $ \left| I_a \right|$.
   From $\left| Z \right|$ and $r_a$, estimate the motor inductance $L_{AA}$.

   ```{admonition} Hint
   :class: hint

   $\left| Z \right| = \sqrt{r_a^2 + (\omega_e L_{AA})^2}$ .
   ```

   ```{figure} ./figures/lab_07/target_model.png
   :name: fig:7:target_model
   :width: 60%
   
   Simulink target model for {ref}`dc_motor_a_b`.
   ```


### Torque constant:

1. Prevent the shaft from turning by holding it between the transducer and motor
   2 (see {numref}`fig:7:motor_orientation`). While the rotor is stationary,
   remove the torque measurement offset by pressing the {guilabel}`Tare` button
   on the torque transducer amplifier on your bench. 

2. Use the Simulink target model to apply $\qty{4}{\V}$ (DC) to the armature
   terminals.  Measure the armature current with the lower BNC connector on the
   same Analog Output module and the torque using the torque transducer
   amplifier.  Connect the current output signal to oscilloscope Channel 1, and
   the output of the torque transducer amplifier to oscilloscope Channel 2. The
   output of the torque transducer amplifier is calibrated to produce
   $\qty{1}{\V}$ for $\qty{20}{\ozin}$ of torque. You will later need to
   convert to SI units.

   ```{admonition} Hint
   :class: hint

   $\qty{1}{\newtonmeter} = \qty{141.6}{\ozin}$
   ```

3. Vary the armature voltage of Motor 1 from $\qty{+4}{\V}$ to $\qty{-4}{\V}$ in
   $1$-$\V$ steps, keeping the rotor blocked and recording the armature current
   and torque transducer output voltage at each step.

   % Make sure that the power amplifier is not "current limiting" by verifying
   % that the output voltage is equal to its setpoint value (When the output
   % current exceeds the rated current, the output voltage is automatically
   % reduced to prevent the amplifier from overloading).

4. Calculate and plot the torque (in $\newtonmeter$) versus current. Calculate
   $k_T$ by creating a line of best fit from the resulting plot, and recording
   the slope.  Express your answer in ${\newtonmeter\per\ampere}$.


### Voltage constant:

% In 2011, we used 4 V. When and why was the voltage increased to 8 V?
1. Using the Simulink model, apply $\qty{8}{\V}$ (DC) to the armature of Motor 2
   (causing both motors to rotate). Leave the armature of Motor 1 (test motor)
   open-circuited.

2. Measure the armature voltage of Motor 1 (its armature is still open
   circuited) on Channel 1 of the oscilloscope, and the tachometer voltage of
   Motor 1 on Channel 2 (see {numref}`fig:7:equiv_circuit`).  Connect the torque transducer
   amplifier output to Channel 3 of the oscilloscope. This represents a measure
   of the frictional torque of Motor 1.

   ```{figure} ./figures/lab_07/equiv_circuit.png
   :name: fig:7:equiv_circuit
   :width: 60%
   
   Equivalent circuit of DC motor/tach.
   ```

% In 2011, we varied the voltage from +16 to -16. When and why was the voltage
% range decreased to +8 to -8?
3. Vary the voltage applied to the armature of Motor 2 from $\qty{+8}{\V}$ to
   $\qty{-8}{\V} in $2$-$\V$ steps and record the Motor-1 open-circuit voltage,
   the tachometer voltage, and the torque transducer output voltage at each
   step.
   
4. Calculate the rotor speed from the tach voltage and convert to
   $\radian\per\second$. Speed is calculated using $\omega_r = V_{a,{\rm
   tach}}/k_{v,{\rm tach}}$ where $V_{a,{\rm tach}}$ is the tachometer voltage
   and $k_{v,{\rm tach}}$ is the tachometer voltage constant
   ($\qty{3}{\V\per\kilo\rpm}$).  You should convert the tachometer voltage constant to $\V\per\radian\per\second$. Plot
   the open-circuit voltage of Motor 1 versus rotor speed
   ($\radian\per\second$). Generate a best fit line, and determine $k_v$ from
   the slope of the given plot. Express the result in
   $\V\text{-}\second\per\radian$. Verify that $k_T = k_v$ when both are
   expressed in SI units.
   
   ```{admonition} Hint
   :class: hint

   $\qty{1}{\V\text{-}\second\per\radian} = \qty{1}{\newtonmeter\per\ampere}$
   ```

5. From the torque transducer voltage, calculate the frictional torque in
   $\newtonmeter$.  Plot the frictional torque versus speed. Generate a best fit
   line, and determine $B_m$ in $\newtonmeter\text{-}\second\per\radian$ from
   the slope of given plot.


## Postlab:

1. How much do $r_a$ and $L_{AA}$ vary? Why do they vary?

2. What were your experimental values for $k_T$, $k_v$, $r_a$, $L_{AA}$ and $B_m$?

3. What is the relationship between open-circuit voltage and speed?  What is the
   relationship between torque and current? How does this relationship change
   with rotor speed?

4. What is the relationship between $k_T$ and $k_v$? What was the percentage
   difference between $k_T$ and $k_v$?  Provide possible explanations for this
   difference.

5. Using the $r_a$, $k_v$, and $k_T$ established in lab, calculate and plot the
   predicted first quadrant $T_e$-versus-$\omega_r$ characteristics for this
   motor with $V_a = \qty{4}{\V}$ (DC). Identify the stall torque ($T_e$ with
   $\omega_r=0$) and no-load speed ($\omega_r$ with $T_e = 0$).





