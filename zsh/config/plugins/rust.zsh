export PATH="$PATH:$HOME/.cargo/bin"

if (( $+commands[sccache] )); then
  export RUSTC_WRAPPER=`which sccache`
fi
