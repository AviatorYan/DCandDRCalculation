%get deceleration capacity of rate 
%
%(c) chenjx 2014-10
%
function [ ret ] = c_getDC( filename )

    IBIm = c_readIBIData(filename);
    len = length(IBIm);

    tp = zeros(1,len);
    DCm.data = IBIm;
    DCm.type = tp;
    
    %mark the DC point and AC point
    DCm = c_markDCandACPoint(DCm,len);
    
    %confirm and calculate the Heart Rate Segment
    HRSegment = 30;
    n = HRSegment/2;
    k = 1;
    segmentData = zeros(length(DCm.data/2),HRSegment);
    xmean = zeros(1,HRSegment);
    
    while( (n+15) < length(DCm.data) )

        if(DCm.type(n) == 0)
            segmentData(k,:) = DCm.data((n-14):(n+15));
            k = k + 1;
        end
        n = n + 1;
    end 
    
    xmean = mean(segmentData);
    
    n = HRSegment/2;
    x0 = xmean(n);
    x1 = xmean(n+1);
    xn1 = xmean(n-1);
    xn2 = xmean(n-2);
    
    DCValue = ( x0 + x1 - xn1 - xn2 )/4;
    
    ret = DCValue;

end

