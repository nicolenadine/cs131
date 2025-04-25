#!/usr/bin/awk -f

BEGIN {

}

NR > 1 {  # skip col header
    if ($col_num ~ /^[0-9]+(\.[0-9]+)?/) {
        sum += $col_num
        count++
    }
}

END {
    if (count > 0) {
        average = sum / count
        print "Average of column " col_num " is: " average
    } else {
        print "No data found"
    }
}
