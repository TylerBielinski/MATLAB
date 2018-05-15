% Tyler M Bielinski
% 03/14/2018

function e = gError(x) 

  % use global data matrix
  global M

  % obtain data vectors  
  tdata = M(:,1);
  sdata = M(:,2);
  
  % parameters
  a = x(1);
  b = x(2);
  c = x(3);
  d = x(4);
  f = x(5);
  h = x(6);
  i = x(7);
  
  % evaluate function form to compare against data
  s = gfunct(tdata,a,b,c,d,f,h,i);
  
  % compute the error by comparing model with data
  e = norm(sdata - s).^2;
  
end
