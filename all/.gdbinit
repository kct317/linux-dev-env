#set auto-load safe-path ~/development/APTradingSystem

# break before fork
define bbf
b process/process_manager.cpp:292
end

define ffmc
set follow-fork-mode child
end

define ffmp
set follow-fork-mode parent
end

#set target-async 1
#set pagination off

define ns
set non-stop on
end

set print pretty on
end

set print object on
end

set print vtbl on
end

source ~/.bin/peda/peda.py
