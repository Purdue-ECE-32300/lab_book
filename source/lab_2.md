
# Experiment 2: Inductance and Magnetic Circuits
```{admonition} Objective
:class: note
- The main objective of this experiment is to analyze a simple magnetic systems with mechanical motion. 
- A cylindrical electromechanical relay (Solenoid) will be analyzed to predict its electromagnetic characteristics.
- The results of the analysis will be compared with measured results.
```
## Outline
- Introduction
- Prelab
- Figures
- In the Laboratory
    1. Inductance versus Position measurement
- Postlab report

## Introduction
In this experiment, we will investigate the electromagnetic properties of a cylindrical solenoid. A simplified cutaway view of the solenoid is shown in {numref}`Figure 2.1`. The solenoid is wound such that an axial magnetic field is produced in the movable plunger. This magnetic field circulates aroun the outer shell forming closed flux lines.
A cross-sectional view of the solenoid along with the representative lines of the magnetic flux is shown in {numref}`Figure 2.2`. The strength of the magnetic field is dependent upon the amount of current in the coil and the displacement of the plunger, 'x'. In the Prelab, it will be shown that the inductance of the coil (Ratio of flux linking the coil to the current flowing in the coil) may be approximated for this solenoid as

$ L(x) = L_l + (K/(k_0 + x))$ --- (2.1)

Hopefully, our experimental measurements will confirm the general form of this equation.

## Prelab
Before beginning the lab, please familiariza yourself wirh the material in Sections 1.2, 1.4 and 1.7 of Electromechanical Motion Devices by P. Krause and O. Wasynczuk (Abbreviated as KWP hereafter). 
In this experiment, we will investigate the electrical properties of the solenoid as shown in {numref}`Figure 2.1`. The coil The coil is wound such that an axial magnetic field is produced in the movable plunger (i.e along the length of the plunger). This magnetic field crosses the air gap and circulates around the outer shell forming closed flux lines as shown in the sideway cross-sectional view in {numref}`Figure 2.2`. The magnetic flux density is dependent upon the amount of current in the coil and the displacement of hte plunger, 'x'. In this prelab, we will establish an expression for the self inductance of the coil in terms of the displacement, 'x' of the plunger. Using this expression, we will later relate the electromagnetic force to the current, 'i' and the displacement, 'x'. This will be done in the next lab.
In the following analysis, we will assume that the magmetic materials (Plunger, Outer Shell, End Plates) have infinite permeability (i.e $$ µ_r = ∞ $$). Otherwise, we would have an analytical mess. Also, we will assume that the lines of magnetic flux in the air gap between the plunger and the end plate on the RHS of {numref}`Figure 2.2` are uniformly distributed and are constrained ot the volumer whose cross-sectional area is equal to that of the plunger and length is 'x'.
Using these assumptions, establish and express in terms of 'x' and '$x_0$', the reluctance of the magnetic circuit associated with the air gap between the plunger and the RHS plate.

R = (Some function of $r_0$ and x) --- (2.2)

A second air gap exists in the end plate on the LHS of {numref}`Figure 2.2`. The cross-sectional area of this air gap is 
$2*\pi*(r_0+g)*w \approx 2*\pi*r_0*w$ and the length is g. Establish and express the reluctance associated with the gap g. Specifically,

R = (Some function fo g, w and $r_0$)

Let N represent the total number of turns associated with the coil. The self inductance may be expressed as 

$ L(x) = N^2/R(x)$ --- (2.4)

Relate K and to the geometric variables g, $r_0$ and w.

K = ____ H.m     ---(2.5)
$K_0$ = ____ m ---(2.6)

Using the following parameters, calculate K and $k_0$ (In metric Units). Using K and $k_0$ in metric units, plot the inductance versus position graph from 0 to 0.0127 m (1/2 inches)

|------------------|----------------|
|   N = 3740       |  g = 0.0045 in |
|------------------|----------------|
|  $r_0$= 0.21 in  |  w = 0.48 in   |
|------------------|----------------|

```{admonition} Note
:class: note
- $ µ_0 = 4*\pi * 10^-7 $ H/m. Watch units while inductance calcultion.
- Let V be the voltage of applied to the coil. Express the voltage equation in the form
    di/dt = (Some function of x,i,V and dx/dt)
```
```{admonition} Hint
:class: hint
- Apply Product and Chain rules of differentiation.
    V = r*i + d[L(x)i]/dt
```

## Figures
Figure 2.1
Figure 2.2
Figure 2.3 (Figure 2.5 from OG)


## In the Laboratory

### Objective 1: Measure Coil Inductance

- Instructions
    1. To set the postion x = 0, remove the screw completely.
    2. Hold the plunger against its stop and re-insert the screw turning it until it makes contact with the plunger.
    3. Each subsequent turn increases x by 1/32 inch. 
    4. Initially x = 0.

- Measure Coil Resistance
    1. Create a Simulink Model such that the Real Time Workshop will provide a DC Signal to Channel 3.
    2. Apply 12 V DC to the solenoid coil.
    3. Measure the DC current flowing through the coil. Caution: Keep current probe away from the magnetic field of the solenoid.
    4. Calculate the coil resistance R = V/I.

- Measure Coil Impedance
    1. Using the Simulink Model created in the above step, generate a 10 V (0 to Peak) 1 Hz sine wave. 
    2. Connect the amplifier output to the solenoid and measure the voltage of the oscilloscope. 
    3. Make sure the solenoid plunger is completely in (x = 0). 
    4. Measure the peak-to-peak solenoid current with the oscilloscope.
    5. Repeat the current measurements at higher frequencies (1,2,4,7,10,20,40,70,100 Hz).

- Calculate Inductance
    1. Calculate the impedance Z at each frequency by taking the ratio of peak-to-peak voltage (20 V) and peak-to-peak current.
    2. Plot the impedance magnitude versus frequency. Refer Appendix A.
    3. Establish the solenoid's inductance from the magnitude of impedance at each frequency. 
    4. Record the largest value for use in Postlab. 

### Objective 2: Measure Coil Inductance at various mechanical displacements

- Inductance versus Position
    1. Use Simulink Model to provide sine wave of 10 V (Zero to Peak) 10 Hz.
    2. Connect power amplifier output to the solenoid and measure the peak-to-peak solenoid voltage with the oscilloscope.
    3. Position the solenoid plunger at x = 0 (All the way in).
    5. Measure the peak-to-peak solenoid current with the oscilloscope.
    6. Repeat the current measurements by extending the plunger from 0 to 1/2 inch in 1/32 inch increments.

- Calculate Inductance
    1. Calculate the solenoid inductance at each position. [Hint: $|Z| = sqrt(r^2 + (w_e*L)^2)$] Refer Appendix A.
    2. Plot inductance versus plunger position.

- Calculate K and $k_0$
    1. Examine the numerical procedure described in Appendix B.
    2. Using data for inductance versus position obtained above, define x and L_meas in MATLAB.
        x = [...]; L_meas = [...];
        Make sure x and L_meas are column vectors. Transpose them if they are row vectors.
    3. Define initial guess vector for a = [$L_l$ K $k_0$]'.
        a = [0.001 0.001 0.0001]';
    4. Call the solenoid function 20 times to iterate to a final value [$L_l$ K $k_0$].
        for i = 1:20
            [a_new, L_fit] = solenoid(L_meas, x, a);
            a = a_new;
        end
    5. Plot the fitted and the measured inductance versus the position on a single plot. These plots should agree. If not, repeat with smaller values in the initial guess vector.
    6. Record the final values of $L_l$, K and $k_0$. These are the final converged values in a.


    ## Postlab
    
    1. Plot the measured impedance versus frequency characteristics with x = 0. Superimpose the calculated impedance versus frequency characteristics of an ideal circuit using the largest value of inductance from |Z| versus $$w_e$$ data. Describe the differences.

    2. The deviations that should be observed above may be attributed to Eddy currents induced in the plunger. The presence of eddy currents may be explained with reference to {numref}`Figure 2.3`. Assume the current in the coil is increasing with respect to time in accordance with the reference direction shown in {numref}`Figure 2.3`. This will cause the flux to increase in the direction shown (Determined by the Right hand rule). The Plunger is made of magnetic steel (Good Conductor). Currents will be induced in the plunger which will oppose the increase in flux. This is Lenz's law. These currents are shown in {numref}`Figure 2.5`. as dots and crosses representing directions. In practice, currents are continuously distributed in the plunger. We can calculate these currents using Maxwell's Equations. This is a difficult task. We are not doing this but it needs to be acknowledged. Since these eddy currents oppose the change in flux, what effect would they have upon the impedance versus frequency characteristics when compared to the case where eddy currents do not exist which would occur if the plunger were made of a non-conductive material? Explain briefly.

    3. For low frequencies, the induced eddy currents will be small because the flux does not change very rapidly. Therefore, they may be ignored. However, if the frequency is too small, it is difficult to extract the inductance from using the formula. Why? Explain briefly.

    4. Based upon the measured impedance versus frequency characteristics, for what frequency or range of frequencies would you expect the formula to give an accurate measure of DC or low frequency inductance?

    5. Why does the solenoid inductance decrease as the air gap increases?

    6. How does the assumption that the magnetic materials have infinite permeability affect the inductance?

    7. How would saturation affect the inductance?

    8. How could we determine whether or not the magnetic saturation affected our results? (What other data can we measure?)
        Hint: Saturation is a non-linear phenomenon. If sinusoidal voltage is applied to a non-linear inductor, do you expect the current ot be sinusoidal?

## Appendix A : Plotting measured Data

```{code-cell} MATLAB
    % Plotting Impedance versus Frequency. Calculating Inductance
    freq = [1,2,4,7,10,20,40,70,100]';
    omega_vector = 2*pi*freq;
    r = measured resistance;
    v1 = [Your Data Points seperated by commas]'; % Volts (Peak-to-Peak)
    ipeak1 = [Your Data Points seperated by commas]'; % Amperes (Peak-to-Peak)
    z1 = v1./ipeak1;
    L_vs_f = sqrt(z1.^2 - r^2)./omega_vector;
    figure(1)
    plot(freq,z1,'*')

    % Plotting Inductance versus Position
    omega_constant = 2*pi*10;
    x = [0,1,2,3,4,5,6,7,,8,9,10,11,12,13,14,15,16]';
    x = x/32; % Convert to Inches
    x = x/39.37; % Convert to Meters
    v2 = 20; % Volts (Peak-to-peak)
    ipeak2 = [Your Data Points seperated by commas]'; % Amperes (Peak-to-Peak)
    z2 = v2./ipeak2;
    L_vs_pos = sqrt(z2.^2 - r^2)/omega_constant;
    figure(2)
    plot(x, L_vs_pos,'*');
```

## Appendix B

```{code-cell} MATLAB
    function [a_new, L_fitted] = solenoid(L_meas,x,a);
        % L_meas = n vector of measured inductances
        % x = n vector of displacements
        % a = Initial guess vector of fitted parameters
        % a_new = Better guess vector of fitted parameters
        % L_fitted(i) = n vector of fitted inductances
        
        N = length(L_meas);

        % Calculate residual and Jacobian
        F = zeros(3,1); % 3*1 vector
        J = zeros(3,3); % 3*3 vector
        L_fitted = zeros(N,1);
        for i = 1:N
            F(1) = F(1) + (-L_meas(i) + a(1) + a(2)/ (a(3) + x(i)));
            F(2) = F(2) + (-L_meas(i) + a(1) + a(2)/ (a(3) + x(i)))/(a(3)+x(i));
            F(3) = F(3) + (-L_meas(i) + a(1) + a(2)/ (a(3) + x(i)))/(a(3)+x(i))^2;

            J(1,1) = N;
            J(1,2) = J(1,2) + 1.0/(a(3)+x(i));
            J(1,3) = J(1,3) - a(2)/(a(3)+x(i))^2;

            J(2,1) = J(2,1) + 1.0/(a(3)+x(i));
            J(2,2) = J(2,2) + 1.0/(a(3)+x(i))^2;
            J(2,3) = J(2,3) - a(2)/(a(3)+x(i))^3;

            J(3,1) = J(3,1) + 1.0/(a(3)+x(i))^2;
            J(3,2) = J(3,2) + 1.0/(a(3)+x(i))^3;
            J(3,3) = J(3,3) - a(2)/(a(3)+x(i))^4;        
        end 

        % Update
        a_new = a - inv(J)*F;

        % Calculate fitted inductance
        for i = 1:n
            L_fitted(i) = a_new(1) + a_new(2) / (a_new(3) + x(i));
        end
    return
```