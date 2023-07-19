```{include} ./macros.md
```
(electromagnetic_forces_b)=
# Electromagnetic Forces (B)

```{admonition} Objective
:class: note

The objective of this experiment is to study the interaction between electrical
and mechanical systems that are coupled magnetically.  The electromechanical
relay (solenoid) studied in {numref}`Experiment %s
<inductance_and_magnetic_circuits>` will be analyzed to predict its steady-state
force-versus-position and force-versus-current characteristics.  Moreover,
computer simulation will be used to predict its dynamic force-versus-time
characteristics. The analytical and simulated results will be compared with
laboratory measurements.

```

```{figure} ./figures/lab_04/fig1n.png
:name: fig:4:lab_setup

Setup for {numref}`Experiment %s <electromagnetic_forces_b>`.
```

## Introduction:

In this lab, we will consider the cylindrical solenoid depicted in
{numref}`fig:4:solenoid_cross_section`.  In the previous experiment, it was
shown that the self-inductance can be approximated as

```{math}
:label: eq:4:solenoid_inductance

L(x) = L_l + \frac{K}{k_0+x}
```

Here, $K$ and $k_0$ are assumed to be known constants and $L_l$ is the leakage
inductance.  In the prelab, we will establish an expression for force versus
position and express the electrical and mechanical equations in state-space
form.

```{figure} ./figures/lab_04/fig2n.png
:name: fig:4:solenoid_cross_section
:width: 80%

Simplified cross-sectional view of cylindrical solenoid.
```

Hopefully, our experimental measurements will confirm the general form of this
equation.

(prelab_electromagnetic_forces_b)=
## Prelab

Let $M$ denote the mass of the plunger and $f$ the externally applied force
({numref}`fig:4:solenoid_cross_section`).  Newton's law of motion may be expressed.
  
```{math}
:label: eq:4:newtons_law

f + f_e(i,x) = M\frac{d^2x}{dt^2}
```

This second-order differential equation may be expressed as two first-order
equations
```{math}
:label: eq:4:mechanical_differential1

\frac{dv_x}{dt}=\frac{1}{M}\left[ f_e(i,x)+f\right]
```
```{math}
:label: eq:4:mechanical_differential2

\frac{dx}{dt} = v_x
```
where $v_x$ is the velocity, $x$ is the position, $i$ is the current, $v$ is the
applied voltage and $f$ is the externally applied force.  The electrical
equation may be expressed symbolically as
```{math}
:label: eq:4:electrical_differential

\frac{d\lambda}{dt} = g(\lambda,v,x)
```
where $g$ is a function of the indicated arguments.

Starting with $\displaystyle v = ri + \frac{d \lambda}{dt}$ and $\lambda =
L(x)i$, derive an expression for $g$ in terms of $\lambda$, $v$, and $x$.
Equations {eq}`eq:4:mechanical_differential1`-{eq}`eq:4:electrical_differential`
represent the state equations of the electromechanical system where $v_x$ and
$x$, and are state variables, while $v$ and $f$ are inputs. The parameters are
$K$, $k_0$, and $r$ (coil resistance). 

The three coupled first-order differential equations contain nonlinear terms and
are therefore difficult to solve analytically. A technique that can be used to
solve the differential equations numerically is outlined below.  A Simulink
model of the solenoid is shown in {numref}`fig:4:simulink_model`. This model is
based upon the equations set forth in 
{eq}`eq:4:newtons_law`-{eq}`eq:4:electrical_differential`.
Additional logic is provided to prevent the solenoid position from becoming
negative (an impossibility, at least in classic Physics).  In particular, when
$x$ tries to go negative, the output Q of the SR flip-flop is set high, which,
in turn, sets and holds the integrator that calculates $v_x$ to zero.  When the
net applied force is greater than zero, the flip-flop is reset, which "releases"
the integrator that calculates $v_x$ (allowing $v_x$ to become positive).

Look at this Simulink model and compare with the equations found in prelabs
{numref}`%s<prelab_electromagnetic_forces_a>` and
{numref}`%s<prelab_electromagnetic_forces_b>` Be prepared to take a quiz on these
equations based with respect to electromagnetic and electromechanical force at
the beginning of the lab period.

```{figure} ./figures/lab_04/fig3.png
:name: fig:4:simulink_model
:width: 80%

Simulink model of solenoid.
```

## In the Laboratory:

Try to resolve gross discrepancies between measured and calculated plots by
repeating necessary measurements. Identify the discrepancies encountered. Our
final objective will be to investigate the solenoid dynamics.

### Solenoid Dynamics

1. Execute the program {file}`proj3.mdl` that should be in the {file}`Lab 4`
   directory.  This opens a Simulink project window.

2. Simulate the solenoid pull-in characteristics for each combination of $x_0$
   at $\qty{1/8}{\inch}$ and $\qty{3/8}{\inch}$ and $M$ at $0$, $50$, $100$, and
   $\qty{150}{\g}$. In {file}`proj3.mdl`, $M$ is the external mass. The plunger
   mass is $\qty{35}{\g}$. Double-click the {guilabel}`Subsystem` block to open
   a dialog window and fill in the parameters ($x_0$, $M$, $r$, $L_l$, $K$,
   and $k_0$). Right-selecting the block in the Simulink project window and
   choosing {guilabel}`Look Under Mask` opens a second window that displays the
   model shown in {numref}`fig:4:simulink_model`.  Run the model as a normal
   Simulink model (that is, do not build a target model). Record the time for
   the plunger to reach $x=0$.  Make printouts of the waveforms for the
   ($\qty{1/8}{\inch}$, $\qty{150}{\g}$), and ($\qty{3/8}{\inch}$,
   $\qty{0}{\g}$) simulations.


### Measuring Plunger Pull-In Time

   Remove the weights from the solenoid plunger. Position the plunger at
   $\qty{1/8}{\inch}$ using the set screw for calibration. Position the
   mechanical stop ({numref}`fig:4:lab_setup`) so that $x$ cannot exceed
   $\qty{1/8}{\inch}$. Then, remove the set screw. Apply a $12$-$\volt$ step to
   the solenoid coil. The solenoid should "pull in". Set the oscilloscope to
   single-sweep mode and set the timescale to $\qty{20}{\milli\second\per
   div}$.  Capture the measured current waveform as the solenoid "pulls in". You
   will with near certainty have to repeat this step several times to capture
   the desired data.

   Measure the time from application of the step voltage to the "dip" in the
   current waveform using paired cursors.

   Add $50$, $100$, and $\qty{150}{\g}$ weights to the solenoid plunger and
   repeat the pull-in time measurements. Use {program}`BenchVue` to get and
   print a snapshot of the $\qty{1/8}{\inch}$, $\qty{150}{\g}$ response showing
   the paired cursor measurement.

   Repeat the transition time measurements using a starting position of
   $\qty{3/8}{\inch}$.  Using {program}`BenchVue`, capture and print the
   simulated and measured current-versus-time data for the $\qty{3/8}{\inch}$,
   $\qty{0}{\g}$ trial.  Explain the discrepancies between the simulated and
   experimental results.

```{table} Pull-in Time Data
:name: tab:4:pull_in_time
:width: 80%
:widths: 8 10 20 20

| $x_0$ ($\inch$) | Mass ($\g$) | Simulated<br> Pull-in Time ($\milli\second$) | Measured<br> Pull-in Time ($\milli\second$) |
|:---------------:|:-----------:|:--------------------------------------------:|:-------------------------------------------:|
|           $1/8$ |         $0$ |                                              |                                             |
|                 |        $50$ |                                              |                                             |
|                 |       $100$ |                                              |                                             |
|                 |       $150$ |                                              |                                             |
|           $3/8$ |         $0$ |                                              |                                             |
|                 |        $50$ |                                              |                                             |
|                 |       $100$ |                                              |                                             |
|                 |       $150$ |                                              |                                             |
```

% Alternate table format.  This flattens wide tables, but makes column alignment
% more difficult.  Once myst-parser 0.19 is available, we will be able to
% control alignment by using {.class} to set CSS classes on each element.
% 
% ```{list-table} Pull-in Time
% :name: tab:4:pull_in_time2
% :width: 80%
% :widths: 8 10 20 20
% :header-rows: 1
% :class: text-center
% 
% *   - $x_0$ ($\inch$)
%     - Mass ($\g$)
%     - Simulated<br> Pull-in Time ($\milli\second$)
%     - Measured<br> Pull-in Time ($\milli\second$)
% *   - $1/8$
%     - $0$
%     - 
%     - 
% *   - 
%     - $50$
%     - 
%     - 
% *   - 
%     - $100$
%     - 
%     - 
% *   - 
%     - $150$
%     - 
%     - 
% *   - $3/8$
%     - $0$
%     - 
%     - 
% *   - 
%     - $50$
%     - 
%     - 
% *   - 
%     - $100$
%     - 
%     - 
% *   - 
%     - $150$
%     - 
%     - 
% ```

% Alternate table format.  This is closer to the LaTeX version, but the extra
% complexity does not seem to be worth it.
%
% ```{eval-rst}
% .. table:: Pull-in Time
%    :name: tab:4:pull_in_time
%    :width: 80%
%    :class: text-right
% 
%    +---------------------+-------------------+-------------------------+--------------------------+
%    |                     |                   | .. centered:: Pull-in Time (:math:`\milli\second`) |
%    + :math:`x_0`         | Mass (:math:`\g`) +-------------------------+--------------------------+
%    | (:math:`\inch`)     |                   |               Simulated |                Measureed |
%    +=====================+===================+=========================+==========================+
%    |                     |         :math:`0` |                         |                          |
%    +                     +-------------------+-------------------------+--------------------------+
%    |                     |        :math:`50` |                         |                          |
%    +         :math:`1/8` +-------------------+-------------------------+--------------------------+
%    |                     |       :math:`100` |                         |                          |
%    +                     +-------------------+-------------------------+--------------------------+
%    |                     |       :math:`150` |                         |                          |
%    +---------------------+-------------------+-------------------------+--------------------------+
%    |                     |         :math:`0` |                         |                          |
%    +                     +-------------------+-------------------------+--------------------------+
%    |                     |        :math:`50` |                         |                          |
%    +         :math:`3/8` +-------------------+-------------------------+--------------------------+
%    |                     |       :math:`100` |                         |                          |
%    +                     +-------------------+-------------------------+--------------------------+
%    |                     |       :math:`150` |                         |                          |
%    +---------------------+-------------------+-------------------------+--------------------------+
% ```
   
## Postlab

1. Provide an explanation for the "dip" in solenoid current when the plunger
   pulls in. 

   ````{admonition} Hint
   ```{math}
   :label: eq:4:current_dip
   v
   = ri + \frac{d}{dt}[L(x)i]
   = ri + L(x) \frac{di}{dt} + \frac{dL(x)}{dx}\frac{dx}{dt}
   ```
   ````

   How do $L(x)$, $\displaystyle\frac{dL}{dx}$, and $\displaystyle\frac{dx}{dt}$
   vary during the pull-in transient?
   
Use relevant equations to provide answers to the following questions:

2. Why does solenoid inductance decrease as the plunger position increases?

3. Why does the solenoid force decrease as the plunger position increases?

4. What is the relationship between force and current? What is the relationship between
force and position?

5. What happens to the plunger if the solenoid coil polarity is reversed?

6. Can the plunger be made to "push out" instead of "pull in"? Explain.