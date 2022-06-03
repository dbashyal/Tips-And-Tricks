# Procedure to configure AWS SES with Postfix

## Step 1 – Uninstall Previous Sendmail if installed
`$ sudo apt --purge remove sendmail`

## Step 2 – Install postfix
`$ sudo apt install sendmail`

## Step 3 – SASL authentication package
```
$ sudo apt install libsasl2-modules
$ sudo yum install cyrus-sasl-plain
```

## Step 4 – Configuring postfix for Amazon SES
```bash
# to create new config
$ sudo cp -v -i /etc/postfix/main.cf{.proto,}
# if exists
$ sudo nano /etc/postfix/main.cf
############## SES #####################
relayhost = email-smtp.us-west-2.amazonaws.com:587
smtp_sasl_auth_enable = yes
smtp_sasl_security_options = noanonymous
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_use_tls = yes
smtp_tls_security_level = encrypt
smtp_tls_note_starttls_offer = yes
smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
```

Update sasl_passwd
```bash
$ sudo nano /etc/postfix/sasl_passwd
# replace all with
[email-smtp.us-west-2.amazonaws.com]:587 SMTP_USER:SMTP_PASSWORD
# save and
$ sudo chmod -v 0600 /etc/postfix/sasl_passwd
```

At a Linux/Unix shell prompt, type the following postmap command to create a hashmap database for MTA credentials:
`$ sudo postmap -v hash:/etc/postfix/sasl_passwd`

Configure CA certificate path for verification
`$ sudo postconf -e 'smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt'`

## Step 5 - Test configuration using the Linux/Unix CLI
```
$ sudo systemctl enable postfix
$ sudo systemctl restart postfix
$ sudo systemctl status postfix
```

Test integration of Amazon SES with Postfix
```
$ sendmail -f webmaster@example.biz webmaster@example.com
From: John Doe <webmaster@exmple.biz>
Subject: Postfix email server integration with Amazon SES
This message was sent using Amazon SES on my Ubuntu Linux server
.
```

**Sources:**
8 https://www.cyberciti.biz/faq/how-to-configure-aws-ses-with-postfix-mta/
