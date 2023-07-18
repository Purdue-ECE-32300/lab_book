% This is a hack to add the Bootstrap "d-none" class to these math macros so
% that they won't take up any space on the page. Once myst-parser 0.19 or
% greater is available, we will be able to use block attributes to do this by
% simply placing {.d-none} above the math directive.
%
% https://myst-parser.readthedocs.io/en/latest/syntax/optional.html#syntax-attributes-block

```{role} raw-html(raw)
:format: html
```
{raw-html}`<div class="d-none">`
%{.d-none}
```{math}

\newcommand\blank{~\underline{\hspace{1.2cm}}~}

% Bold symbols (vectors)
\newcommand\bs[1]{\mathbf{#1}}

% Poor man's siunitx
\newcommand\unit[1]{\mathrm{#1}}
\newcommand\num[1]{#1}
\newcommand\qty[2]{#1~\unit{#2}}

\newcommand\per{/}
%
% Scale
\newcommand\milli{\unit{m}}
\newcommand\kilo{\unit{k}}
\newcommand\mega{\unit{M}}
%
% Angle
\newcommand\radian{\unit{rad}}
\newcommand\degree{\unit{{}^\circ}}
%
% Time
\newcommand\second{\unit{s}}
%
% Distance
\newcommand\meter{\unit{m}}
\newcommand\inch{\unit{in}}
%
% Frequency
\newcommand\hertz{\unit{Hz}}
%
% Voltage
\newcommand\volt{\unit{V}}
\newcommand\V{\volt}
\newcommand\millivolt{\milli\volt}
\newcommand\mV{\milli\volt}
\newcommand\kilovolt{\kilo\volt}
\newcommand\kV{\kilo\volt}
%
% Current
\newcommand\ampere{\unit{A}}
\newcommand\A{\ampere}
\newcommand\milliampereA{\milli\ampere}
\newcommand\mA{\milli\ampere}
\newcommand\kiloampereA{\kilo\ampere}
\newcommand\kA{\kilo\ampere}
%
% Resistance
\newcommand\ohm{\Omega}
\newcommand\milliohm{\milli\ohm}
\newcommand\kiloohm{\kilo\ohm} % correct SI spelling
\newcommand\kilohm{\kilo\ohm} % "American" spelling used in siunitx
\newcommand\megaohm{\mega\ohm} % correct SI spelling
\newcommand\megohm{\mega\ohm} % "American" spelling used in siunitx
%
% Inductance
\newcommand\henry{\unit{H}}
\newcommand\H{\henry}
\newcommand\millihenry{\milli\henry}
\newcommand\mH{\milli\henry}
%
% Power
\newcommand\watt{\unit{W}}
\newcommand\W{\watt}
\newcommand\milliwatt{\milli\watt}
\newcommand\mW{\milli\watt}
\newcommand\kilowatt{\kilo\watt}
\newcommand\kW{\kilo\watt}
```
{raw-html}`</div>`
