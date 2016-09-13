%EM algorithm for parameter estimation
%pi: Nx1
%A: NxN
%B: NxM
%O: Tx1
function [pi_best, A_best, B_best] = HMM_EM(pi, A, B, O)
    N = length(pi);
    M = size(B,2);
    T = length(O);
    [po_f, alpha] = HMM_forward(pi, A, B, O);
    [po_b, beta] = HMM_backward(pi, A, B, O);
    assert(abs(po_f - po_b) < 0.00001);
    gamma = zeros(N,T);
    xi = zeros(N,N,T-1);
    
    for i=1:N
        for t=1:T
            gamma(i,t) = alpha(i,t) * beta(i,t) / (alpha(:,t)'*beta(:,t)) ;
        end
    end
    
    for i=1:N
        for j=1:N
            for t=1:T-1
                xi(i,j,t) = alpha(i,t) * A(i,j) * B(j, O(t+1)) * beta(j, t+1) / po_f;
            end
        end
    end
    
    display(gamma);
    display(xi);
    
    A_best = A;
    B_best = B;
    pi_best = gamma(:, 1);
    for i=1:N
        for j=1:N
            A_best(i,j) = sum( xi(i,j,:) )/ sum( gamma(i,1:(T-1)) ); %gamma from 1 to T-1
        end
    end
    
    for j=1:N
        for k=1:M
            temp = 0.0;
            for t=1:T
               if O(t) == k
                   temp = temp + gamma(j,t);
               end
            end
            B_best(j,k) = temp / sum(gamma(j,:));
        end
    end
end