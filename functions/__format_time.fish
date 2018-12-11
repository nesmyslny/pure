function _pure_format_time -d "Format milliseconds to a human readable format"
    set --local milliseconds $argv[1]
    set --local seconds (math -s0 "$milliseconds / 1000 % 60")
    set --local minutes (math -s0 "$milliseconds / 60000 % 60")
    set --local hours (math -s0 "$milliseconds / 3600000 % 24")
    set --local days (math -s0 "$milliseconds / 86400000")
    set --local time
    set --local threshold $argv[2]

    if test $days -gt 0
        set time (printf "$time%sd " $days)
    end

    if test $hours -gt 0
        set time (printf "$time%sh " $hours)
    end

    if test $minutes -gt 0
        set time (printf "$time%sm " $minutes)
    end

    if test $seconds -gt $threshold
        set time (printf "$time%ss " $seconds)
    end

    echo -e $time
end