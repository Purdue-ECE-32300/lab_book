# Experiment 1: Introduction to Lab Experiments

```{admonition} Objective
:class: note

The purpose of this lab session is to introduce the laboratory equipment and
procedures that will be used to characterize the electromechanical devices
studied in ECE 321. The main objectives are to:

- Introduce the host and target computers, MATLAB/Simulink&trade; Real
Time Workshop&reg; (RTW), and the patch panel.

- Practice acquiring, storing, and downloading waveforms using the digital
oscilloscope.

- Show how to load data files into MATLAB. Learn MATLAB commands to process the
data.

- Learn how to print oscilloscope and MATLAB graphs.

- Build and run standalone Simulink models.
```

## Introduction:

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

```{figure} ./figures/lab_1/fig1n.png
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


## In the Laboratory:


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

   ```{figure} ./figures/lab_1/MatlabWindow.png
   :name: fig:2
   
   MATLAB top-level window.
   ```

   ```{figure} ./figures/lab_1/SLRTExplorer2.png
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

### Building Target Model:

1. The Simulink model required to execute this experiment will consist of
   blocks from both the Simulink Library Browser and the {file}`ee323lib.slx`
   file.  Bring to focus the Simulink ECE323lib window ({numref}`fig:EE323lib`).
   Open the standard Simulink library by clicking the {guilabel}`Library
   Browser` button near the top of the window. In top left corner, select
   {menuselection}`New --> Blank Model`.  This will open a blank Simulink
   window.  Save the model window as {file}`lab1.slx`.

   ```{figure} ./figures/lab_1/ECE323lib.png
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

   ```{figure} ./figures/lab_1/lab1.png
   :name: fig:lab1

   Simulink project window for Lab 1.
   ```

3. In the model window, double click on the appropriate source block and use the
   mouse and keyboard to set up the following 50-Hz waveforms on the D/A
   outputs:

   ```{note}
   
   Some block parameters are in radians.
   ```

   | D/A  | WaveType  | Amplitude | DC level | Phase Shift | Oscope | Scale     |
   |-----:|----------:|----------:|---------:|------------:|-------:|----------:|
   | Ch 1 | Sine      |  5 V      |   0 V    |   0 deg     | Ch 1   |  5 V/div  |
   | Ch 2 | Sine      |  5 V      |   5 V    | -90 deg     | Ch 2   |  5 V/div  |
   | Ch 3 | Square    |  5 V      |   0 V    |   0 deg     | Ch 3   |  5 V/div  |
   %| Ch 4 | Sawtooth  | 10 V      | -10 V    |   0 deg     | Ch 4   | 10 mA/div |

4. Simulink Real-Time (slrt) is included in the Simulink software. This software
   provides the link between the model code and the test hardware. When a model
   is initially created, default parameters define the simulation environment. 
   Bring to focus the {guilabel}`lab1.slx` window. Select the
   {guilabel}`Modeling` tab.  Then press {guilabel}`Model Settings` button.  In
   the left column of newly created window, select {guilabel}`Solver`. The
   window should now appear similar to {numref}`fig:ConfigParam`.  Change all
   settings to match {numref}`fig:ConfigParam`.

   ```{figure} ./figures/lab_1/ConfigParam.png
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

   ```{figure} ./figures/lab_1/CodeGen.png
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
 
   ```{figure} ./figures/lab_1/scope.png
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
    four channels of oscilloscope data into Matlab workspace:

    ```matlab
    load lab1_data.mat
    time = Trace_1(:,1);
    channel1 = Trace_1(:,2);
    channel2 = Trace_2(:,2);
    channel3 = Trace_3(:,2);
    channel4 = Trace_4(:,2);
    ```

    Plot the four channels of data on the computer screen using the Matlab
    commands plot and subplot. Add a title, labels, and grid. Make a hard copy
    printout of the plot.

11. For each channel, compute the average and RMS values of the signals. This
    can be accomplished by creating Matlab programs. Using the m-file editor,
    write the following Matlab commands and save in file avg.m.

    ```matlab
    avsum = 0.0;
    for i = 1: length(channel1)
        avsum = avsum + channel1(i);
    end
    av = avsum/length(channel1);
    ```

    When in the Matlab command window, type `avg`. The average value of the
    Channel 1 data will be computed. Repeat this for Channels 2, 3, and 4.
    Create a Matlab program to compute the RMS value of each channel.  Do NOT
    use the built-in Matlab `rms` command.  The RMS value of a continuous signal
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
    signal.  For those who would like to learn more about Matlab, there are
    numerous Matlab reference books available at local bookstores. Also, there
    is extensive online help - simply type help from the Matlab command line.
    Write the results of the calculations on the printouts of the generated
    plots.  Do the results look reasonable?

12. Staple and turn in all printouts with you name on top of all pages.

## Postlab Exercise: Standalone Simulink model:

In this part, we will develop a standalone computer simulation on the host
computer using Simulink.  The purpose is to become familiarized with some of the
basic building blocks of Simulink, to build a model of a simple dynamic system,
learn the steps needed to perform a simulation study and to generate annotated
and labelled plots. 

1. Consider the equivalent circuit shown in {numref}`fig:ckt`. Using the basic
   equations of an inductor ($v=L\frac{di}{dt}$), and Kirchhoff's voltage law
   (KVL), express the dynamic equations of the circuit in the following form

   ```{figure} ./figures/lab_1/xfmer.pdf
   :name: fig:ckt

   Example circuit.
   ```

   some text

$$
\left[ \begin{array}{c}
  v_1  \\
    0 
\end{array}
\right]
$$

$$
\left[
  \begin{array}{cc}
    \underline{\hspace{1cm}} & \underline{\hspace{1cm}} \\
    \underline{\hspace{1cm}} & \underline{\hspace{1cm}} \\
  \end{array}
\right]
$$

$$
\left[ {\begin{array}{*{20}{c}}
  {{v_1}} \\ 
  0 
\end{array}} \right]
= \left[ {\begin{array}{*{20}{c}}
  \underline{spam} & \underline{\;\;\;\;\;\;\;\;\;} \\ 
  \underline{\;\;\;\;\;\;\;\;\;} & \underline{\;\;\;\;\;\;\;\;\;} 
\end{array}} \right]
\frac{d}{{dt}}\left[ {\begin{array}{*{20}{c}}
  {{i_1}} \\ 
  {{i_2^\prime}} 
\end{array}} \right]
+ \left[ {\begin{array}{*{20}{c}}
  \underline{\;\;\;\;\;\;\;\;\;}&\underline{\;\;\;\;\;\;\;\;\;} \\ 
  \underline{\;\;\;\;\;\;\;\;\;}&\underline{\;\;\;\;\;\;\;\;\;} 
\end{array}} \right]
\left[ {\begin{array}{*{20}{c}}
  {{i_1}} \\ 
  {{i_2^\prime}} 
\end{array}} \right]
$$