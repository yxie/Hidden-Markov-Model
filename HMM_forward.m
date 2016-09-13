%forward algorithm
%pi: Nx1
%A: NxN
%B: NxM
%O: Tx1
function [po, alpha] = HMM_forward(pi, A, B, O)
    N = length(pi);
    T = length(O);

    alpha = zeros(N,T);
    alpha(:,1) = pi .* B(:,O(1));
    %display(alpha(:,1));


    for t=2:T
       for j=1:N
          alpha(j,t) = alpha(:,t-1)' * A(:,j) * B(j, O(t)); 
       end
    end

    po = sum(alpha(:,T));
    %display(po);
end