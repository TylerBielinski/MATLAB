% Tyler M Bielinski
% 04/25/18
% gData.m
% Script imports data from gData.csv in a matrix M
% the data is plotted and then a best fit line is determined to model the 
% data
% The best fit line is plotted 
% note that we use built-in function fminsearch
% along with gfunct.m and gError.m

% set global data matrix to be used in speedError function
global M

% read in data
M = csvread('gData.csv');

% obtain vectors corresponding to columns of data matrix 
t = M(:,1);
sd = M(:,2);

% plot the data
figure(1)
plot(t,sd,'*r','MarkerSize',5)
hold on

% set some sample parameter values and 
g = [1.8559 2.3043 0.046037 4 2 3 3];
a = g(1);
b = g(2);
c = g(3);
d = g(4);

sg = gfunct(t,a,b,c,d);

% overlay model graph on top of data
plot(t,sg,'--g','LineWidth',3)
legend('data','guess')
title(['Sample model for speed y = a.*t.^3 + b.*t.^2 + c.*t + d; with parameters a = ', num2str(a), ' b = ', num2str(b), ' c = ',num2str(c), ' and d = .',num2str(d)])
xlabel('time (t)')
ylabel('speed (s)')

% compute and display error for the particular parameters 
e1 = gError(g);
disp(['Error in speed function for a = ',num2str(a),' and b = ',num2str(b),' c = ',num2str(c),' and d = .',num2str(d),' is err = ',num2str(e1)])

% minimize error function to obtain best fit parameters
X = fminsearch(@gError,g);
a = X(1);
b = X(2);
c = X(3);
d = X(4);

% evaluate best fit model
s = gfunct(t,a,b,c,d);
% compute the best fit error
e2 = gError(X);
% display error 
disp(['Minimum error in speed function for  a = ',num2str(a),' , b = ',num2str(b),' c =',num2str(c),' and d = .',num2str(d),' is err = ',num2str(e2)])

% plot the data
figure(2)
plot(t,sd,'*r','MarkerSize',5)
hold on

% over best fit model on top of data
plot(t,s,'-b','LineWidth',3)
legend('data','model')
title(['Data best fit for speed y = a.*t.^3 + b.*t.^2 + c.*t + d with a = ', num2str(a), ' b = ', num2str(b),' c =',num2str(c),' and d = .',num2str(d)])
xlabel('time (t)')
ylabel('speed (s)')
