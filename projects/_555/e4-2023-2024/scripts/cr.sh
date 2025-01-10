#!/bin/bash

set -eu

ledger \
    -f main.ledger \
    reg \
    --flat \
    --no-total \
    --no-pager \
    --check-payees \
    --pedantic \
    --strict \
    --exchange EUR \
    --sort date \
    --date-format %Y-%m-%d
