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

(*3. Write a function number_in_months that takes a list of dates and a list 
of months (i.e., an int list) and returns the number of dates in the list of 
dates that are in any of the months in the list of months.
Assume the list of months has no number repeated.
Hint: Use your answer to the previous problem. *) 
fun number_in_months (dates: (int*int*int)list, months: (int)list ) = 
    if null months
    then 0
    else  number_in_month(dates, (hd months)) 
          + number_in_months(dates, (tl months))

fun dates_in_month (dates: (int*int*int)list, month: int) =
    if null dates
    then []
    else
        if #2 (hd dates) = month 
        then (hd dates) :: dates_in_month((tl dates), month)
        else dates_in_month((tl dates), month) 

fun dates_in_months (dates: (int*int*int)list, months: (int)list) = 
    if null months
    then dates
    else 
         dates_in_month (dates, hd months) @ dates_in_months(dates, tl months)    

fun get_nth (words: string list, n: int) = 
    if n = 1
    then hd words
    else get_nth(tl words, n-1)

fun date_to_string (date: (int*int*int)) =
    let 
       val months = ["January", "February", "March", "April", "May", "June", 
        "July", "August", "September", "October", "November", "December"]
    in 
       get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date) 
    end

fun number_before_reaching_sum (sum: int, numbers: int list) = 
    if sum < 0
    then 0
    else 
        1 + number_before_reaching_sum(sum - hd numbers, tl numbers) 
  
fun what_month (day: int) = 
    let val day_list = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30 ,31]
    in  1 + number_before_reaching_sum(day, day_list)
    end 

