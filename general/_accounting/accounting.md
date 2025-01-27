# Accounting

http://plaintextaccounting.org/
https://devhints.io/ledger
ui: https://paisa.fyi/
price fetcher: https://gitlab.com/chrisberkhout/pricehist

https://ledger-cli.org/docs.html

```
pricehist fetch ecb EUR/USD -s 2024-01-20 -e 2024-01-20 -o ledger
```
Dans ledger les actifs doivent apparaitre avec un signe positif
ainsi pour les contrebalancer les passifs doivent etre ecris avec un signe négatif (multiplier par -1 la valeur).
L'affichage correct sera gérer sur .ledgerrc


```
(ce n'est pas equivalent a une réductionde 20% mais une réduction de 16.67%)
HT = TTC / 1.20  <=> HT = TTC * (5/6)
TVA = TTC / 6    <=> TVA = TTC * (1/6)
TTC = HT * 1.20  <=> TTC = HT + (HT * 20%)
```

## Methodology
Your goal should be to continually increase your assets.
The sum of all of the money you owe is your liabilities. 
As you start to pay down your debt, your total liabilities will decrease.
The difference between your assets and your liabilities is your net worth.
You can start to increase your net worth by decreasing your liabilities, increasing your assets, or by doing both!

Débit : Représente une augmentation d'un actif ou une diminution d'un passif.
Pour enregistrer un débit utilisez le nom du compte suivi d'un montant positif.

Crédit : Représente une diminution d'un actif ou une augmentation d'un passif. 
Pour enregistrer un crédit utilisez le nom du compte suivi d'un montant négatif.

assets (owned)
receivables (people owes you)
expenses (outflows)
liability (owed)
equity (invested)
income (inflows)

Actif = Capitaux Propres + Dettes

Asset = Equity + (Income - Expense) + Liability
Asset + Expenses = Equity + Income + Liability


Actifs et Charges sont des comptes de débit: augmentent avec des montants positifs
Capitaux Propres, Dettes et Produits sont des comptes de crédit: augmentent avec des montants négatifs

Les actifs sont les ressources qui sont dues à votre entreprise.
L'actif représente ce que possède l'entreprise : ses biens, ses créances et ses disponibilités.

Les passifs sont les ressources que l'entreprise doit à des tiers.
Le passif, quant à lui, indique les ressources de l'entreprise : les fonds apportés par les associés (capital social), les bénéfices non distribués et les dettes.

Le Bilan énumère les valeurs de l'entreprise, ce qu'elle possède et ce qu'elle doit.
Le Bilan est l'état patrimonial de l'entreprise à un instant T.

Le compte de résultat vise à déterminer le résultat de l'entreprise. Il indique les bénéfices et les pertes de l'entreprise sur une période donnée.
