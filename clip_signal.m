function [p,v] = clip_signal(P,V, maxvel,maxacc, kpos,kvel)

p = zeros(size(P));
v = zeros(size(V));
for i = 2:length(P)-1
    errpos = P(i) - p(i);
    errvel = V(i) - v(i);
   
    dp1 = kpos*errpos + kvel*errvel;
    
    dv1 = dp1 - v(i);
    if (dv1 > maxacc)
        dv1 = maxacc;
    elseif (dv1 < -maxacc)
        dv1 = -maxacc;
    end
    
    v1 = v(i) + dv1;
    if (v1 > maxvel)
        v1 = maxvel;
    elseif (v1 < -maxvel)
        v1 = -maxvel;
    end
    
    v(i+1) = v1;
    p(i+1) = p(i) + v1;
end

    
    

