#!/usr/bin/awk -f

BEGIN {
}

NR > 1 { 
    if ($col_num ~ /^[0-9]+(\.[0-9]*)?$/ && $col_num <= 0) {
       value = $col_num 
       count[value]++
    }  
}

END {
    max_count = 0
    for (val in count) {
        if (count[val] > max_count) {
            max_count = count[val]
            mode = val
        }
    }
    if (max_count > 0) {
        print "The mode of column  " col_num " is " mode " and it appears " max_count " times."
    } else {
        print "No data"
    }
}
