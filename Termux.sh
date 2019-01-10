#!/bin/bash
(
cat <<EOF
#The main termux repository:
#deb https://termux.net stable main
deb http://mirrors.tuna.tsinghua.edu.cn/termux stable main
EOF
) > /$PREFIX/etc/apt/sources.list

apt update && apt upgrade && apt install -y nmap hydra wget zsh python python2 vim nano htop git curl unzip unrar neofetch proot nodejs vim-python openssh sshpass 

pip install sqlmap

(
cat <<EOF
 set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030
EOF
) > ~/.vimrc

source .vimrc 

termux-setup-storage

sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)"

ln -s /data/data/com.termux/files/home/storage/shared/tencent/QQfile_recv qq

pip install youtube-dl

mkdir -p ~/.config/youtube-dl

(
cat <<EOF
--no-mtime

-o /data/data/com.termux/files/home/storage/shared/Youtube/%(title)s.%(ext)s

-f "best[height<=1080]"
EOF
) > .config/youtube-dl/config

mkdir ~/bin

echo 'youtube-dl $1' > ~/bin/termux-url-opener

echo "优化完成！请慢慢享用吧！"
