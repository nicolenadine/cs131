#!/usr/bin/awk -f

BEGIN {
  min = "none"
}

NR > 1 {  # skip col header
    if ($col_num ~ /^[0-9]+(\.[0-9]+)?$/){
       if($col_num < min || min == "none") {
            min = $col_num
       }
    }    
}

END {
    if (min == "non") {
        print "no data"
    } else {
        print "Minimum value of column " col_num " is: " min

    }
}
