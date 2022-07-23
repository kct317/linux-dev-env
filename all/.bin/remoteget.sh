#DIR=$(dirname $(readlink -f $0))
#PARENTDIR=$(dirname $DIR)
#cd $PARENTDIR

cd ~/


read -t 30 -s -p "please input ssh port : " sshport
echo -e "\n"
read -t 30 -s -p "please input username:" username
echo -e "\n"
read -t 30 -s -p "please input ip:" ip
echo -e "\n"

ssh -l $username -p $sshport ${ip} "~/.bin/remotepack.sh"

scp -P $sshport $username@${ip}:~/{vim.tar.gz,bashrc.tar.gz,bin.tar.gz,ttemp.tar.gz} ~/

ssh -l $username -p $sshport ${ip} "~/.bin/remoteclean.sh"

tar -xzvf bin.tar.gz
./.bin/use.sh

