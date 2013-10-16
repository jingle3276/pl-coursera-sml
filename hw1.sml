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

(*Write a function number_in_month that takes a list of dates and a month 
(i.e., an int) and returns how many dates in the list are in the given month. *)
fun number_in_month (dates: (int*int*int) list, month: int ) = 
    if null dates 
    then 0
    else 
	if #2 (hd dates) = month
        then 1 + number_in_month(tl(dates), month)
        else number_in_month(tl(dates), month)
 
