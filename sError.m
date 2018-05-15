% Jason M Graham
% 03/14/2018

function e = sError(x)
  % Function that inputs values for
  % parameters in contained in a vector X
  % and returns error of model compared against data
  % Note that this calls function linearSpeed which contains
  % a linear model for data.  

  % use global data matrix
  global M

  % obtain data vectors  
  tdata = M(:,1);
  sdata = M(:,2);
  
  % parameters
  a = x(1);
  b = x(2);
  c = x(3);
  
  % evaluate function form to compare against data
  s = sfunct(tdata,a,b,c);
  
  % compute the error by comparing model with data
  e = norm(sdata - s).^2;
  
end
