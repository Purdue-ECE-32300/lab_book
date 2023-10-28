```{include} ./macros.md
```
(pmag_sync_motor_a)=
# Permanent Magnet Synchronous Motor (A)

```{admonition} Objective
:class: note

The purpose of this experiment is to demonstrate the development of rotating
magnetic fields in ac devices.

```

## Introduction

In this experiment, the stator windings of a 3-phase permanent-magnet
synchronous motor will be supplied by a balanced 3-phase variable-frequency
voltage source and the rotor will be driven mechanically by the permanent-magnet
DC machine used in {numref}`Lab {number}<dc_motor_b>`. The development of a rotating
magnetic field will be illustrated using computer graphics, and computer
simulation will be used to predict the electromagnetic torque of the
permanent-magnet AC motor for various source frequency--rotor speed
combinations. The dynamic performance will be measured and compared with
simulated results.


## Prelab

Read or review Chapter 4 of text (up to Section 4.4).


## In the Laboratory

Our first objective will be to review the principles of rotating magnetic fields
in 2-phase AC devices.


(pmag_sync_motor_a_dev_rot_mag_fields)=
### Development of Rotating Magnetic Fields

Execute the program {command}`mmf` from Matlab by typing `mmf` on the command
line.  Select the {guilabel}`HELP` button to display the introduction on the
screen.  For the electromechanical device considered in the program:


1. Determine $\tilde{I}_{as}$ and $\tilde{I}_{bs}$ so as to produce a
   counterclockwise (CCW) rotating magnetic field. Record these values in the
   lab notebook. Express the corresponding functions of time. Are these answers
   unique? Explain briefly.

2. Determine $\tilde{I}_{as}$ and $\tilde{I}_{bs}$ so as to produce a clockwise
   (CW) rotating magnetic field.  Record these values in the lab notebook.
   Express the corresponding functions of time. Are these answers unique?
   Explain briefly.

3. Enter the values of $\tilde{I}_{as}$ and $\tilde{I}_{bs}$ selected above into
   the appropriate numerical fields of the dialog box. Note that the phasor
   magnitudes defined in {command}`mmf` are the peak and not RMS magnitudes.  By
   selecting various options that are available to you, address the following
   questions:

   1. What kind of magnetic field does a stationary observer see?

   2. What kind of magnetic field does an observer that rotates at in the CW
      direction see?

   3. What kind of magnetic field does an observer that rotates at in the CCW
      direction see?

   Use synonyms like: constant, pulsating (what is the frequency of pulsation?),
   stationary, rotating (what is the direction and speed?).


### Magnetic Field Relative Strength

Let $\tilde{I}_{as}$ and $\tilde{I}_{bs}$ be the phase currents in phasor form, and $\tilde{I}_{+}$ and $\tilde{I}_{-}$ be the components that
produce clockwise and counterclockwise rotating fields. Now
 
```{math}
:label: eq:9:Ias

\tilde{I}_{as} = \tilde{I}_{+} + \tilde{I}_{-}
```
 
```{math}
:label: eq:9:Ibs

\tilde{I}_{bs} = j\tilde{I}_{+} - j \tilde{I}_{-}
```
 
or
 
```{math}
:label: eq:9:current_matrix

\left[
  \begin{array}{c}
    \tilde{I}_{as} \\ 
    \tilde{I}_{bs} 
  \end{array}
\right]
= \left[
  \begin{array}{c}
    1 &  1 \\ 
    j & -j 
  \end{array}
\right]
\left[
  \begin{array}{c}
    \tilde{I}_+ \\ 
    \tilde{I}_-  
  \end{array}
\right]
```

Inverting, the forward and backward components can be expressed

```{math}
:label: eq:9:current_matrix_inv

\left[
  \begin{array}{c}
    \tilde{I}_+ \\ 
    \tilde{I}_- 
  \end{array}
\right]
= \frac{1}{2}\left[
  \begin{array}{c}
    1 & -j \\ 
    1 &  j 
  \end{array}
\right]
\left[
  \begin{array}{c}
    \tilde{I}_{as} \\ 
    \tilde{I}_{bs} 
  \end{array}
\right]
```


4. Suppose $\tilde{I}_{as} = 1 \phase{0}$ and $\tilde{I}_{bs} = 0.5
   \phase{90\degree}$.  Determine the relative strength of the CW and CCW
   rotating components of the magnetic field using
   {eq}`eq:9:current_matrix_inv`. Use Matlab to do the math.  Repeat (3) for the
   given $\tilde{I}_{as}$ and $\tilde{I}_{bs}$. Note that when the source is
   unbalanced, the magnetic field may be decomposed into two components, each
   with different strengths.

5. Suppose $\tilde{I}_{as} = 1\phase{0}$ and $\tilde{I}_{bs} = 0$.  Determine
   the relative strength of the CW and CCW rotating components of the magnetic
   field using {eq}`eq:9:current_matrix_inv`.  Repeat question 3 from
   {numref}`pmag_sync_motor_a_dev_rot_mag_fields` for the given $\tilde{I}_{as}$
   and $\tilde{I}_{bs}$.


## Postlab

Our next objective will be to experimentally observe the development of rotating
magnetic fields in the AC device shown in {numref}`fig:9:phase_a` where only one
phase winding is shown for simplicity. This device is a 4-pole permanent-magnet
synchronous machine (actually, its part of a brushless DC machine, but we won't
call it that until later).  Here $as_1 -as_1^\prime$ and $as_2 -as_2^\prime$
represent sinusoidally distributed windings with $\odot$ and $\otimes$
indicating the locations where the turns density is maximum. 

The $as$ winding is comprised of the series connection of $as_1 -as_1^\prime$
and $as_2 -as_2^\prime$.  Representative lines of magnetic flux for a positive
current in the $as$ winding are shown in {numref}`fig:9:phase_a_flux_lines`. The
actual flux distribution is distributed sinusoidally with peak densities
occurring along the respective magnetic axes. Similarly, the $bs$ winding, shown
in {numref}`fig:9:phase_b`, is comprised of the series connection of coils $bs_1
-bs_1^\prime$ and $bs_2 -bs_2^\prime$, and the $cs$ winding, shown in
{numref}`fig:9:phase_c`, is comprised of the series connection of coils $cs_1
-cs_1^\prime$ and $cs_2 -cs_2^\prime$.



```{figure} ./figures/lab_09/phase_a.png
:name: fig:9:phase_a
:width: 60%

Cross sectional view of 4-Pole single phase winding (phase $a$).
```

```{figure} ./figures/lab_09/phase_a_flux_lines.png
:name: fig:9:phase_a_flux_lines
:width: 60%

Representative lines of flux for positive $i_{as}$.
```

```{figure} ./figures/lab_09/phase_b.png
:name: fig:9:phase_b
:width: 50%

Winding configuration for phase $b$.
```

```{figure} ./figures/lab_09/phase_c.png
:name: fig:9:phase_c
:width: 50%

Winding configuration for phase $c$.
```


1. Approximate the corresponding mmfs as sinusoidal functions of circumferential
   coordinate $\phi_s$ (i.e. fill in the blanks):

   ```{math}
   :label: eq:9:mmf_as

   \text{mmf}_{as}
   = K i_{as} \cos(\blank\phi_s + \blank)
   ```

   ```{math}
   :label: eq:9:mmf_bs

   \text{mmf}_{bs}
   = K i_{bs} \cos(\blank\phi_s + \blank)
   ```

   ```{math}
   :label: eq:9:mmf_cs

   \text{mmf}_{cs}
   = K i_{cs} \cos(\blank\phi_s + \blank)
   ```

2. Suppose

   ```{math}
   i_{as} = 1 \cos \omega_e t
   ```

   ```{math}
   i_{bs} = 1 \cos (\omega_e t-120^o)
   ```

   ```{math}
   i_{cs} = 1 \cos ( \omega_e t +120^o)
   ```

   Show analytically that a rotating magnetic field will be produced.
   
   ```{admonition} Hint
   :class: hint dropdown
   
   The net magnetic field is the superposition of {eq}`eq:9:mmf_as`,
   {eq}`eq:9:mmf_bs`, and {eq}`eq:9:mmf_cs`.  The trigonometric identities in
   Appendix A of the EE321 text are very useful.
   ```

3. In what direction will it rotate (CW or CCW)?

4. At what speed will it rotate (this is called the synchronous speed)?

5. At what speed must the rotor rotate in order to produce a non-zero average torque?

6. What kind of torque will be produced if the rotor rotates at a speed other
   than the speed of the rotating magnetic field?

7. What is the relationship between synchronous speed, the frequency of the
   applied currents, and the number of poles?