% M-file for EE323 LAB
% date : 07/17/2002
% Function for saving data in a MAT file 
%          bdctorq('filename', var1, var2)
% 'filename' can be 'TM1.mat' but you need to put the single quote
%  var1 is saved as position 
%  var2 is saved as torque


function [] = bdctorq(u,position,torque)
torqdata1 = torque;
[position,i] = sort(position);

for mm = 1:length(position)
    index_data = i(mm);
    torque(mm) = torqdata1(index_data);
end
save (u, 'position', 'torque','-MAT');
end