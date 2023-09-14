%{
    Programmer:    Sai Narayan
    Assessment:    Final Project - Part 1
    Date:          11 November 2022
    Description:   Cgs2 Function

    Integrity Statement: I have completed this work with integrity. 
                        -- Sai Narayan 
                          (ssn5137)
%}  

function [Q,R] = cgs2(X)
[m,n] = size(X);
Q = zeros(m,n); 
R=zeros(n,n);

R(1,1) = norm(X(:,1));
Q(:,1) = X(:,1)/R(1,1);

for k = 2:n
      s = Q(:,1:k-1)' * X(:,k);
      y = X(:,k)-Q(:,1:k-1) * s; dv = Q(:,1:k-1)' * y;
      y = y - Q(:,1:k-1) * dv;
      R(1:k-1,k) = s + dv; R(k,k) = norm(y);
      Q(:,k) = y/R(k,k);
   end
end