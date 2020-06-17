" vim Clap bindings
let g:clap_provider_quick_open = {
    \'source': s:s:transaction_lines(),
    \'sink': function("s:s:insert_transaction")
    \}
