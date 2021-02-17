#!bin/bash

headerpath="/usr/src/"
#Make automation easy...
quit ()
{
  exit
}

again()
{
  echo "Invalid selection..."
  sleep 3
}

versioncheckK()
{
    uname -r
    echo "Kernel Version ^ Keep that in mind"
    sleep 5
}

showpath()
{
  echo -n "How long do you want results displayed? "
  read results
  ls -l /usr/src/linux-headers-$(uname -r)
  echo ""
  echo "Are they updated?"
  sleep $results
}

searchpK()
{
  sudo apt search linux-headers-$(uname -r)
  echo "Packages available ^^ "
  sleep 5
}

hup()
{
  sudo apt update -y
  clear
  echo "Installing headers..."
  sleep 3
  clear
  sudo apt install linux-headers-$(uname -r) -y
  clear
  echo "Headers Installed...  Listing directory below please confirm."
  sleep 3
  ls -l /usr/src/linux-headers-$(uname -r)
  sleep 10
}

echo "Welcome ezHeader"
echo "The tool that updates your headers fast"
echo "Sit back and relax :)"
sleep 3
  until ["$update_menu" = "0" ]; do
    clear
      echo "          Update your headers! Plz                  "
      echo "           Choose an option below            "
      echo ""
      echo ""
      echo "             1 - Check the version of my Kernel"
      echo "             2  - Are they already up to date?  "
      echo "             3 - Look for header packages matching Kernel V."
      echo ""
      echo "             4 - Update My Headers               "
      echo "             5 - Quit                            "
      echo " Choose an option! "
      read update_menu

    case $update_menu in
      1 ) clear ; versioncheckK;;
      2 ) clear ; showpath;;
      3 ) clear ; searchpK;;
      4 ) clear ; hup;;
      5 ) quit;;
      * ) again;;

  esac
done
