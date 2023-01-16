echo "== Cleaning up default installation =="

rm -r /home/eric/Desktop
rm -r /home/eric/Documents
rm -r /home/eric/Music
rm -r /home/eric/Pictures
rm -r /home/eric/Public
rm -r /home/eric/Templates
rm -r /home/eric/Videos
apt -y remove kate

echo "== Installing basic programs =="

apt -qy update
apt -qy install git
apt -qy install make
apt -qy install cmake
apt -qy install g++
apt -qy install valgrind
apt -qy install default-jdk 
apt -qy install emacs-gtk
apt -qy install python3
apt -qy install vlc
apt -qy install latexmk
apt -qy install texlive-xetex
apt -qy install texlive-lang-european
apt -qy install texlive-fonts-extra
apt -qy install texlive-full
apt -qy install texlive-extra

# install vs code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
apt -qqy install apt-transport-https
apt -qq update
apt -qy install code

apt -qy upgrade
