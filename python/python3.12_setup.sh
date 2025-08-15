
# Install Python 3.12 and set up a virtual environment
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.12 python3.12-venv -y 
python3.12 -m venv venv

# Activate the virtual environment and install dependencies
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
pip freeze > requirements.txt
