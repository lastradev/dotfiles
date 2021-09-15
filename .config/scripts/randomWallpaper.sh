wp_path=/home/oscargl/Pictures/Wallpapers
image=$(ls $wp_path | grep -E '(jpg|png)$' | sort -R | tail -1)
xwallpaper --zoom $wp_path/$image &&
filename=$HOME/.xwallpaper
if [ ! -f $filename ]; then
    touch $filename
fi
echo $wp_path/$image > $HOME/.xwallpaper &&
notify-send "$file has been set as your wallpaper." && exit 0
