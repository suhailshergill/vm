echo "INSTALL haskell"

tar -xf _haskell.tar.gz
make -C haskell install
rm -rf haskell
