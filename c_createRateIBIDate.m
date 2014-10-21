%create random data to txt file for test
%
%(c) chenjx 2014-10
%

N = 800;
M = 900;

IBIfid = fopen('C:\Users\asdf\Desktop\DecelerationCapacityofRate\data\IBIData.txt','a+');

for i=1:10000
	r = round(rand(1)*(N-M)) + M;
    fprintf(IBIfid,'%s',[num2str(r),',']);
end

fclose(IBIfid);