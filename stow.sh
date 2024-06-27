folders=$(ls -d */)

for folder in $folders
do
   stow --target $HOME $folder
done