%get Heart Rate Deceleration Runs,DRs
%
%(c) chenjx 2014-10
%
function [ ret ] = c_getDRs( filename )

    IBIm = c_readIBIData(filename);
    len = length(IBIm);

    tp = zeros(1,len);
    DCm.data = IBIm;
    DCm.type = tp;
    
    %mark the DC point and AC point
    DCm = c_markDCandACPoint(DCm,len);
    
    %lenDCm means N 
    lenDCm = length(DCm.type);
    DRm = zeros(1,lenDCm);
    flag0 = 0;
    n = 1;
    % note that DRm appear -1 value
    while( n < lenDCm - 1 )
        while( DCm.type(n) == 0 )
            flag0 = flag0 + 1;
            n = n + 1;
        end
        if( DCm.type(n) == 1 )
            k = n - 1;
            DRm(k) = flag0 - 1;
        end
        n = n + 1;
        flag0 = 0;
    end
    
    lenDRm = length(DRm);
    DR1 = length(find(DRm==1))/lenDRm;
    DR2 = length(find(DRm==2))/lenDRm;
    DR3 = length(find(DRm==3))/lenDRm;
    DR4 = length(find(DRm==4))/lenDRm;
    DR5 = length(find(DRm==5))/lenDRm;
    DR6 = length(find(DRm==6))/lenDRm;
    DR7 = length(find(DRm==7))/lenDRm;
    DR8 = length(find(DRm==8))/lenDRm;
    DR9 = length(find(DRm==9))/lenDRm;
    DR10 = length(find(DRm==10))/lenDRm;
    
    ret = [DR1,DR2,DR3,DR4,DR5,DR6,DR7,DR8,DR9,DR10];

end

