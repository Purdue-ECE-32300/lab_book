# Experiment 6B: Permanent Magnet Sybchronous Motor

```{admonition} Objective
:class: note
- To establish the fundamental electrical parameters of the permanent magnet AC Motor studied last week
```

## Outline 

- Prelab
- Figures
- In the Laboratory
    1. Measuring Parameters
- Postlab

## Prelab

The electromechanical equations of a 3 phase P pole permanent magnet AC machine can be expressed in the form

$v_{as} = r_s * i_{as} + (L_{ls} + L_{ms})*pi_{as} - (1/2)*L_{ms}*p*i_{bs} - (1/2)*L_{ms}*p*i_{cs} + e_{as}$ --- (6B.1)

$v_{bs} = r_s * i_{bs} + (L_{ls} + L_{ms})*pi_{bs} - (1/2)*L_{ms}*p*i_{as} - (1/2)*L_{ms}*p*i_{cs} + e_{bs}$ --- (6B.2)

$v_{cs} = r_s * i_{cs} + (L_{ls} + L_{ms})*pi_{cs} - (1/2)*L_{ms}*p*i_{as} - (1/2)*L_{ms}*p*i_{bs} + e_{cs}$ --- (6B.3)

where

$e_{as} = \frac{d\lambda_{asm}}{d\theta_{r}} * \frac{\theta_{r}}{dt} = w_r * frac{d\lambda_{asm}}{d\theta_{r}}$ --- (6B.4)

$e_{bs} = \frac{d\lambda_{bsm}}{d\theta_{r}} * \frac{\theta_{r}}{dt} = w_r * frac{d\lambda_{bsm}}{d\theta_{r}}$ --- (6B.5)

$e_{cs} = \frac{d\lambda_{csm}}{d\theta_{r}} * \frac{\theta_{r}}{dt} = w_r * frac{d\lambda_{csm}}{d\theta_{r}}$ --- (6B.6)

Here $\lambda_{asm}$,$\lambda_{bsm}$ and $\lambda_{csm}$ represent the flux linkages of the stator as, bs and cs windings respectively due to the permanent magnet rotor while $e_{as}$, $e_{bs}$ and $e_{cs}$ represent the corresponding induced voltages. Also,

$\theta_r =(P/2)*\theta_{rm}$ --- (6B.7)

where $\theta_r$ represents the electrical position of the rotor whereas $\theta_{rm}$ represents the actual mechanical position. If $i_{as}$ = $-i_{bs} - i_{cs}$, which is true due to Kirchoff's current law, show that (6B.1) can be expressed as

$v_{as} = r_s * i_{as} + (L_{ls} + (3/2)*L_{ms})*pi_{as} + e_{as} $ --- (6B.8)

Equivalently,

$v_{as} = r_s * i_{as} + L_{ss}*pi_{as} + e_{as}$ --- (6B.9)

where $L_{ss} = L_{ls} + (3/2)*L_{ms}$. Similarly,

$v_{bs} = r_s * i_{bs} + L_{ss}*pi_{bs} + e_{bs}$ --- (6B.10)

$v_{cs} = r_s * i_{cs} + L_{ss}*pi_{cs} + e_{cs}$ --- (6B.11)

The electromagnetic torque may be expressed as

$T_e = (P/2)*(i_{as}*\frac{d\lambda_{asm}}{d\theta_{r}} + i_{bs}*\frac{d\lambda_{bsm}}{d\theta_{r}}+i_{cs}*\frac{d\lambda_{csm}}{d\theta_{r}})$ --- (6B.12)

In an ideal machine,

$\lambda_{asm} = \lambda_m' sin(\theta_r)$ --- (6B.13)

$\lambda_{bsm} = \lambda_m' sin(\theta_r - 120^\circ)$ --- (6B.14)

$\lambda_{csm} = \lambda_m' sin(\theta_r - 120^\circ)$ --- (6B.15)

Substitute (6B.13) - (6B.15) into (6B.12) and show that 

$T_e = (P/2)*\lambda_m'[i_{as}*cos(\theta_r) + i_{bs}*cos(\theta_r - 120^\circ) +  i_{cs}*cos(\theta_r + 120^\circ)]$ --- (6B.16)

Equations (6B.9)-(6B.11) and (6B.16) define the electromechanical behavior of the given machine in phase variables. There are four basic parameters of the given machine $r_s$, $L_{ss}$, $\lambda_m'$ and P.

Next, suppose 

$i_{as} = I_p*cos(w_e*t)$ 

$i_{bs} = I_p*cos(w_e*t - 2*\pi/3)$ and

$i_{cs} = I_p*cos(w_e*t + 2*\pi/3)$ 

where $I_p$ is the peak current. Substitute these currents into (6B.16) and show that

$T_e = (3/2)*(P/2)*\lambda_m'*cos(\theta_r - w_e*t)$ --- (6B.17)

## In the Laboratory

### Objective 1: To vertify that a rotating magnetic field is produced in the given device. 

1. Connect the machine as shown in {numref}`Figure 1`.

2. Using {file}`lab.6b.slx` {numref}`Figure 2`, apply balanced three phase voltage windings. Set the frequency to to 5 Hz and the amplitude to 0.5 V peak. Make sure that the voltage are displaced from are displaced from one another by 120^$\circ$. Record the applied voltages $v_{ag}$, $v_{bg}$ and $v_{cg}$ and including their amplitdue, frequency and phase delay. 
```{warning} Never apply more than 2 V to the motor or irreparable damage may result. When the motor is not being used, be sure to unplug the motor from the patch panel```

3. Record the direction of rotation (CW and CCW) as viewed from the right end of the motor. Approximate the speed of the rotor as follows. While your partner looks at the watch, count the number of revolutions of the pulley in a 1 minute period. Convert revolutions per minute to radians per second. How does the speed relate to the frequency of the applied voltages? How many poles does this machine have?

4. Interchange the b and c leads to the voltage source. What happens to the direction of rotation? Explain why this happens.

5. Next, hold the pulley to lock the position of the rotor. Measure the phase A current and shaft torque displaying both signals on the oscilloscope. How does this frequency relate to the frequency of the applied voltages? Explain briefly.

6. Record the peak-to-peak current and output voltage of the torque transducer (You may use the horizontal cursors to establish this value). What is the corresponding  peak torque in N-m? From (6B.17), this peak torque is equal to

$ (3/2)*(P/2)\lambda_m'*I_p$ 

where $I_p$ is the peak current (I_p = I_{pk-pk}/2). Calculate $\lambda_m'$. Using {program}`BenchVue`, print the data captured on the oscilloscope.

### Objective 3: Measure the electrical parameters $r_s$, $L_{ss}$, $\lambda_m'$

Stator Resistance:

1. Apply balanced voltages to the three phase windings. Set the frequency to 1 Hz and the amplitude to 0.5V peak. Make sure that the voltages are displaced from one another by 120^$\circ$  Block the rotor to prevent it from turning. Measure the phase A to ground voltage and the current into the phase A using the oscilloscope. Verify that the voltage and the current are essentially in phase at this frequency. Divide the peak voltage by the peak current. This is $r_s$.

Stator Inductance

1. Increase the frequency of the applied voltages to to 100 Hz. Calculate the impedance magnitude by dividing the peak voltage by the peak current. Calculate the inductance at this frequency. This is $L_{ss}$.

2. Move the rotor to several different but fixed positions. Compare peak $I_{as}$ at each fixed position. Recrd your observations. Based upon your observations, how does the inductance vary with the rotor position?

Flux constant

1. Apply 3 V to the armature of the DC motor, causing both motors to rotate.

2. Measure the phase A to phase B open circuit voltages of the AC motor.

3. Measure the electrical frequency $w_e$ of $e_{ab}$ and calculate $\theta_m'$. From the equations given in the beginning of this lab show that the peak value of $e_{ab}$ is equal to $\sqrt(3) * w_r * \lambda_m'$. Use this information to calculate $\lambda_m'$.

## Postlab

1. Provide the explanations in this document. Address all the questions that were asked.

2. Compare the values of $\lambda_m'$ established using the two methods in this lab. Which do you think is more accurate? Why?

3. What is the relationship between the mechanical rotor speed and the frequency of the open circuit voltages?

4. If the stator windings are short circuited and the rotor is mechanically rotated at a speed of $w_{rm}$, based upon the parameters established in this lab, which will be the peak amplitude of the resulting stator currents. 
```{hint} Consider (6B.8)```
