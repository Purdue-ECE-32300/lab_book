# Experiment 6A: Permanent Magnet Synchronous Motor

```{admonition} Objective
:class: note
- To demonstrate the development of rotating magnetic fields in AC devices.
```

## Outline
- Prelab
- Introduction
- Figures
- In the Laboratory
    1. Description of permanent magnet AC motor.
    2. Open loop operation.
- Postlab

## Prelab

    Read chapter  4 of text (Upto Section 4.4).

## Introduction

In this experiment, the stator windings of a 3 phase permanent magnet synchronous motor will be supplied by a balance 3 phase variable frequency voltage source and the rotor will be driven mechanically by the permanent magnet DC machine used in Experiment 5. The development of a rotating magnetic field will be illustrated using computer graphics and computer simulation will be used to predict the electromagnetic torque of the permanent magnet AC motor for various source frequency rotor speed combinations. The dynamic performance will be measured and compared with simulated results.

## Figures

Figure 1
Figure 2
Figure 3
Figure 4

## In the Laboratory

### Objective 1: Review the principles of rotating magnetic fields in 2 phase AC devices.

- Development of Rotating Magnetic Fields:
    
Execute the program `mmf` from MATLAB by typing `mmf` on the command line. Select the HELP button to display the introduction on the screen. For the electromechanical device considered in the program:

1. Determine $\tilde{I_as}$ and $\tilde{I_bs}$ so as to produce a counter clockwise (CCW) rotating magnetic field. Record these values in the lab notebook. Express the corresponding functions of time. Are these answers unique? Explain briefly.

2. Determine Determine $\tilde{I_as}$ and $\tilde{I_bs}$ so as to produce a clockwise (CW) rotating magnetic field. Record these values in the lab notebook. Express the corresponding functions of time. Are these answers unique? Explain briefly.

3. Enter the values of $\tilde{I_as}$ and $\tilde{I_bs}$ selected above into the appropriate numerical fields of the dialog box. Note that the phasor magnitudes defined in `mmf` are the peak and not rms magnitudes. By selecting various options that are available to you, address the following questions:

    a. What kind of magnetic field does the stationary observer see?

    b. What kind of magnetic field does an observer that rotates in the clockwise direction see?

    c. What kind of magnetic field does an observer that rotates in the counter clockwise direction se?

Use synonyms like: Constant, pulsating (What is the frequency of pulsation?), stationary, rotating (What is the direction and speed?).

- Magnetic Field Strength:

Let $\tilde{I_as}$ and $\tilde{I_bs}$ be the phase currents in the phasor form and $\tilde{I_+}$ and $\tilde{I_-}$ be the components that produce the clockwise and counter clockwise rotating fields. Now

$\tilde{I_as} = \tilde{I_+} + \tilde{I_-}$  ---  (6A.1)

$\tilde{I_bs} = j*\tilde{I_+} - \tilde{I_-}$ --- (6A.2)

Equations can be written in matrix form as:

\begin{bmatrix} $\tilde{I_as}$ \\$\tilde{I_bs}$\end{bmatrix} = \begin{bmatrix} 1 1 \\ j -j \end{bmatrix} * \begin{bmatrix} $\tilde{I_+}$ \\ $\tilde{I_-}$ \end{bmatrix} --- (6A.3)

After inversion, the forward and the backward components can be expressed as

\begin{bmatrix} $\tilde{I_+}$ \\ $\tilde{I_-}$ \end{bmatrix} = (1/2) * \begin{bmatrix} 1 1 \\ j -j \end{bmatrix} * $\tilde{I_as}$ \\$\tilde{I_bs}$\end{bmatrix} --- (6A.4)

4. Suppose $\tilde{I_as} = 1 \angle 0$ and $\tilde{I_bs} = 0.5 \angle 90$. Determine the relative strength of the CW and CCW rotating components of the magnetic field using (6A.4). Use MATLAB to do the math.

5. Repeat `step 3.` for the given $\tilde{I_as}$ and $\tilde{I_bs}$. When source is unbalanced, the magnetic field may be decomposed into two components each with different strengths.

6. Suppose $\tilde{I_as} = 1 \angle 0$ and $\tilde{I_bs} = 0$. Determine the relative strength of the CW and CCW rotating components of the magnetic field using (6A.4). Repeat `step 3.` for the given $\tilde{I_as}$ and $\tilde{I_bs}$.

## Postlab

Our next objective will be to experimentally observe the development of rotating magnetic fields in the AC devices shown in {numref}`Figure 1` where only one phase winding is shown for simplicity. This device is a 4 pole permanent magnet synchronous machine (Actually, its a part of a brushless DC machine but we won't call it that until later).
Here, $as_1 - as_1'$ and $as_2 - as_2'$ represent the sinusoidally distributed windings with $\odot$ and $\otimes$ indicating the locations where the turns density is maximum.
The as winding is comprised of the series connection of $as_1 and as2_as2'$. Representative lines of magnetic flux for a positive current in the as winding are shown in {numref}`Figure 2`. The actual flux distribution is sinusoidal with peak densities occuring along the respective magnetic axes. Similarly, the bs winding, shown in {numref}`Figure 3` is comprised of the series connection of coils $bs_1 - bs_1'$ and $bs_2 - bs_2'$, and the cs winding shown in {numref}`Figure 4`, is comprised of the series connection of coils $cs_1 - cs_1'$ and $cs_2 - cs_2'$.

1. Approximate the corresponding mmfs as sinusoidal functions of circumferential co-ordinate $\phi_s$ (i.e. Fill in the blanks):

$mmf_as = Ki_as * cos(___\phi_s + ___)$ --- (6A.5)

$mmf_bs = Ki_bs * cos(___\phi_s + ___)$ --- (6A.6)

$mmf_cs = Ki_cs * cos(___\phi_s + ___)$ --- (6A.7)

2. Suppose 

    $i_as = cos(w_e*t)$ --- (6A.8)

    $i_bs = cos(w_e*t - 120^{\circ})$ --- (6A.9)

    $i_cs = cos(w_e*t + 120^{\circ})$ --- (6A.10)

Show analytically that a rotating magnetic field will be produced. ```{hint} The net magnetic field is the superposition of (6A.5)-(6A.7). The trigonometric identities in Appendix A of the ECE 32100 textbook are very useful.

3. In what direction will it rotate (CW or CCW)?

4. At what speed will it rotate (this is called the synchronous speed)?

5. At what speed must the rotor rotate in order to produce a non-zero average torque?

6. What kind of torque will be produced if the rotor rotates at a speed other than the speed of the rotating magnetic field?

7. What is the relationship between synchronous speed, the frequency of the applied currents and the number of poles?
