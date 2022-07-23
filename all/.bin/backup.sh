#DIR=$(dirname $(readlink -f $0))
#PARENTDIR=$(dirname $DIR)
#cd $PARENTDIR

cd ~/

sh .bin/remotepack.sh

cd ~/
read -t 30 -s -p "please input ssh port : " sshport 
echo -e "\n"
read -t 30 -s -p "please input username:" username
echo -e "\n"
read -t 30 -s -p "please input ip:" ip
echo -e "\n"
scp -P $sshport vim.tar.gz bashrc.tar.gz bin.tar.gz ttemp.tar.gz $username@${ip}:~/
ssh -l $username -p $sshport ${ip} "tar -xzvf bin.tar.gz"
ssh -l $username -p $sshport ${ip} "./.bin/use.sh"

rm -f vim.tar.gz bashrc.tar.gz bin.tar.gz ttemp.tar.gz
