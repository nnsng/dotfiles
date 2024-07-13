for folder in */; do
  stow $(basename $folder)
done
