while true; do
  if [[ $(bspc subscribe -c 1 node_focus) ]]; then
    bspc config focused_border_color \#ffffff
    sleep 3
    bspc config focused_border_color \#000000
   fi
done

