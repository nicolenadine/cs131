#!/usr/bin/awk -f

BEGIN {
  max = "none"
}

NR > 1 {  # skip col header
    if ($col_num ~ /^[0-9]+(\.[0-9]+)?$/){
        if($col_num > max  || max == "none") {
            max = $col_num
        }
    }
}

END {
    if (max == "non") {
        print "no data"
    } else {
        print "Maximum value of column " col_num " is: " max

    }
}
