```{include} ./macros.md
```
(pmag_sync_motor_b)=
# Permanent Magnet Synchronous Motor (B)


```{admonition} Objective
:class: note

The purpose of this experiment is to establish the fundamental electrical
parameters of the permanent-magnet ac motor studied last week.

```


## Prelab

The electromechanical equations of a 3-phase $P$-pole permanent-magnet ac
machine can be expressed in the form


```{math}
:label: eq:10:v_as

v_{as}
= r_s i_{as}
+ (L_{ls} + L_{ms}) p i_{as}
- \frac{1}{2} L_{ms} p i_{bs}
- \frac{1}{2} L_{ms} p i_{cs}
+ e_{as}
```

```{math}
:label: eq:10:v_bs

v_{bs}
= r_s i_{bs}
+ (L_{ls} + L_{ms}) p i_{bs}
- \frac{1}{2} L_{ms} p i_{as}
- \frac{1}{2} L_{ms} p i_{cs}
+ e_{bs}
```

```{math}
:label: eq:10:v_cs

v_{cs}
= r_s i_{cs}
+ (L_{ls} + L_{ms}) p i_{cs}
- \frac{1}{2} L_{ms} p i_{as}
- \frac{1}{2} L_{ms} p i_{bs}
+ e_{cs}
```

where $p$ is the differential operator $\frac{d}{dt}$, and 

```{math}
:label: eq:10:e_as

e_{as}
= \frac{d \lambda_{asm}}{d \theta_r} \frac{d \theta_r}{dt}
= \omega_r \frac{d \lambda_{asm}}{d \theta_r}
```

```{math}
:label: eq:10:e_bs

e_{bs}
= \frac{d \lambda_{bsm}}{d \theta_r} \frac{d \theta_r}{dt}
= \omega_r \frac{d \lambda_{bsm}}{d \theta_r}
```

```{math}
:label: eq:10:e_cs

e_{cs}
= \frac{d \lambda_{csm}}{d \theta_r} \frac{d \theta_r}{dt}
= \omega_r \frac{d \lambda_{csm}}{d \theta_r}.
```

Here, $\lambda_{asm}$, $\lambda_{bsm}$, and $\lambda_{csm}$ represent the flux
linkages of the stator $as$, $bs$, and $cs$ windings, respectively, due to the
permanent-magnet rotor while $e_{as}$, $e_{bs}$, and $e_{cs}$ represent the
corresponding induced voltages. Also,

```{math}
:label: eq:10:theta_r

\theta_r = \frac{P}{2} \theta_{rm}
```
 
where $\theta_r$ represents the "electrical" position of the rotor whereas
$\theta_{rm}$ represents the actual mechanical position.  If $i_{as} = -i_{bs}
-i_{cs}$, which is true due to Kirchhoff's current law, **show that 
{eq}`eq:10:v_as` can be expressed as**

```{math}
:label: eq:10:v_as2

v_{as}
= r_s i_{as}
+ (L_{ls} + \frac{3}{2} L_{ms}) p i_{as}
+ e_{as}.
```

Equivalently,

```{math}
:label: eq:10:v_as3

v_{as}
= r_s i_{as}
+ L_{ss} p i_{as}
+ e_{as}
```

where $L_{ss} = L_{ls} + \frac{3}{2} L_{ms}$. Similarly,

```{math}
:label: eq:10:v_bs3

v_{bs}
= r_s i_{bs}
+ L_{ss} p i_{bs}
+ e_{bs}
```

```{math}
:label: eq:10:v_cs3

v_{cs}
= r_s i_{cs}
+ L_{ss} p i_{cs}
+ e_{cs}.
```

The electromagnetic torque may be expressed

```{math}
:label: eq:10:T_e

T_e
= \frac{P}{2} \left(
    i_{as} \frac{d \lambda_{asm}}{d \theta_r}
    + i_{bs} \frac{d \lambda_{bsm}}{d \theta_r}
    + i_{cs} \frac{d \lambda_{csm}}{d \theta_r}
\right).
```

In an ideal machine,

```{math}
:label: eq:10:lambda_asm

\lambda_{asm} = \lambda_m^\prime \sin \theta_r
```

```{math}
:label: eq:10:lambda_bsm

\lambda_{bsm} = \lambda_m^\prime \sin (\theta_r - \qty{120}{\degree}).
```

```{math}
:label: eq:10:lambda_csm

\lambda_{csm} = \lambda_m^\prime \sin (\theta_r + \qty{120}{\degree})
```

**Substitute {eq}`eq:10:lambda_asm`-{eq}`eq:10:lambda_csm` into {eq}`eq:10:T_e` and show that**

```{math}
:label: eq:10:T_e2

T_e
= \frac{P}{2} \lambda_m^\prime \left[
    i_{as} \cos \theta_r
    + i_{bs} \cos (\theta_r - \qty{120}{\degree})
    + i_{cs} \cos (\theta_r + \qty{120}{\degree})
\right].
```

Equations {eq}`eq:10:v_as3`-{eq}`eq:10:v_cs3` and {eq}`eq:10:T_e2` define the
electromechanical behavior of the given machine in phase variables. There are
four basic parameters of the given machine: $r_s$, $L_{ss}$, $\lambda_m^\prime$,
and $P$.

Next, suppose $i_{as} = I_p \cos{\omega_e t}$, $i_{bs} = I_p \cos{(\omega_e t -
\frac{2\pi}{3})}$, and $i_{cs} = I_p \cos{(\omega_e t + \frac{2\pi}{3})}$ where
$I_p$ is the peak current.  **Substitute these currents into {eq}`eq:10:T_e2`
and show that**

```{math}
:label: eq:10:T_e3

T_e
= \frac{3}{2} \frac{P}{2} \lambda_m^\prime I_p \cos{(\theta_r - \omega_e t)}.
```


## In the Laboratory


### Establish a Rotating Magnetic Field

Our first objective will be to verify that a rotating magnetic field is produced
in the given device.  Connect the machine as shown in {numref}`fig:10:setup`.

```{figure} ./figures/lab_10/setup.png
:name: fig:10:setup
:width: 80%

Experimental setup for Lab 10.
```

1. Using {download}`lab_10_target.slx<lab_files/lab_10/lab_10_target.slx>`
   {numref}`fig:10:target_model`, apply balanced three-phase voltages to the
   three-phase windings.  Set the frequency to $\qty{5}{\hertz}$ and the
   amplitude to $\qty{0.5}{\volt}$ peak. Make sure that the voltages are
   displaced from one another by $\qty{120}{\degree}$.  Record the applied
   voltages $v_{ag}$, $v_{bg}$, and $v_{cg}$ including their amplitude,
   frequency, and phase delay.
   
   ```{admonition} Caution
   :class: warning

   Never apply more than $\qty{2}{\volt}$ to the motor or irreparable damage may
   result.  When the motor is not being used, be sure to unplug the motor from
   the patch panel.
   ```

   ```{figure} ./figures/lab_10/target_model.png
   :name: fig:10:target_model
   :width: 50%
   
   Target model for Lab 10.
   ```
 
2. Record the direction of rotation (CW or CCW) as viewed from the right end of
   the AC motor.  Approximate the speed of the rotor as follows. While your
   partner looks at their watch, count the number of revolutions of the pulley
   in a 1-minute period.  Convert revolutions per minute to radians per second.
   How does this speed relate to the frequency of the applied voltages? How many
   poles does this machine have?

3. Interchange the $b$ and $c$ leads to the voltage source. What happens to the
   direction of rotation? Explain why this happens.

4. Next, hold the pulley to lock the position of the rotor.  Measure the
   phase-$a$ current and shaft torque, displaying both signals on the
   oscilloscope. What is the frequency of torque pulsation? How does this
   frequency relate to the frequency of the applied voltages? Explain briefly. 

5. Record the peak-to-peak current and the peak-to-peak output voltage of the
   torque transducer (you may use the horizontal cursors to establish this
   value).  What is the corresponding peak torque in $\newtonmeter$? From
   {eq}`eq:10:T_e3`, this peak torque is equal to $\frac{3}{2}\frac{P}{2}
   \lambda_m^\prime I_p$ where $I_p$ is the peak current ($I_p = I_{\rm
   pk-pk}/2$).  Calculate $\lambda_m^\prime$.  Using {program}`BenchVue`, print
   the data captured on the oscilloscope.


### Measure Electrical Parameters

Our next objective will be to measure the electrical parameters: $r_s$,
$L_{ss}$, and $\lambda_m^\prime$.


#### Stator resistance

1. Apply balanced voltages to the three phase windings.  Set the frequency to 
   $\qty{1}{\hertz}$ and the amplitude to $\qty{0.5}{\volt}$ peak. Make sure
   that the voltages are displaced from one another by $\qty{120}{\degree}$.
   Block the rotor to prevent it from turning.  Measure the phase-$a$-to-ground
   voltage and the current into phase-$a$ using the oscilloscope.  Verify that
   the voltage and current are essentially in-phase at this frequency. Divide
   the peak voltage by the peak current. This is $r_s$.


#### Stator inductance

1. Increase the frequency of the applied voltages to $\qty{100}{\hertz}$.
   Calculate the impedance magnitude by dividing the peak voltage by the peak
   current.  Calculate the inductance at this frequency. This is $L_{ss}$. 

2. Move the rotor to several different but fixed positions. Compare peak
   $I_{as}$ at each fixed position.  Record your observations. Based upon your
   observations, does the inductance vary with rotor position?


#### Flux constant

% 1. Connect the rotor of the permanent-magnet AC motor to the DC motor as shown
%    in {numref}`fig:10:setup_2`.  Leave the stator windings of the AC motor open-circuited. 
% 
%    ```{figure} ./figures/lab_10/setup_2.png
%    :name: fig:10:setup_2
%    :width: 80%
%    
%    Experimental setup for second part of {numref}`Lab
%    {number}<pmag_sync_motor_b>`.
%    ```

1. Apply $\qty{3}{\volt}$ to the armature of the DC motor, causing both motors
   to rotate. 

  % The direction of rotation should be the same as at the beginning of the lab.
  % If the direction is counterclockwise, negate the applied voltage to the DC
  % motor. 

2. Measure the phase $a$ to phase $b$ open-circuit voltages of the AC motor. 

  % Do this by connecting the scope probe to phase $a$ and grounding phase $b$. 

3. Measure the electrical frequency $\omega_e$ of $e_{ab}$ and calculate
   $\lambda_m^\prime$. From the equations given at the beginning of this lab,
   show that the peak value of $e_{ab}$ is equal to $\sqrt{3}\omega_r
   \lambda_m^\prime$.  Use this information to calculate $\lambda_m^\prime$.


## Postlab

1. Compare the values of $\lambda_m^\prime$ established using the two methods in
   this lab. Which do you think is more accurate? Why?

% 2. What are the values of the basic parameters, $r_s$, $L_{ss}$,
%    $\lambda_m^\prime$, and $P$ for the given machine?

2. What is the relationship between the mechanical rotor speed and the frequency
   of the open-circuit voltages?

3. If the stator windings are short-circuited and the rotor is mechanically
   rotated at a speed of $\omega_{rm}$, based upon the parameters established in
   this lab, what will be the peak amplitude of the resulting stator currents.

   ```{admonition} Hint
   :class: hint dropdown

   Consider {eq}`eq:10:v_as2`.
   ```