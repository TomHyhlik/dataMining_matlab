function prvniFunkce(cnt_row, cnt_column)

    disp('moje prvni funkce')
   
    matice = zeros(cnt_row, cnt_column)

    for i=1:cnt_row
        for j=1:cnt_column
            if mod(j+i, 2)
                matice(i,j) = 1
            end
        end
    end

    
    
    
end