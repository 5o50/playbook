#!/bin/bash

set -eu

join_by() {
    local IFS="$1"  # Set the delimiter
    shift           # Shift to get to the elements
    echo "$*"         # Print all elements joined by the delimiter
}

accs_opposited=(
            "^Capitaux"
            # "^Immobilisations:Amortissements"
            # "^Tiers:OrganismesSociaux"
            # "Tiers:GroupeEtAssociés"
            #"RabaisRemisesRistournesObtenusSurAchats"    
            #"Charges:AutresServicesExtérieurs:RémDIntermédiairesEtHonoraires:CommsEtCourtagesSurVentes"
            "^Produits"
            )

joined_accs_opposited=$(join_by "|" "${accs_opposited[@]}")

# balance format
# modify balance format to better reflect what is happenning economically
# default %(ansify_if(justify(scrub(display_total), 20, 20 + int(prepend_width), true, color), bold if should_bold)) %(!options.flat ? depth_spacer : "") %-(ansify_if(ansify_if(partial_account(options.flat), blue if color), bold if should_bold)) \n%/%$1\n%/%(prepend_width ? " " * int(prepend_width) : "")--------------------\n
balance_format='%(ansify_if(justify(scrub(display_total * (account =~ /'
balance_format+=$joined_accs_opposited
balance_format+='/ ? -1 : 1)), 20, 20 + int(prepend_width), true, color), bold if should_bold)) %(!options.flat ? depth_spacer : "") %-(ansify_if(ansify_if(partial_account(options.flat), blue if color), bold if should_bold)) \n%/%$1\n%/%(prepend_width ? " " * int(prepend_width) : "")--------------------\n'
#echo "$balance_format"

# register format
# modify register format to better reflect what is happening economically
# default %(ansify_if(ansify_if(justify(format_date(date), int(date_width)), green if color and date > today), bold if should_bold)) %(ansify_if(ansify_if(justify(truncated(payee, int(payee_width)), int(payee_width)), bold if color and !cleared and actual), bold if should_bold)) %(ansify_if(ansify_if(justify(truncated(display_account, int(account_width), int(abbrev_len)), int(account_width)), blue if color), bold if should_bold)) %(ansify_if(justify(scrub(display_amount), int(amount_width), 3 + int(meta_width) + int(date_width) + int(payee_width) + int(account_width) + int(amount_width) + int(prepend_width), true, color), bold if should_bold)) %(ansify_if(justify(scrub(display_total), int(total_width), 4 + int(meta_width) + int(date_width) + int(payee_width) + int(account_width) + int(amount_width) + int(total_width) + int(prepend_width), true, color), bold if should_bold))\n%/ %(justify(" ", int(date_width))) %(ansify_if(justify(truncated(has_tag("Payee") ? payee : " ", int(payee_width)), int(payee_width)), bold if should_bold)) %$3 %$4 %$5\n
register_format='%(ansify_if(ansify_if(justify(format_date(date), int(date_width)), green if color and date > today), bold if should_bold)) %(ansify_if(ansify_if(justify(truncated(payee, int(payee_width)), int(payee_width)), bold if color and !cleared and actual), bold if should_bold)) %(ansify_if(ansify_if(justify(truncated(display_account, int(account_width), int(abbrev_len)), int(account_width)), blue if color), bold if should_bold)) %(ansify_if(justify(scrub(display_amount * (account =~ '
register_format+=$joined_accs_opposited
register_format+=' ? -1 : 1)), int(amount_width), 3 + int(meta_width) + int(date_width) + int(payee_width) + int(account_width) + int(amount_width) + int(prepend_width), true, color), bold if should_bold)) %(ansify_if(justify(scrub(display_total), int(total_width), 4 + int(meta_width) + int(date_width) + int(payee_width) + int(account_width) + int(amount_width) + int(total_width) + int(prepend_width), true, color), bold if should_bold))\n%/ %(justify(" ", int(date_width))) %(ansify_if(justify(truncated(has_tag("Payee") ? payee : " ", int(payee_width)), int(payee_width)), bold if should_bold)) %$3 %$4 %$5\n'
#echo "$register_format"


ledger \
    bal \
    --file main.ledger \
    --no-pager \
    --no-total \
    --pedantic \
    --check-payees \
    --exchange EUR \
    --sort date \
    --date-format %Y-%m-%d \
    --balance-format "$balance_format" \
    $*

# https://ledger-cli.org/docs.html

