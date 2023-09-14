%{
    Programmer:    Sai Narayan
    Assessment:    Final Project - Part 1
    Date:          11 November 2022
    Description:   Function cgs2 that implements classical Gram-Schmidt 
                   with reorthogonalization. 

    Integrity Statement: I have completed this work with integrity. 
    -- Sai Narayan 
       (ssn5137)
%}         

clc, clear, close all

%6 X 5 - Läuchli Matrix
X=[ones(1,5);
   sqrt(eps)*eye(5)];
fprintf('Problem 1\n')
[Q,R] = cgs2(X);
fprintf('Q = \n'); 
disp(Q)
fprintf('R = \n'); 
disp(R)
fprintf('|X-QR|_2 = '); 
disp(norm(X-Q*R))
fprintf('||I_5-Q^t*Q||_2 = '); 
disp(norm(eye(5)-Q'*Q))

%Problem 1
d=0.5*log(2);
h=d/10;
x=(0:h:d)';
b=exp(x);
V=vander(x);
X=V(:,6:11);

%Problem 2
fprintf('Problem 2 \n')
[Q,R] = cgs2(X)
fprintf('Q = \n');
disp(Q)
fprintf('R = \n')
disp(R)
a=inv(R)*Q'*b;
fprintf('Least square coeffs = \n')
disp(a)


% Problem 3
xx=(0:d/100:d)';
yy=polyval(a,xx);
yexact=exp(xx);
err=yexact-yy;
err_norm=norm(err,inf);
fprintf('err norm = '); disp(err_norm)


%Graph
plot(xx,err)
xlabel('X')
ylabel('Error')
title('X vs Err')
grid on