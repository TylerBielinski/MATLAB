function y = gfunct(t,a,b,c,d,f,h,i)
  
  
 %y = a*sin(t) + t;
 %y = (c).*(t).^a + b ;
 %y = t + exp(a*t) .* sin(b*t);
 %y = a.*t.^2 + b.*t + c;
 y = a.*t.^3 + b.*t.^2 + c.*t + d; %this function provided the least amount of error
 %y = a.*t.^6 + b.*t.^5 + c.*t.^4 + d.*t.^3 + f.*t.^2 + h.*t + i;
 %y = c.*t.^4 + d.*t.^3 + f.*t.^2 + h.*t + i;
 %y = b.*t.^5 + c.*t.^4 + d.*t.^3 + f.*t.^2 + h.*t + i;
 %y = .02*t.^a + b;  

  
end