echo "Installing python packages"
sudo pip3 install bluepy
sudo pip3 install -r requirements.txt
sudo apt-get remove git -y
sudo apt-get clean

python3 gateway.py
