fun is_older (x:int*int*int, y:int*int*int) =
    if (#1 x) > (#2 y)
    then false
    else 
	if (#1 x) = (#2 y)
        then
	    if (#2 x) > (#2 y)
            then false 
            else 
                if (#2 x) = (#2 y)
                then 
                    (#3 x) < (#3 y)
                else (#2 x) < (#2 y)
        else true 
