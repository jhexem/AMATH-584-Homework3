function [u, s, v] = LRsvd(X, Y)

    [Qkx, Rkx, Px] = qr(X, "econ");
    [Qky, Rky, Py] = qr(Y, "econ");

    B = (Rkx * Px') * conj(Rky * Py')';

    [Ub, s, Vb] = svd(B);

    u = Qkx * Ub;
    v = Qky * Vb;

end