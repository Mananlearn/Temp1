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
git checkout stable
sudo ./build_helpers/install_ta-lib.sh
chmod 777 setup.sh
./setup.sh -i

cd ~/freqtrade/user_data/strategies/
curl -o NostalgiaForInfinityX.py https://raw.githubusercontent.com/iterativv/NostalgiaForInfinity/main/NostalgiaForInfinityX.py

nano /etc/supervisorctl/conf.d/bot1.conf
