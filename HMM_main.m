clc;
clear;

format long;
%{
pi = [0.5;0.5];
A = [0.8, 0.2; 
    0.2, 0.8];
B = [0.4 0.1 0.4 0.1; 
    0.1 0.4 0.1 0.4];
O = [2; 3; 4; 2; 1; 3];
%}


%pi = [0.21; 0.12; 0.67];
%pi = [0.23; 0.53; 0.24];
%pi = [0.3; 0.4; 0.3];
pi = [0.26; 0.17; 0.57];
A = [0.4 0.3 0.3;
    0.2 0.7 0.1;
    0.3 0.2 0.5];
B = [0.5 0.2 0.2 0.1;
    0.1 0.6 0.2 0.1;
    0.4 0.1 0.2 0.3];
O = [2 1 1 3 4 2];

[po_f, alpha] = HMM_forward(pi, A, B, O);
[po_b, beta] = HMM_backward(pi, A, B, O);
[p_star, q_star, delta, phi] = HMM_viterbi(pi, A, B, O);

display(po_f);
display(alpha);
display(po_b);
display(beta);
display(p_star);
display(q_star);
display(delta);
display(phi);


[pi_best, A_best, B_best] = HMM_EM(pi, A, B, O);
display(pi_best);
display(A_best);
display(B_best);

[pi_best, A_best, B_best] = HMM_EM(pi_best, A_best, B_best, O);
display(pi_best);
display(A_best);
display(B_best);