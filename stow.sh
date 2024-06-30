for folder in */; do
  stow --target $HOME $(basename $folder)
done