#!/bin/bash
apt update -y
apt upgrade -y
apt install git -y
apt install -y python3-pip python3-venv python-dev python3-pandas python-wheel-common git curl
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
cd ~/freqtrade/user_data/strategies/
curl -o Apollo11.py https://raw.githubusercontent.com/shanejones/goddard/main/Apollo11.py
cd ~/freqtrade/
curl -o config.json https://raw.githubusercontent.com/Mananlearn/Temp1/master/config.json
cd /etc/supervisor/conf.d/
curl -o bot1.conf https://raw.githubusercontent.com/Mananlearn/Temp1/master/bot1.conf
nano bot1.conf
cd ~/freqtrade/
source .env/bin/activate
supervisorctl reread
supervisorctl update
supervisorctl status
