function report = normalniRozdeleni(variable)
    
    alpha = 0.05;
    [h,p]=swtest(variable, alpha); 

    if h == 0
        report = "ANO"
%         fprintf("ANO\n")
    else
        report = "NE"
%         fprintf("NE\n")
    end

end