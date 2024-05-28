# install command
[ ! -e /usr/local/bin/hcr ] && sudo cp hcr /usr/local/bin
# install man page
[ ! -e /usr/share/man/man1/hcr.1 ] && sudo cp hcr.1 /usr/share/man/man1/

# update the man db
sudo mandb