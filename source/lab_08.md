```{include} ./macros.md
```
(dc_motor_b)=
# DC Motor (B)

```{admonition} Objective
:class: note

The purpose of this experiment is to investigate the characteristics of a
permanent-magnet DC motor. The fundamental parameters of a DC motor will be
measured whereupon the motor's steady-state and dynamic operating
characteristics will be predicted analytically and by computer simulation. The
analytical (closed form) and computer-simulated results will be compared with
experimental measurements.

```

## Prelab


% This is significantly different from the 2011 Prelab and the sticktion concept
% that is introduced is inconsistent with the way that term is typically
% defined. 

In the previous lab, it was assumed that the torque due to friction could be
described using a simple constant $B_m$ times rotor speed $\omega_r$. The
measured frictional torque vs. rotor speed plot shows that this is not a
reasonable assumption, since the slope of the measured data is significantly
larger at low rotor speed than at high rotor speed. A better way to model the
torque due to friction might be to have an *affine* rather than linear function
to describe torque due to friction, such as:

```{math}
:label: eq:8:no_load_torque_sticktion

T_{\rm friction} = B_m \omega_r + T_{\rm stick}
```

where $T_{\rm stick}$ is the "sticktion" torque which opposes rotation at low
speed.

Using your measured frictional torque versus rotor speed data, re-establish
$B_m$ and find $T_{\rm stick}$. To do this, determine the average slope and
y-intercept of the measured data when rotor speed is greater than zero. 

Assuming $L_{AA}$ can be neglected, the equations of a permanent-magnet DC
machine may be expressed:


```{math}
:label: eq:8:no_load_torque_balance

k_T i_a = J \frac{d\omega_r}{dt} + B_m \omega_r + T_{\rm stick}
```

```{math}
:label: eq:8:voltage_balance

v_a = r_a i_a  + k_v \omega_r
```

Starting with equations {eq}`eq:8:no_load_torque_balance` and
{eq}`eq:8:voltage_balance`, show that by including $T_{\rm stick}$ in our model,
the effective voltage applied to the motor is smaller than we might predict.
That is, substitute the motor voltage equation and re-arrange the differential
equation to relate $v_a$ to $\omega_r$ and show that a constant times $T_{\rm
stick}$ is subtracted from $v_a$.

% % Commented out in LaTeX version without explanation.
% 
% Suppose $T_{stick} = 0$ and the applied armature voltage is instantaneously
% stepped from 0 to $\textrm{V}_a$ volts. The resulting rotor speed can be
% expressed:
% 
% ```{math}
% :label: eq:8:omega_r
% 
% \omega_r(t) = \omega_{r,ss}\left(1-e^{-t/\tau_m}\right)
% ```
% 
% Based on {numref}`Experiment {number} {name}<dc_motor_a_prelab>` and given
% $\tau_m$, express rotor moment of inertia $J$ in terms of $\tau_m$ and machines
% variables. Additionally, given $\omega_{r,ss}$, express $B_m$ in terms of
% $\omega_{r,ss}$ and machine variables.

% % 2011 Prelab.
% % This was commented out in the latest LaTeX version without explanation.
% 
% Assuming $L_{AA}$ can be neglected, the equations of a permanent-magnet DC
% machine may be expressed:
% 
% ```{math}
% :label: eq:8:torque_balance
% 
% k_T i_a - T_L = J \frac{d\omega_r}{dt} + B_m \omega_r
% ```
% 
% ```{math}
% :label: eq:8:voltage_balance_2
% 
% v_a = r_a i_a  + k_v \omega_r
% ```
% 
% Suppose $T_L = 0$ and the applied armature voltage is given by.
% 
% ```{math}
% :label: eq:8:applied_voltage
% 
% v_a = K_1 + K_2\cos \omega_e t
% ```
% 
% The measured steady-state response should be of the form
% 
% ```{math}
% :label: eq:8:steady_state_response
% 
% \omega_r = \omega_{r0} + A \cos(\omega_e t + \phi)
% ```
% 
% 1. Establish a relationship between $\omega_{r0}$, $K_1$, and the machine
%    parameters ($k_T$, $k_v$, $r_a$, and $B_m$).  Recall that these parameters
%    were established during the previous laboratory session.
% 
% 2. Establish a relationship between $A$ (amplitude of speed variation), $K_2$
%    (amplitude of applied voltage), $\omega_e$ (frequency of applied voltage),
%    the known machine parameters ($k_T$, $k_v$, $r_a$, and $B_m$), and the
%    inertia, $J$ (to be determined in this lab).
% 
% 3. How would we calculate $J$ given the measured amplitude $A$ of the speed
%    variation?



## In the Laboratory:

```{admonition} Attention
:class: Attention

Safety glasses must be worn at all times during this lab.
```

### Measured torque versus speed

1. Use the same mechanical setup shown in {numref}`fig:8:motor_orientation`.
   Implement a Simulink model to apply $\qty{+4}{\V}$ (DC) to the armature of
   Motor 1 (red with respect to black) at panel output {guilabel}`Channel 1` and
   to apply $\qty{-4}{\V}$ (DC) to the armature of Motor 2 (red with respect to
   black) at panel output {guilabel}`Channel 2`.  Both motors should turn with
   the torque reading near zero.

   ```{figure} ./figures/lab_07/motor_orientation.png
   :name: fig:8:motor_orientation

   Configuration for measuring torque vs speed.
   ```

2. Measure the current supplied to Motor 1 (test motor) on oscilloscope
   {guilabel}`Channel 1`. Measure the tachometer speed on {guilabel}`Channel 2`,
   and the torque transducer output voltage on {guilabel}`Channel 3`. Repeat and
   record the measurements by varying the Motor 2 voltage from $\qty{-4}{\V}$ to
   $\qty{+4}{\V}$ in $1$-$\V$ steps.  Calculate the rotor speed in
   $\radian\per\second$, and the torque in $\newtonmeter$.


% % Commented out in LaTeX version without explanation.
% ### Measuring Inertia
% 
% 1. Leave Motor 1 connected to patch panel {guilabel}`Channel 1`. Disconnect
%    Motor 2 from patch panel {guilabel}`Channel 2`. Using a Simulink model
%    ({numref}`fig:8:inertia_model`), apply an armature voltage of the form given
%    by {eq}`eq:8:applied_voltage`.
% 
%    ```{figure} ./figures/lab_08/inertia_model.png
%    :name: fig:8:inertia_model
%    :width: 50%
% 
%    Simulink model for measuring inertia.
%    ```
% 
%    ```{math}
%    :label: eq:8:applied_voltage
%    
%    v_a = 10 + 5 \cos{( 2 \pi f_e t)} \V
%    ```
% 
% 2. Using the oscilloscope's AC coupling mode, measure the current on
%    oscilloscope {guilabel}`Channel 1` and watch for current foldback due to
%    amplifier overloading.  Also, using oscilloscope {guilabel}`Channel 2` with
%    AC coupling mode, measure and record the peak-to-peak tachometer voltage
%    ripple for values of $f_e = 5, 10, 20$ and $\qty{40}{\hertz}$.
% 
% 3. Calculate the amplitude of the speed variation $A$ at each frequency. Check
%    units. Calculate the inertia $J$ from the amplitude of the speed variation
%    $A$.  Calculate the average inertia $J$.


### Dynamic response

Our objective in this section will be to measure the actual step response with
the oscilloscope. We will then establish the motor transient response using a
Simulink simulation based on measured parameters and compare results.


#### Experimental Data

1. Using a Simulink model shown in {numref}`fig:8:transient_model`, apply a $0$
   to $4$-$\V$ step to the armature of the DC motor.

   ```{figure} ./figures/lab_08/transient_model.png
   :name: fig:8:transient_model
   :width: 60%
   
   Simulink model for measuring startup transients
   ({download}`step_transient.slx<lab_files/lab_08/step_transient.slx>`).
   ```


2. Measure the transient armature current on {guilabel}`Channel 3` and
   tachometer voltage (speed) on {guilabel}`Channel 2` using the digital
   oscilloscope. Measure the armature voltage on {guilabel}`Channel 1` and set
   the trigger input to {guilabel}`Channel 1` as well. Use single-trigger mode
   to capture the turn-on transient. Using {program}`BenchVue`, save the data
   displayed to a {file}`.mat` file in your {numref}`Lab {number}<dc_motor_b>`
   directory.  Find the steady-state value and time constant of the exponential
   response by executing the following command:
   %
   ```matlab
   [wrss04,tau04] = fit_wr([75,0.1]',time,wr) 
   ```
   %
   where `time` and `wr` are from the measured data file. This function executes
   a nonlinear least-squares curve-fitting routine, and can be found in your Lab
   {numref}`Lab {number}<dc_motor_b>` folder.  Using your value for $\tau_m$,
   determine the rotor moment of inertia, $J$.

   % The mechanical time constant is the time required for the exponential
   % response to reach 63\% of its final value.

3. Repeat the experiment for a voltage step from $\qty{4}{\V}$ to $\qty{8}{\V}$.
   Save the data into a new {file}`.mat` file, and re-establish the steady-state
   rotor speed, mechanical time constant, and rotor moment of inertia. The rotor
   has already developed a speed in this test, so the previous value of
   steady-state speed must be subtracted before executing the curve-fitting for
   the algorithm to work. The data can be shifted back after the program has
   finished. To do this, execute the following commands:
   %
   ```matlab
   [wrss48_shifted,tau48] = fit_wr([75,0.1]',time,wr-wrss04)
   wrss48 = wrss48_shifted + wrss04
   ```

4. How do the values from the $\qty{4}{\V}$ to $\qty{8}{\V}$ step differ from
   the values from the $\qty{0}{\V}$ to $\qty{4}{\V}$ step, and by how much do
   they differ? What are potential reasons for any differences?
   

#### Computer Simulation

1. Simulate the startup characteristics using the electrical and mechanical
   parameters measured in the lab. A Simulink program,
   {download}`motorsim1.slx<lab_files/lab_08/motorsim1.slx>`, is available to
   perform this simulation. The simulation program is shown below. Enter the
   motor parameters by double-clicking on the {guilabel}`DC Motor Dynamics`
   block. Generate a printout of the simulated response of a $\qty{0}{\V}$ to
   $\qty{4}{\V}$ step input. Also, record the electrical and mechanical
   parameters that were used to generate the plots, measure simulated time
   constant (for use in postlab), and final speed. Be sure to use your own
   parameters and not those shown in Figure 3.


   ```{figure} ./figures/lab_08/motorsim1.png
   :name: fig:8:motorsim
   :width: 50%
   
   Top layer and dialog box for Simulink model {download}`motorsim1.slx<lab_files/lab_08/motorsim1.slx>`.
   ```

   ```{figure} ./figures/lab_08/motorsim1_dynamics.png
   :name: fig:8:motorsim_dynamics
   :width: 100%

   Simulink model DC motor dynamics block.
   ```


## Postlab

1. Plot the measured torque versus speed and the predicted characteristics from
   {numref}`Experiment {number} {name}<dc_motor_a_postlab>` on the same axis and compare the results.
   
2. Why is it reasonable to neglect $L_{AA}$? 
 
3. Using Matlab, implement the closed-form equation of $\omega_r(t)$ derived in
   last week's prelab, generate a plot of $\omega_r$ versus time for a
   $\qty{0}{\V}$ to $\qty{4}{\V}$ step input. Record the parameters ($k_T$,
   $k_v$, $r_a$, and $B_m$) used to generate this plot. 

4. What were some differences between the measured rotor speed response to the
   $\qty{0}{\V}$ to $\qty{4}{\V}$ input versus the $\qty{4}{\V}$ to
   $\qty{8}{\V}$ input? What do you think caused the differences?

5. How closely did the experimental and simulated $\omega_r(t)$ curves match
   (consider the difference in the time constant and final speed). What are some
   possible explanations for the differences between the predicted and measured
   curves? 

6. Why do we use a tachometer instead of armature terminal voltage to measure
   the rotor speed?

7. Which measure (an encoder or a tachometer) is more accurate? In what
   situations are a tachometer more desirable than an encoder? In what
   situations are an encoder more desirable than a tachometer?

   ```{admonition} Note
   :class: note

   The encoder is a digital device used in previous labs to measure rotor
   position. 
   ```

