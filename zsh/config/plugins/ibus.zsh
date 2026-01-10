# ibus-hangul
local ostype=$(uname | tr '[:upper:]' '[:lower:]')
if [ $ostype = 'linux' ]; then
  export GTK_IM_MODULE=ibus
  export XMODIFIERS=@im=ibus
  export QT_IM_MODULE=ibus
fi
