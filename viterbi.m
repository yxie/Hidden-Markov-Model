clc;
clear;

pi = [0.5;
      0.5];
A = [0.8, 0.2; 
     0.2, 0.8];
B = [0.4 0.1 0.4 0.1; 
     0.1 0.4 0.1 0.4];

N=2;
T=6;

O = [2; 3; 4; 2; 1; 3];


%{
A = [0.4 0.3 0.3;
    0.2 0.7 0.1;
    0.3 0.2 0.5];

B = [0.5 0.2 0.2 0.1;
    0.1 0.6 0.2 0.1;
    0.4 0.1 0.2 0.3];

pi = [0.3;
      0.4;
      0.3];

N = 3;
T = 6;
O = [2;1;1;3;4;2];
%}



delta = zeros(N,T);
phi = zeros(N,T);

delta(:,1) = pi .* B(:, O(1));
phi(:,1) = 0;

display(delta(:,1));
display(phi(:,1));

for t = 2:T
    for n = 1:N
        [delta(n,t),  phi(n,t)] = max( delta(:,(t-1)) .* A(:,n) );
        delta(n,t)=  delta(n,t) * B(n, O(t)); 
    end
    display(delta(:,t));
    display(phi(:,t));
end

q_star = zeros(T,1);
[p_star, q_star(T)] = max(delta(:,T));
display(p_star);

for t = T-1:-1:1
   q_star(t) = phi(q_star(t+1), t+1);
end

display(q_star);