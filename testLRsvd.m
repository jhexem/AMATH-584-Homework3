m = 2048;
k = 50;

X = rand(m, k);
Y = rand(m, k);

A = X * conj(Y)';
[u, s, v] = LRsvd(X, Y);

E = A - (u * s * conj(v)');

Error = norm(E) / norm(A)

mySVDtimes = zeros(1, 7);
SVDtimes = zeros(1, 7);
xaxis = zeros(1, 7);

for j = 6:12
    m = 2^j;
    xaxis(j-5) = j;

    X = rand(m, k);
    Y = rand(m, k);
    
    t1 = tic;
    [u, s, v] = LRsvd(X, Y);
    mySVDtimes(j-5) = toc(t1);

    t2 = tic;
    A = X * conj(Y)';
    [U, S, V] = svd(A);
    SVDtimes(j-5) = toc(t2);

end

semilogy(xaxis, mySVDtimes, "LineWidth", 2)
hold on;
semilogy(xaxis, SVDtimes, "LineWidth", 2)
hold off;
title("Skinny SVD vs Standard SVD Times")
legend("LRsvd", "SVD")
xlabel("Size of mxm A where m=2^j")
ylabel("Time")