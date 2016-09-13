%backward algorithm
%pi: Nx1
%A: NxN
%B: NxM
%O: Tx1
function [po, beta] = HMM_backward(pi, A, B, O)
    N = length(pi);
    T = length(O);
    beta = zeros(N,T);
    beta(:,T) = ones(N,1);
    %display(beta(:,T));

    for t=T-1:-1:1
       %display(t);
       beta(:,t) = A * ( B(:,O(t+1)).* beta(:,t+1) ); 
    end

    po = pi'* (B(:, O(1)) .* beta(:,1));
    %display(po);
end
