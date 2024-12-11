# Plain Text Accounting
http://plaintextaccounting.org/

## Caveats
http://plaintextaccounting.org/plaintext-accounting-errors.html

```
ledger -f life.journal -s bal -X €
```

## Reference
https://devhints.io/ledger
http://plaintextaccounting.org/quickref/
https://www.ledger-cli.org/
http://hledger.org/hledger.html

## In Depth
https://p.epij.nl/ledger-cli/accounting/2018/08/23/real-world-ledger-part-1/
http://olivercardoza.com/2016/06/18/the-path-to-ledger.html
https://blog.johncs.com/posts/accounting-reimbursements.htm
https://alexrecker.com/our-new-sid-meiers-civilization-inspired-budget/
https://github.com/apauley/hledger-flow

## Currency
https://memo.barrucadu.co.uk/currency-conversion.html

## Viz / Graphs
https://kndrck.co/posts/ledger-analytics/

## Methodology
The sum of all of those values is the total value of your assets. Your goal should be to continually increase your assets.

Next, you can look at your liabilities, which should be everything you owe. Here are some common liability categories:

The sum of all of the money you owe is your liabilities. As you start to pay down your debt, your total liabilities will decrease.

The difference between your assets and your liabilities is your net worth.
You can start to increase your net worth by decreasing your liabilities, increasing your assets, or by doing both! 

Make sure you continuously update your balance sheet—at least twice per year—to ensure that you are meeting all of your financial goals. 

```
Assets

	Cash
		Boursorama
			Checkings
			Livret A
		First Republic
			Checkings
		BNP
			Checkings
			Livret A
		Bank National
			Checkings

	Investments
		Robinhood
			Cash
			MRAM
		Coinbase

	Home Value (the resale value of your home)

	Auto Value (the resale value of your car)

	Personal Property (resale value of jewelry, household items, etc)

	Other Assets

Liabilities
	Remaining mortgage balance

	Car loans

	Student loans

	Any other personal loans

	Credit card balances
```

; Asset = Equity + (Income - Expense) + Liability
;
; assets (owned)
; liability (owed)
; equity (invested)
; receivables (people owes you)
; income (inflows)
; expenses (outflows)
;
;Transactions
;	debits
;		+ assets / expenses accounts
;		- liability / equity accounts
;
;	credits
;		- assets / expenses accounts
;		+ liabilities / equity accounts
;
; MRAM
; (18.32 *1800 + 1200*7.69)/3000
; $9,228
; 14.068
;
; https://devhints.io/ledger
;
; ledger -f life.journal bal -X €
; ledger -f life.journal bal -X € -U
; ledger -f life.journal bal -X € -C
;
; GENERATE FX RATES
; https://github.com/benwebber/ledger-fx-rates
; ledger-fx-rates >> db/fx-rates.dat
; include fx-rates.dat