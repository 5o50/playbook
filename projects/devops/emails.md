
make sure to not arrive in spam just get a 10/10 on mail-tester.com
https://www.mail-tester.com/

https://mxroutedocs.com/troubleshooting/mxtoolbox/

mxroute configuration
https://www.youtube.com/watch?v=ISr_PYo7YIc

DNS MX RECORDS
heracles.mxrouting.net (Priority 10)
heracles-relay.mxrouting.net (Priority 20)

SPF RECORD (REQUIRED):
Name: @ or blank
Type: TXT
Record: "v=spf1 include:mxlogin.com -all"

IMAP Server: heracles.mxrouting.net
SMTP Server: heracles.mxrouting.net

IMAP PORTS: 993 (SSL), 143 (non-encrypted)
SMTP PORTS: 465 (SSL), 25 (non-encrypted), 587 (STARTTLS)
POP3 PORTS: 995 (SSL), 110 (non-encrypted)



