#DIR=$(dirname $(readlink -f $0))
#PARENTDIR=$(dirname $DIR)
#cd $PARENTDIR

cd ~/

rm -f vim.tar.gz
tar -czvf ./vim.tar.gz .vim*

rm -f bashrc.tar.gz
tar -czvf ./bashrc.tar.gz .bash* .profile

rm -f bin.tar.gz
tar -czvf ./bin.tar.gz ./.bin

rm -f ttemp.tar.gz
tar -czvf ./ttemp.tar.gz .gitconfig .gdbinit



