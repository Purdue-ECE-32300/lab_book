```{include} ./macros.md
```
(introduction_to_lab_experiments)=
# Introduction to Lab Experiments

```{admonition} Objective
:class: note

The purpose of this lab session is to introduce the laboratory equipment and
procedures that will be used to characterize the electromechanical devices
studied in ECE 321. The main objectives are to:

- Introduce the host and target computers, MATLAB/Simulink(TM) Real
Time Workshop(R) (RTW), and the patch panel.

- Practice acquiring, storing, and downloading waveforms using the digital
oscilloscope.

- Show how to load data files into MATLAB. Learn MATLAB commands to process the
data.

- Learn how to print oscilloscope and MATLAB graphs.

- Build and run standalone Simulink models.
```

## Introduction

The primary focus of this lab course is to reinforce experimentally the basic
principles of electromechanical energy conversion taught in ECE321 and to study
the performance of different types of electromechanical devices (solenoids,
motors and generators). To facilitate this learning process, the ECE323 lab has
been furnished with equipment that is intended to simplify the data gathering
and processing aspects of the lab. The computers used in this lab consist of a
target computer (target) equipped with digital-to-analog (D/A) and
analog-to-digital (A/D) converters, and a host computer (host), which is a
conventional desktop PC running Windows 7 operating system and equipped with
MATLAB/Simulink. This host/target computer combination serves as a signal
generator, data acquisition system, signal analyzer, and print server. In this
lab, we will use the computer to run a variety of packaged utilities and
custom-written software.

The workstation "patch panel" is shown in {numref}`fig:1` and has a variety of
functions. The panel includes:

1. Four Analog $+/-$ Inputs.

2. A 25-pin Digital Input port (For use with a position encoder).

3. A 9-pin Digital Input port (For use with the Hall Effect sensors on the PM Machines).

4. A 15-pin Digital Output port.

5. Three high-power analog outputs, each with two BNC connectors for voltage and
current measurements. The upper BNC connector is used to measure voltage and the
lower connector outputs 2 Volts per Amp flowing through the banana plugs.

5. Three high-power analog outputs, each with two BNC connectors for voltage and
current measurements. The upper BNC connector is used to measure voltage and the
lower connector outputs 2 Volts per Amp flowing through the banana plugs.

The patch panel is interfaced to the target computer using a 6-channel D/A board
and a 16-channel A/D board plugged into the computer's backplane.  The digital
oscilloscope has the ability to capture and store up to 4 channels of data. The
oscilloscope is connected to the host computer through a universal serial bus
(USB) connection.

```{figure} ./figures/lab_01/fig1n.png
:name: fig:1

Patch panel.
```

In addition to the standard oscilloscope probes, this lab has been equipped with
an analog torque transducer and two hall-effect current probes. The current
transducers are used by simply clamping the current probe onto the wire to be
monitored and connecting the Tektronix TCPA300 current amplifier output to the
oscilloscope or patch panel. The torque transducer is equipped with a digital
readout, but also has an analog output in the back that can be connected to the
oscilloscope or patch panel.

In this course, we will use the host computer to build Simulink models and  the
target computer D/A outputs to generate signals to drive motors and solenoids.
We will then use probes, transducers, A/D inputs, and the oscilloscope to
capture and display arrays of data that are useful for characterizing the
electromechanical device under study. Data captured on the oscilloscope can be
downloaded to the host computer through its USB connection.  The data can be
displayed on the computer screen, processed using the math utilities included
with MATLAB, printed on the network printer, and stored on your network account
for future reference.

This first lab exercise has been prepared to familiarize you with the equipment
(computers, oscilloscope, transducers, patch panel, printer, power supply), the
computer programs, and the basic procedures that you will be using in future
labs.


## In the Laboratory


```{admonition} Equipment
:class: Note

- Computers: Host PC (Windows 7), and Target PC (Speedgoat RealTime Target)
- Oscilloscope: Keysight MSOX3014T 100-Mhz Digital Storage Oscilloscope
- Printer: Network HP printer
- Current Transducer: Tektronix TCPA300 Current Probe Amplifier
- Torque Transducer: Himmelstein MCRT transducer with 700-series Amplifier
```

### Preliminary Setup (performed once at beginning of semester)

1. From Brightspace, click the icon labelled {guilabel}`Lab Files`.  This will
download a folder labelled {file}`ECE323_Lab_Files` into the downloads folder of
your computer.  Extract (unzip) and move this folder into {file}`C:\Users\Your
Name`.  This folder becomes part of your ecn PC roaming profile.  Navigate to
the {file}`Lab1` folder in this directory.  Double click the
{file}`ee323lib.slx` icon in the {file}`Lab1` folder to start MATLAB in the
given folder (directory).

2. In the MATLAB command window, type {command}`slrtExplorer` ({numref}`fig:2`).
   After a brief (sometimes long) delay, this will open an
   {command}`slrtExplorer` window similar to that shown in {numref}`fig:3`.

   ```{figure} ./figures/lab_01/MatlabWindow.png
   :name: fig:2

   MATLAB top-level window.
   ```

   ```{figure} ./figures/lab_01/SLRTExplorer2.png
   :name: fig:3

   {command}`slrtExplorer` window.
   ```

   Referring to {numref}`fig:3`, click on {guilabel}`add-target` icon. This will
   create a link to a new target. Enter the name of your lab station and the IP
   address of the target computer in your station. Click on the
   {guilabel}`Change IP Address` icon.  MATLAB will attempt to communicate with
   the target and notify you if successful.  If not, see TA or instructor.
   Finally, click on the {guilabel}`connect-to-target` icon ({numref}`fig:3`),
   which initially displays {guilabel}`Disconnected`. The display should then
   change to {guilabel}`Connected`.

### Building Target Model

1. The Simulink model required to execute this experiment will consist of
   blocks from both the Simulink Library Browser and the {file}`ee323lib.slx`
   file.  Bring to focus the Simulink ECE323lib window ({numref}`fig:EE323lib`).
   Open the standard Simulink library by clicking the {guilabel}`Library
   Browser` button near the top of the window. In top left corner, select
   {menuselection}`New --> Blank Model`.  This will open a blank Simulink
   window.  Save the model window as {file}`lab1.slx`.

   ```{figure} ./figures/lab_01/ECE323lib.png
   :name: fig:EE323lib

   Simulink EE323 library.
   ```

2. Construction of the Simulink model begins by copying ({kbd}`Ctrl-C Ctrl-V`)
   or dragging blocks from the standard Simulink library or ECE323lib to the
   lab1 model window.  Blocks can be moved within the model by pressing left
   mouse button when the cursor hovers above the desired block and dragging to
   the desired location. In addition, when the block handles are active, they
   can be used to alter the size of the block.  Multiple uses of the same block
   will result in automatic incremental labeling of the blocks. To connect the
   blocks, click on an arrow of one block, hold button, and drag the mouse to
   the termination point.  Use the model blocks from the Simulink Library
   Browser and the {file}`ee323lib.slx` file to construct the waveform generator
   model shown in {numref}`fig:lab1`.

   ```{figure} ./figures/lab_01/lab1.png
   :name: fig:lab1

   Simulink project window for Lab 1.
   ```

3. In the model window, double-click on the appropriate source block and use the
   mouse and keyboard to set up the following 50-Hz waveforms on the D/A
   outputs:

   ```{note}

   Some block parameters are in radians.
   ```

   ```{table} Target model parameters
   :name: tab:target_model_parameters

   |  D/A |  Wave Type |      Amplitude |       DC level |          Phase Shift | Oscope |                   Scale |
   |-----:|-----------:|---------------:|---------------:|---------------------:|-------:|------------------------:|
   | Ch 1 |       Sine |  $\qty{5}{\V}$ |  $\qty{0}{\V}$ |   $\qty{0}{\degree}$ |   Ch 1 |   $\qty{5}{\V\per div}$ |
   | Ch 2 |       Sine |  $\qty{5}{\V}$ |  $\qty{5}{\V}$ | $\qty{-90}{\degree}$ |   Ch 2 |   $\qty{5}{\V\per div}$ |
   | Ch 3 |     Square |  $\qty{5}{\V}$ |  $\qty{0}{\V}$ |   $\qty{0}{\degree}$ |   Ch 3 |   $\qty{5}{\V\per div}$ |
   ```
   %| Ch 4 |   Sawtooth | $\qty{10}{\V}$ | $\qty{-10}{\V} |   $\qty{0}{\degree}$ |   Ch 4 | $\qty{10}{\mA\per div}$ |

4. Simulink Real-Time (slrt) is included in the Simulink software. This software
   provides the link between the model code and the test hardware. When a model
   is initially created, default parameters define the simulation environment.
   Bring to focus the {guilabel}`lab1.slx` window. Select the
   {guilabel}`Modeling` tab.  Then press {guilabel}`Model Settings` button.  In
   the left column of newly created window, select {guilabel}`Solver`. The
   window should now appear similar to {numref}`fig:ConfigParam`.  Change all
   settings to match {numref}`fig:ConfigParam`.

   ```{figure} ./figures/lab_01/ConfigParam.png
   :name: fig:ConfigParam

   Solver parameters for Lab 1.
   ```

   Next, select {guilabel}`Code Generation` in left column of same window, which
   should now be similar to {numref}`fig:CodeGen`. Select System target file to
   match that in {numref}`fig:CodeGen`. Close given window. Bring back to focus
   the {guilabel}`lab1.slx` window, which should now have a tab called
   {guilabel}`Real Time`.  Select this tab. Near top-left corner, select the
   target PC and press {guilabel}`Disconnect` link to connect. If everything was
   successful, the top-left link should now display {guilabel}`Connected`. If
   so, press {guilabel}`Run on Target` button.

   ```{figure} ./figures/lab_01/CodeGen.png
   :name: fig:CodeGen

   Code generation parameters for Lab 1.
   ```

   Simulink will now generate and compile code to run on target PC. This may take a minute or two. If successful, the code will automatically download to and start target model. Confirm by looking at the target display.

5. Connect amplifier Channels 1, 2 and 3 to oscilloscope Channels 1, 2 and 3,
   respectively.  Trigger on Channel 1. Adjust the time base to capture 2 cycles
   of data. Display all scope channels.

6. Apply the D/A Channel 3 voltage to a 25-$\Omega$ resistor.  Measure the
   current by connecting the lower BNC connector to oscilloscope Channel 4.

7. To download the oscilloscope data, open {program}`BenchVue` on the host
   computer.  Exit the demo screen and select the proper oscilloscope.  You
   should see an image of the oscilloscope screen on the host computer.  On the
   {guilabel}`screen image` tab check the boxes that invert colors (so as not to
   waste ink or toner when printing), black and white and click {guilabel}`get
   current screen`. You should see an image similar to {numref}`fig:scope`.  To
   save your screenshot, select {guilabel}`Export` in the lower right corner of
   the {program}`BenchVue` window. Hit {guilabel}`browse`, and navigate to your
   {file}`ECE323` folder. Select the {file}`lab1` folder and hit {guilabel}`OK`.
   This will ensure that {program}`BenchVue` saves your screenshot in the
   correct location on your account.

   ```{figure} ./figures/lab_01/scope.png
   :name: fig:scope

   Sample screen shot.
   ```

8. Next, on the {guilabel}`trace data` tab, select {guilabel}`get current
   traces`.  Export the data into MATLAB.  When saving the file, make sure the
   filename you select (e.g.  {file}`lab1\data`) does not include any spaces.
   Also, uncheck the check-box {guilabel}`include number`.  This will avoid
   compatibility issues with MATLAB.

9. Exit or close {program}`BenchVue`.  The waveform data will be stored in a
   file named {file}`lab1\data.mat`. The data file contains an $N \times 2$
   matrix of data for each channel of the oscilloscope screen.  The first column
   of each matrix contains the time data. The second column contains the y-axis
   data of the signal.  Some commonly used MATLAB commands are listed at the end
   of this handout. For more detailed information on using any of these
   commands, type {command}`help command` in the MATLAB command window.


10. Create and execute an m-file containing the following commands that load
    four channels of oscilloscope data into MATLAB workspace:

    ```matlab
    load lab1_data.mat
    time = Trace_1(:,1);
    channel1 = Trace_1(:,2);
    channel2 = Trace_2(:,2);
    channel3 = Trace_3(:,2);
    channel4 = Trace_4(:,2);
    ```

    Plot the four channels of data on the computer screen using the MATLAB
    commands plot and subplot. Add a title, labels, and grid. Make a hard copy
    printout of the plot.

11. For each channel, compute the average and RMS values of the signals. This
    can be accomplished by creating MATLAB programs. Using the m-file editor,
    write the following MATLAB commands and save in file avg.m.

    ```matlab
    avsum = 0.0;
    for i = 1: length(channel1)
        avsum = avsum + channel1(i);
    end
    av = avsum/length(channel1);
    ```

    When in the MATLAB command window, type `avg`. The average value of the
    Channel 1 data will be computed. Repeat this for Channels 2, 3, and 4.
    Create a MATLAB program to compute the RMS value of each channel.  Do NOT
    use the built-in MATLAB `rms` command.  The RMS value of a continuous signal
    is defined as

    ```{math}
    :label: eq:rms

    \hat x = \sqrt {\frac{1}{T}\int_0^T {{x^2}(t)dt} }.

    ```
    The discrete counterpart is

    ```{math}
    :label: eq:discrete_rms

    \hat x = \sqrt{\frac{1}{N}\sum_{n = 0}^N {{x^2}(n)} }
    %\hat x = \sqrt{\frac{1}{N}\sum\nolimits_{n = 0}^N {{x^2}(n)} }
    ```

    where $N$ is the number of samples in an integer number of periods of the
    signal.  For those who would like to learn more about MATLAB, there are
    numerous MATLAB reference books available at local bookstores. Also, there
    is extensive online help - simply type help from the MATLAB command line.
    Write the results of the calculations on the printouts of the generated
    plots.  Do the results look reasonable?

12. Staple and turn in all printouts with you name on top of all pages.

## Postlab Exercise: Standalone Simulink model

In this part, we will develop a standalone computer simulation on the host
computer using Simulink.  The purpose is to become familiarized with some of the
basic building blocks of Simulink, to build a model of a simple dynamic system,
learn the steps needed to perform a simulation study and to generate annotated
and labelled plots.

1. Consider the equivalent circuit shown in {numref}`fig:ckt`. Using the basic
   equations of an inductor ($v=L\frac{di}{dt}$), and Kirchhoff's voltage law
   (KVL), express the dynamic equations of the circuit in the following form

   ```{figure} ./figures/lab_01/xfmer.png
   :name: fig:ckt

   Example circuit.
   ```

   ```{math}
   :label: eq:kvl

   \begin{bmatrix}
     v_1 \\
       0 \\
   \end{bmatrix}
   =
   \begin{bmatrix}
     \blank & \blank \\
     \blank & \blank \\
   \end{bmatrix}
   \begin{bmatrix}
      i_1 \\
      i_2^\prime \\
   \end{bmatrix}
   +
   \begin{bmatrix}
     \blank & \blank \\
     \blank & \blank \\
   \end{bmatrix}
   \frac{d}{{dt}}
   \begin{bmatrix}
      i_1 \\
      i_2^\prime \\
   \end{bmatrix}
   ```

   where $i_1$ and $i_2^\prime$ are the so-called state variables. Replace each
   of the blanks with expressions involving the circuit parameters. The previous
   equation may be expressed symbolically as

   ```{math}
   :label: eq:vector_kvl

   \mathbf{v} = \mathbf{Ri} + \mathbf{L} \frac{d}{dt} \mathbf{i}
   ```

   Equivalently

   ```{math}
   :label: eq:vector_kvl_for_di_dt

   \frac{d}{dt} \mathbf{i} = \mathbf{L}^{-1} ( \mathbf{v} - \mathbf{Ri} )
   ```

   We will build a Simulink model based on this equation. The parameters are
   given in {numref}`tab:model_parameters`.

   ```{table} Model parameters.
   :name: tab:model_parameters

   |             $r_1$ |      $r_2^\prime$ |       $L_{l1}$ | $L_{l2}^\prime$ |        $L_{m1}$ |           $R_{L}$ |
   |------------------:|------------------:|---------------:|----------------:|----------------:|------------------:|
   | $\qty{0.1}{\ohm}$ | $\qty{0.1}{\ohm}$ | $\qty{1}{\mH}$ |   $\qty{1}{mH}$ | $\qty{10}{\mH}$ | $\qty{1.9}{\ohm}$ |
   ```

2. Launch MATLAB, then launch Simulink by pressing the {guilabel}`Simulink` icon
   shown in {numref}`fig:blankSimulink`.  This opens a blank Simulink model
   window similar to that shown in {numref}`fig:blankSimulink`.  Note that the
   default name of the model is {file}`untitled`.  Immediately save this model
   as {file}`mylab1.slx`.  It is useful to save often since Simulink may
   occasionally "crash" causing all work since the last save to be lost.  Press
   the {guilabel}`Simulink Library` icon to open the {guilabel}`Simulink Library
   Browser`.  From the {guilabel}`Simulink Library`, open {guilabel}`Commonly
   Used Blocks`.

   ```{figure} ./figures/lab_01/fig7.png
   :name: fig:blankSimulink

   Blank Simulink model window.
   ```

3. Drag the following blocks from the browser into the empty model window:
   {guilabel}`Sum`, {guilabel}`Integrator`, {guilabel}`Gain`, {guilabel}`Scope`,
   {guilabel}`Constant`, and {guilabel}`Mux`.  From {guilabel}`Simulink/Sinks`
   in the {guilabel}`Library Browser`, drag the {guilabel}`To Workspace` block
   into the model window.  From {guilabel}`Simulink/Sources`, drag the
   {guilabel}`Sine Wave` block into the model window.

4. If the input of the {guilabel}`Integrator` is set to the right-hand side of
   {eq}`eq:vector_kvl_for_di_dt`, which is $d\mathbf{i}/dt$, then the output
   becomes $\mathbf{i}$.  Note that Simulink uses the Laplace operator $1/s$ to
   denote integration with respect to time.  This might lead some to believe
   that Laplace, transform techniques are used to solve the differential
   equations; however, this is definitely not the case.  This is just a symbolic
   way to say that the output is equal to the input integrated with respect to
   time.  By dragging and connecting the inputs and outputs of the various
   blocks in accordance with {eq}`eq:vector_kvl_for_di_dt`, form a Simulink
   model of the given circuit similar to that shown in Figure
   {numref}`fig:simmdl`.

   ```{figure} ./figures/lab_01/fig8.png
   :name: fig:simmdl

   Simulink model.
   ```

5. In this model, the directed lines (lines with arrows) in the Simulink model
   represent 2-dimensional signals that connect the output of a block to the
   input of another block. The two components of the output of the integrator
   block represent $i_1$ and $i_2^\prime$.  In accordance with
   {eq}`eq:vector_kvl_for_di_dt`, the gain in the triangular block preceding the
   {guilabel}`Integrator` must be set to $\mathbf{L}^{-1}$.  This is
   accomplished by double-clicking the {guilabel}`Gain` block to open its dialog
   window.  In this window, select {guilabel}`Matix (K*u)` from the pull-down
   field labelled {guilabel}`multiplication` and type {command}`inv(L)` into the
   text field labeled {guilabel}`Gain`.  You may wish to read more about this
   block by pressing the help button to open its documentation window.  Follow
   similar steps to set the gain of the other gain block {guilabel}`Gain1` to
   {command}`R`.  We will describe how to define the values of {command}`L` and
   {command}`R` a little later.


6. The voltage vector $\textbf{v}$ in {eq}`eq:vector_kvl_for_di_dt` is a
   2-dimensional vector. However, the output of the {guilabel}`Sine-Wave` block
   is a scalar signal.  To form a 2-dimensional voltage vector, a multiplexer or
   {guilabel}`mux` block is used as shown in {numref}`fig:simmdl`.  This block
   converts the two scalar signals into one 2-dimensional signal.  The summer
   accepts two 2-dimensional inputs and outputs a 2-dimensional signal.  If the
   inputs were of differing dimensions, an error message would be produced when
   attempting to run the model.

7. Double-click the {guilabel}`Integrator` block to open its dialog window. In
   the dialog window, set the initial condition to {command}`[0;0]`.


8. To set the parameters for the model, you will create a MATLAB script file
   named {file}`init.m` where you will define the values of all parameters. For
   example,

   ```matlab
   r_1 = 0.1; % primary resistance in Ohms
   ...
   L_l1 = 1e-3; % primary leakage inductance in Henries
   ...
   L = [? ?; ? ?];
   R = [? ?; ? ?];
   ...
   ```
   When you run the script file, the parameters are loaded into the MATLAB
   workspace.  The Simulink model has access to all workspace variables.

9. Double-click the {guilabel}`Sine Wave` icon to open its dialog window.  Set
   the amplitude to 100 (volts peak) and frequency to
   $\qty{400}{\radian\per\second}$.

10. Before running the simulation, go to the top menu in the Simulink model
    window and select the {guilabel}`Modelling` tab. Then press {guilabel}`Model
    Settings` icon.  This will open a very important dialog window.  Set the
    {guilabel}`solver type` to {command}`variable step`, the {guilabel}`maximum
    step size` to {command}`0.1`, the {guilabel}`minimum step size` to
    {command}`1e-20`, and the {guilabel}`solver` to {guilabel}`ode23s`.  Also,
    set {guilabel}`tstop` to {command}`0.5`. Step sizes and {guilabel}`tstop`
    have units of seconds.  Leave the other parameter set to their default
    values.  Double-click the {guilabel}`To Workspace` block. Make sure the save
    format is set to {guilabel}`Timeseries` and {guilabel}`sample time` to
    {command}`-1`.

11. You are now ready to make a study. Before you do {guilabel}`Save`!  Then
    press the {guilabel}`Run` icon.  You can double-click the {guilabel}`Scope`
    to see if the run is successful.

12. Although you can print the Scope data from the Scope window, it is
    preferable instead to generate labelled and annotated printable figures from
    MATLAB.  Create another script file and label it {file}`plotresults.m`.
    Enter the following lines

    ```matlab
    figure(1)
    plot(simout.time, simout.Data(:,1))
    title('i_1')
    xlabel('time (sec)')

    figure(2)
    plot(simout.time, simout.Data(:,2))
    title('i_2^\prime')
    xlabel('time (sec)')
    ```

    From the two figure windows, use {guilabel}`Tools/Data Cursor` to determine
    the peak values of $I_1(t)$ and $I_2^\prime (t)$ [steady-state $i_1(t)$ and
    $i_2^\prime(t)$].  Save the figures as {file}`.png` files.


## Postlab

1. Using phasor analysis, calculate $\tilde{I}_1$ and $\tilde{I}_2^\prime$.
   Express $I_1(t)$ and $I_2^\prime(t)$.  What are their peak values?  Compare
   the calculated results with the simulated values established in lab.

2. Submit printouts of the generated plots and all supporting calculations.  If
   you used MATLAB to perform calculations, submit the script file or command
   history.


## MATLAB Command Reference


| Command | Description |
|:--------|:------------|
| `load file` | Load data stored in {file}`file` |
| `save array file` | Store a variable array into {file}`file.mat` |
| `fft(array)` | returns a complex array of fft harmonic components |
| `^2`, `sqrt()` | square/square root of a variable |
| `sign`, `abs(array)` | sign/absolute value of a variable/array |
| `sin`, `cos`, `tan` | sine/cosine/tangent of angle (in radians) |
| `asin`, `acos`, `atan` | arcsin, arccosine, arctangent |
| `sinh`, `cosh`, `tanh` | hyperbolic sine, hyperbolic cosine, hyperbolic tangent |
| `length(array)` | number of elements in an array |
| `min`, `max`, `mean` | minimum, maximum, and mean of an array |
| `plot(x,y,x,y..)` | create a screen plot of the arrays y vs x. Also used as `plot(y)` |
| `title('myplot')` | Add a title to a screen plot |
| `xlabel('horiz')` | Add an x axis label to a screen plot |
| `ylabel('vert')` | Add a y axis label to a screen plot |
| `grid` | Add grid lines to a screen plot |
| `print` | Dump the screen plot to the printer |
| `whos` | List current variables and sizes in memory |
| `clear array` | remove a variable/array from memory |
| `...` | ellipsis for continuation of long lines |
| Other Misc. | |
| `! syscommand` | Execute a system command |
| `dir` or `ls` | list DOS files in current directory |
| `help ?` | List MATLAB commands and script (.m) files |
| `quit` or `exit` | end MATLAB program |
| `linspace(x1,x2,N)` | generates N points between x1 and x2 |
| `hold on` | subsequent plot commands add to existing plot |
| `subplot` | create a "vector" or "matrix" of plots |
| `figure` | open a new figure window for plotting |
