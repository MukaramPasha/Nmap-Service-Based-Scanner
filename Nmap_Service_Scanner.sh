#! /bin/bash
# This script is created by Mukaram Pasha, Security analyst currently working at ATOS.
echo ""
echo ""
echo ""
echo ""
 figlet -f big "Nmap Script"
echo ""
echo ""
echo ""
echo " Created by -"
figlet -f small "Mukaram Pasha"
echo ""
echo "Linkedin - https://www.linkedin.com/in/mukaram-pasha-67708315b"
echo ""
echo ""
echo "Script running time"
date
echo ""
echo ""
echo ""
echo ""
echo "Script is running, you will be notified once its completed !!..."
echo ""
echo ""

while IFS="," read -r IP_ADDRESS SERVICE PORT

do
TEMPNUM="$SERVICE"
case "$TEMPNUM" in

""*ssh*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=banner,ssh-hostkey,ssh2-enum-algos,sshv1,ssh-auth-methods,ssh-publickey-acceptance,ssh-run $IP_ADDRESS > SSH-_$IP_ADDRESS-$PORT.txt
   ;;

""*http*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=banner,http-apache-negotiation,http-auth,http-sql-injection,http-auth-finder,http-methods,http-axis2-dir-traversal,http-backup-finder,http-barracuda-dir-traversal,http-cakephp-version,http-brute,http-config-backup,http-default-accounts,http-enum,http-generator,http-headers,http-iis-webdav-vuln,http-majordomo2-dir-traversal,http-method-tamper,http-open-proxy,http-open-redirect,http-passwd,http-php-version,http-phpself-xss,http-rfi-spider,http-robots.txt,http-sitemap-generator,http-title,http-unsafe-output-escaping,http-userdir-enum,http-vuln-cve2010-2861,http-vuln-cve2012-1823,http-wordpress-enum,http-traceroute,http-frontpage-login,http-drupal-enum-users,http-tplink-dir-traversal,http-internal-ip-disclosure,ssl* $IP_ADDRESS > HTTP-_$IP_ADDRESS-$PORT.txt
   ;;

""*ftp*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=banner,ftp-anon,ftp-bounce,ftp-libopie,ftp-proftpd-backdoor,ftp-syst,ftp-vsftpd-backdoor,ftp-vuln-cve2010-4221 $IP_ADDRESS > FTP-_$IP_ADDRESS-$PORT.txt
   ;;

""*telnet*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=banner,telnet-brute,telnet-encryption,telnet-ntlm-info $IP_ADDRESS > TELNET-_$IP_ADDRESS-$PORT.txt
   ;;

 ""*smtp*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=banner,smtp-commands,smtp-enum-users,smtp-ntlm-info,smtp-open-relay,smtp-strangeport,smtp-vuln-cve2010-4344,smtp-vuln-cve2011-1720,smtp-vuln-cve2011-1764 $IP_ADDRESS > SMTP-_$IP_ADDRESS-$PORT.txt
   ;;

 ""*domain*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=banner,dns* $IP_ADDRESS > DNS-_$IP_ADDRESS-$PORT.txt
   ;;

 ""*kerberos*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=banner,krb5-enum-users --script-args krb5-enum-users.realm='test' $IP_ADDRESS > KERBEROS-_$IP_ADDRESS-$PORT.txt
   ;;


 ""*pop3*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=banner,pop3-capabilities.nse,pop3-ntlm-info.nse,smtp-commands,smtp-enum-users,smtp-ntlm-info,smtp-open-relay,smtp-strangeport,smtp-vuln-cve2010-4344,smtp-vuln-cve2011-1720,smtp-vuln-cve2011-1764 $IP_ADDRESS > POP3-_$IP_ADDRESS-$PORT.txt
   ;;

   ""*nessus*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=nessus* $IP_ADDRESS > NESSUS-_$IP_ADDRESS-$PORT.txt
   ;;


   ""*ntp*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=ntp*,nntp* $IP_ADDRESS > NTP-_$IP_ADDRESS-$PORT-TCP.txt
   nmap -p $PORT --max-rate 1000 --min-rate 1000 -sU --script=ntp*,nntp* $IP_ADDRESS > NTP-_$IP_ADDRESS-$PORT-UDP.txt
   ;;

   ""*cisco*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=http-cisco-anyconnect,banner,http-apache-negotiation,http-auth,http-sql-injection,http-auth-finder,http-methods,http-axis2-dir-traversal,http-backup-finder,http-barracuda-dir-traversal,http-cakephp-version,http-brute,http-config-backup,http-default-accounts,http-enum,http-generator,http-headers,http-iis-webdav-vuln,http-majordomo2-dir-traversal,http-method-tamper,http-open-proxy,http-open-redirect,http-passwd,http-php-version,http-phpself-xss,http-rfi-spider,http-robots.txt,http-sitemap-generator,http-title,http-unsafe-output-escaping,http-userdir-enum,http-vuln-cve2010-2861,http-vuln-cve2012-1823,http-wordpress-enum,http-traceroute,http-frontpage-login,http-drupal-enum-users,http-tplink-dir-traversal,http-internal-ip-disclosure,ssl* $IP_ADDRESS > CISCO-_$IP_ADDRESS-$PORT-TCP.txt
   nmap -p $PORT --max-rate 1000 --min-rate 1000 -sU --script=http-cisco-anyconnect,banner $IP_ADDRESS > CISCO-_$IP_ADDRESS-$PORT-UDP.txt
   ;;


   ""*rpc*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=msrpc-enum.nse,smb-vuln-ms08-067.nse,rpcinfo.nse $IP_ADDRESS > RPC-_$IP_ADDRESS-$PORT.txt
   ;;


   ""*netbios*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=nbstat $IP_ADDRESS > NETBIOS-_$IP_ADDRESS-$PORT.txt
   ;;


   ""*imap*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=banner,imap-capabilities.nse,imap-ntlm-info.nse $IP_ADDRESS > IMAP-_$IP_ADDRESS-$PORT_UDP.txt

   ;;


   ""*sql*"")
   nmap -p $PORT --max-rate 1000 --min-rate 1000 --script=mysql-audit.nse,mysql-databases.nse,mysql-dump-hashes.nse,mysql-empty-password.nse,mysql-enum.nse,mysql-info.nse,mysql-query.nse,mysql-users.nse,mysql-variables.nse,mysql-vuln-cve2012-2122.nse,ms-sql-config.nse,ms-sql-dac.nse,ms-sql-dump-hashes.nse,ms-sql-empty-password.nse,ms-sql-hasdbaccess.nse,ms-sql-info.nse,ms-sql-ntlm-info.nse,ms-sql-query.nse,ms-sql-tables.nse,ms-sql-xp-cmdshell.nse $IP_ADDRESS > SQL-_$IP_ADDRESS-$PORT.txt
   ;;


 esac
done < <(tail -n +2 data.csv)
echo ""
echo " Ignore the following warning messages:"
echo ""
cat SSH* > SSH_nmap_Results.txt
rm SSH-*
cat HTTP* > HTTP_nmap_Results.txt
rm  HTTP-*
cat FTP* > FTP_nmap_Results.txt
rm  FTP-*
cat TELNET* > TELNET_nmap_Results.txt
rm  TELNET-*
cat SMTP* > TELNET_nmap_Results.txt
rm  SMTP-*
cat DNS* > DNS_nmap_Results.txt
rm  DNS-*
cat KERBEROS* > KERBEROS_nmap_Results.txt
rm  KERBEROS-*
cat POP3* > POP3_nmap_Results.txt
rm  POP3-*
cat NESSUS* > NESSUS_nmap_Results.txt
rm  NESSUS-*
cat NTP* > NTP_nmap_Results.txt
rm  NTP-*
cat CISCO* > CISCO_nmap_Results.txt
rm  CISCO-*
cat RPC* > RPC_nmap_Results.txt
rm  RPC-*
cat NETBIOS* > NETBIOS_nmap_Results.txt
rm  NETBIOS-*
cat IMAP* > IMAP_nmap_Results.txt
rm  IMAP-*
cat SQL* > SQL_nmap_Results.txt
rm  SQL-*

find . -type f -size 0b -delete

echo ""
echo ""
echo ""
echo "Script successful"
echo ""
date
echo ""
