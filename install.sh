#!/bin/bash
#DOCKER Install 
#Easy way
sus = $?
cat /etc/os-release
if [ -r "CentOS" ]; then
        sudo yum update
          if [ [ $sus -ne 0 ] ; then 
              echo " try agian... "
              exit 1
          else 
            echo "Excelent"
         fi
elif [ -r "Ubuntu" or "Debian" ] ; then 
        sudo apt-get update
          if [ [ $sus -ne 0 ] ] ; then 
              echo " try agian... "
              exit 1
          else 
            echo "Excelent"
         fi
else
      echo "Can't not found..."
      exit 1
fi

