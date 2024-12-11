.PHONY: all validate reports clean fx-rates help month-end

# Default target
all: validate reports

validate:
	@echo "Checking ledger file..."
	ledger -f main.ledger --strict --pedantic --check-payees --explicit --no-pager -X EUR balance >/dev/null
	@echo "Ledger file is valid!"

reports: output/balance-sheet.txt \
         output/income-statement.txt \
         output/vat-report.txt \
         output/trial-balance.txt \
         output/accounts.txt \
         output/register.txt

clean:
	@echo "Cleaning generated reports..."
	@rm -rf output/*
	@rm -rf output

fx-rates:
	@echo "Updating FX rates..."
	@ruby scripts/get-fx.rb

help:
	@echo "Available targets:"
	@echo "  all            - Run checks and generate all reports"
	@echo "  check          - Validate ledger files"
	@echo "  test           - Run ledger tests"
	@echo "  reports        - Generate all reports"
	@echo "  fx-rates       - Update FX rates"
	@echo "  month-end      - Run month-end closing checklist"
	@echo "  clean          - Remove generated reports"
	@echo "  help           - Show this help message"

# Monthly closing checklist
month-end: check
	@echo "Running month-end closing process..."
	@for account in "^Actifs:Banques" "^Actifs:Clients" "^Dettes:Fournisseurs" "^Dettes:Etat:TVA"; do \
		ledger -f main.ledger --strict --pedantic --check-payees --explicit --no-pager -X EUR balance --period "this month" $$account; \
	done

# Pattern rule for generating reports
output/%.txt:
	@mkdir -p output
	@echo "Generating $*..."
	@case $* in \
		balance-sheet) \
			ledger -f main.ledger --strict --pedantic --check-payees --explicit --no-pager -X EUR -p "from 2023-10-01 to 2024-09-30" -f reports/balance-sheet.ledger \
				balance ^Actifs ^Dettes ^CapitauxPropre ;; \
		income-statement) \
			ledger -f main.ledger --strict --pedantic --check-payees --explicit --no-pager -X EUR -p "from 2023-10-01 to 2024-09-30" balance ^Produits ^Charges ;; \
		vat-report) \
			ledger -f main.ledger --strict --pedantic --check-payees --explicit --no-pager -X EUR -f reports/vat-report.ledger balance ;; \
		trial-balance) \
			ledger -f main.ledger --strict --pedantic --check-payees --explicit --no-pager -X EUR balance ;; \
		accounts) \
			ledger -f main.ledger --strict --pedantic --check-payees --explicit --no-pager -X EUR accounts ;; \
		register) \
			ledger -f main.ledger --strict --pedantic --check-payees --explicit --no-pager -X EUR register ;; \
	esac > $@


