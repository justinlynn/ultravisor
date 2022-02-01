source ./ultra.tcl

proc console_trigger {response args} {
    array set triginfo $args
    set sim $triginfo(sim)
    $sim trigger clear console $triginfo(match)

    puts "console trigger: putting $response to console"
    $sim console create input in string $response
}

mysim trigger set console "Welcome to Petitboot" { console_trigger "x" }
mysim trigger set console "# "  { console_trigger "halt\n" }
mysim go
exit
