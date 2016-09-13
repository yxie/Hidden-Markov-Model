%viterbi algorithm
%pi: Nx1
%A: NxT
%B: NxM
%O: Tx1
function [p_star, q_star, delta, phi] = HMM_viterbi(pi, A, B, O)
    N = length(pi);
    T = length(O);
    delta = zeros(N,T);
    phi = zeros(N,T);

    delta(:,1) = pi .* B(:, O(1));
    phi(:,1) = 0;

    %display(delta(:,1));
    %display(phi(:,1));

    for t = 2:T
        for n = 1:N
            [delta(n,t),  phi(n,t)] = max( delta(:,(t-1)) .* A(:,n) );
            delta(n,t)=  delta(n,t) * B(n, O(t)); 
        end
        %display(delta(:,t));
        %display(phi(:,t));
    end

    q_star = zeros(T,1);
    [p_star, q_star(T)] = max(delta(:,T));
    %display(p_star);

    for t = T-1:-1:1
       q_star(t) = phi(q_star(t+1), t+1);
    end

    %display(q_star);
end