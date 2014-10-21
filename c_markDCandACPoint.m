%mark the DC point and AC point
%
%(c) chenjx 2014-10
%
function [ ret ] = c_markDCandACPoint( DCm, len )

    i = 2;
    while(len > 0)
        j = i - 1;
        diffv = DCm.data(1,i) - DCm.data(1,j);
        if( (abs(diffv) / DCm.data(1,j)) > 0.05 )
            DCm.data(i) = [];
            DCm.type(i) = [];
            len = len - 1;
        else
            % 0 means deceleration point, 1 means acceleration point
            if(diffv > 0)
                DCm.type(i) = 0;
            else
                DCm.type(i) = 1;
            end
        end
        i = i + 1;
        len = len - 1;
    end
    
    ret = DCm;

end

