#DIR=$(dirname $(readlink -f $0))
#PARENTDIR=$(dirname $DIR)
#cd $PARENTDIR

cd ~/

tar -xzvf vim.tar.gz
tar -xzvf bashrc.tar.gz 
tar -xzvf bin.tar.gz
tar -xzvf ttemp.tar.gz

rm -f bin.tar.gz
rm -f bashrc.tar.gz
rm -f vim.tar.gz
rm -f ttemp.tar.gz

mkdir -p ~/.undodir
