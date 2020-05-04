#!/bin/bash
#:
#: covid19-bd-stats.sh
#:
#: Author: H.R.Shadhin <dev@hrshadhin.me>
#: Discription: Show statistic about Bangladesh Covid-19 from IEDCR website (iedcr.gov.bd)
#:
#: Copyright (c) 2020 Under GPL-3.0 License.
#:
#: Installation & Usage:
#: ---------------------
#: Copy the script in you desired patha. Then call the script or set an alias in your 
#: favorite shell. i.e: alias covid19bd="<script path location here>"
#:
#: Usage: ./covid19-bd-stats.sh
#


# Variables
COLOR_REST="$(tput sgr0)"
COLOR_GREEN="$(tput setaf 2)"
COLOR_RED="$(tput setaf 1)"


# Functions
ok() { printf '%s%s%s\n' $COLOR_GREEN "$1" $COLOR_REST; }
die() { printf '%s%s%s\n' $COLOR_RED "$1" $COLOR_REST; exit 1; }
commandexist () {
    command -v "$1" >/dev/null
}

# dependency check
! commandexist "curl" && die "Please install CURL"

# download the html
ok "..."
curl -s http://iedcr.gov.bd > /tmp/iedcr.html

LAST_24_HOURS_TEST=0
LAST_24_HOURS_POSITIVE=0
TOTAL_TEST=0
TOTAL_POSITIVE=0

cat /tmp/iedcr.html |  awk -F'</*td>' '$2{print $2}' > /tmp/covid-15-dump.txt

while read l1 
do 
    read l2; read l3; read l4;

    if [[ $l1 =~ "COVID-19 test conducted in last 24 hours" ]]
    then
        LAST_24_HOURS_TEST=$l4
    fi

    if [[ $l1 =~ "COVID-19 positive cases in last 24 hours" ]]
    then
        LAST_24_HOURS_POSITIVE=$l4
    fi

    if [[ $l1 =~ "Total COVID-19 test conducted" ]]
    then
        TOTAL_TEST=$l4
    fi

    if [[ $l1 =~ "COVID-19 Total cases" ]]
    then
        TOTAL_POSITIVE=$l4
    fi

 done < /tmp/covid-15-dump.txt


#recovary and death stats
cat /tmp/iedcr.html |  grep -o '<h3.*h3>' | sed 's/<[^>]*>//g' > /tmp/covid-15-dump.txt

LAST_24_HOURS_DEATH=0
TOTAL_DEATH=0
while read l1
do
read l2; read LAST_24_HOURS_DEATH; read TOTAL_DEATH
done  < /tmp/covid-15-dump.txt

#clean up files
rm /tmp/iedcr.html
rm /tmp/covid-15-dump.txt

echo -e "\033[1m-: Last 24 Hours :-\033[0m"
echo -e "Test:\033[1m $LAST_24_HOURS_TEST\033[0m"
echo -e "Positive:\033[0;1;41;37m $LAST_24_HOURS_POSITIVE \033[0m"
echo -e "Death:\033[0;1;41;37m $LAST_24_HOURS_DEATH \033[0m"

echo -e "\n===============\n"

echo -e "\033[1m-: Total :-\033[0m"
echo -e "Test:\033[1m  $TOTAL_TEST\033[0m"
echo -e "Positive:\033[0;1;41;37m $TOTAL_POSITIVE \033[0m"
echo -e "Death:\033[0;1;41;37m $TOTAL_DEATH \033[0m"