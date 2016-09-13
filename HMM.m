%forward algorithm
pi = [0.5;0.5];
A = [0.8, 0.2; 0.2, 0.8];
B = [0.4 0.1 0.4 0.1; 0.1 0.4 0.1 0.4];

N=2;
T=6;

x = [2; 3; 4; 2; 1; 3];

alpha = zeros(N,T);
alpha(:,1) = pi .* B(:,x(1));
display(alpha(:,1));

for t=2:T
   alpha(:,t) = (A * alpha(:,t-1)) .* B(:, x(t));  
   display(alpha(:,t));
end

po = sum(alpha(:,T));
display(po);

%backward algorithm
beta = zeros(N,T);
beta(:,T) = [1;1];
display(beta(:,T));

for t=T-1:-1:1
   beta(:,t) = A * (B(:,x(t+1)) .* beta(:,t+1)); 
   display(beta(:,t));
end

po2 = pi'* (B(:, x(1)) .* beta(:,1));
display(po2);

%The probability of being at state 1 at time t
p_s1 = zeros(T,1);
for t=1:T
   p_s1(t) = beta(1,t) * alpha(1,t) / (beta(:,t)'*alpha(:,t));
end
display(p_s1);

