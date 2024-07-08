function [moy] = paramave(g, tet1, gen)

for r = 1:length(gen.res)

    concat = [];

    for dataset = 1:2
        
        field = num2str(dataset);
        m = M.(field);
        temp = m{r};
        concat = cat(3, concat, temp);              
        
    end % dataset = 1:2
    
    moy{r} = mean(concat,3)

end % r = 1:length(gen.res)

end % function
