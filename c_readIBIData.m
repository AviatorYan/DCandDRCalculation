%read data from txt file 
%
%(c) chenjx 2014-10
%
function [ ret ] = c_readIBIData( filepath )

ret = dlmread( filepath ,',' );

end

