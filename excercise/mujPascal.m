function out = mujPascal(N)

    matrix = ones(N)

    for i=2:N
        for j=2:N
    
            matrix(i,j) = matrix(i,j-1) + matrix(i-1, j)

        end
    end

    fprintf("counted value: %d\n", matrix(N,N))
    fprintf("true value: %d\n", pascal(N))

end