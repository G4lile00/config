sudo apt upgrade
sudo apt update -y 
sudo apt intall git


sudo apt-get install dconf-cli uuid-runtime

# clone the repo into "$HOME/src/gogh"
mkdir -p "$HOME/src"
cd "$HOME/src"
git clone https://github.com/Gogh-Co/Gogh.git gogh
cd gogh

# necessary in the Gnome terminal on ubuntu
export TERMINAL=gnome-terminal

cd installs

./ayu-dark.sh


