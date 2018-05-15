% Tyler Bielinski
% 04/25/18
% speedDataAanalysis.m
% Script imports data from speedData.csv in a matrix M
% the data is plotted and then a best fit line is determined to model the 
% data
% The best fit line is plotted 
% note that we use built-in function fminsearch
% along with sfunct.m and sError.m

% set global data matrix to be used in speedError function
global M

% read in data
M = csvread('sData.csv');

% obtain vectors corresponding to columns of data matrix 
t = M(:,1);
sd = M(:,2);

% plot the data
figure(3)
plot(t,sd,'*r','MarkerSize',5)
hold on

% set some sample parameter values and 
g = [1.356 -.2111 .8];
a = g(1);
b = g(2);
c = g(3);
sg = sfunct(t,a,b,c);

% overlay model graph on top of data
plot(t,sg,'--g','LineWidth',3)
legend('data','guess')
title(['Sample model for speed y = (c).*(sin(a*t)) + b with parameters a = ', num2str(a), ' b = ', num2str(b), ' and c = ', num2str(c)])
xlabel('time (t)')
ylabel('speed (s)')

% compute and display error for the particular parameters 
e1 = sError(g);
disp(['Error in speed function for a = ',num2str(a),' b = ',num2str(b),' and c = ',num2str(c),' is err = ',num2str(e1)])

% minimize error function to obtain best fit parameters
X = fminsearch(@sError,g);
a = X(1);
b = X(2);
c = X(3);
% evaluate best fit model
s = sfunct(t,a,b,c);
% compute the best fit error
e2 = sError(X);
% display error 
disp(['Minimum error in speed function for  a = ',num2str(a),' b = ',num2str(b),' and c = ',num2str(c),' is err = ',num2str(e2)])
 
% plot the data
figure(4)
plot(t,sd,'*r','MarkerSize',5)
hold on

% over best fit model on top of data
plot(t,s,'-b','LineWidth',3)
legend('data','model')
title(['Data best linear fit for speed y = (c).*(sin(a*t)) + b with a = ', num2str(a), ' b = ', num2str(b),' and c = ', num2str(c)])
xlabel('time (t)')
ylabel('speed (s)')
