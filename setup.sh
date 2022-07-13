#!/bin/bash
apt update -y
apt upgrade -y
apt install git -y
apt install -y python3-pip python3-venv python-dev python3-pandas git curl
apt install -y python3.8
apt install -y software-properties-common
apt install -y supervisor
add-apt-repository ppa:deadsnakes/ppa -y
apt-get -f install -y
cd ~/
git clone https://github.com/freqtrade/freqtrade.git
cd ~/freqtrade/
chmod 777 setup.sh
./setup.sh -i
source .env/bin/activate
cd /user_data/strategies/
curl -o Apollo11.py https://raw.githubusercontent.com/shanejones/goddard/main/Apollo11.py
cd ~/freqtrade/
curl -o config.json https://raw.githubusercontent.com/Mananlearn/Temp1/master/config.json
while true
do
      read -r -p "Enter your API key [Y/n] " input
 
      case $input in
            [yY][eE][sS]|[yY])
                  echo "Here you go"
                  read -sp 'Key: ' uservar
                  read -sp 'Secret ' passvar
                  sed -i "s/hahaky/"$uservar"/g" config.json
                  sed -i "s/hahasc/"$passvar"/g" config.json
                  sed -i "s/hahadry/true/g" config.json                  
                  break
                  ;;
            [nN][oO]|[nN])
                  echo "No"
                  break
                  ;;
            *)
                  echo "Invalid input..."
                  ;;
      esac      
done
cd /etc/supervisor/conf.d/
curl -o bot1.conf https://raw.githubusercontent.com/Mananlearn/Temp1/master/bot1.conf
sed -i "s/manan/"$USER"/g" bot1.conf
supervisorctl reread
supervisorctl update
supervisorctl status
while true
do
      read -r -p "Reboot? [Y/n]" input
 
      case $input in
            [yY][eE][sS]|[yY])
                  echo "Yes"
                  reboot
                  break
                  ;;
            [nN][oO]|[nN])
                  echo "No"
                  break
                  ;;
            *)
                  echo "Invalid input..."
                  ;;
      esac      
done
