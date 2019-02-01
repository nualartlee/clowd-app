#!/usr/bin/env bash


# Error check function
# Param 1: return code, pass the last one with $?
# Param 2: error text to display
check_errs()
{
  if [ "${1}" -ne "0" ]; then
    echo "ERROR # ${1} : ${2}"
    exit ${1}
  fi
}

# Test that jenkins is responding on port 80
echo "Requesting site..."
curl -I 172.16.0.3:80 2>&1 | egrep "HTTP"
check_errs $? "Bad HTTP response when requesting the site"
