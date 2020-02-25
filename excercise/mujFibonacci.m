function out = mujFibonacci(N)

    disp("Muj fibonacci")

    array = ones(1, N)
    for i=3:N
        array(i) = array(i-1) + array(i-2)
    end

    fprintf("counted value: %d\n", array(N))
    fprintf("true value: %d\n", fibonacci(N))
    
end