# Modules

Modules, what do you expect? Contains the necessary configuration for the system
to be operable, that being dotfiles, etc etc. Each file (except nixos.nix... so
far i think?) will have at least 1 `lib.mkEnableOption`. Options are stored in
`cf.xxx` and depends on the directory you're seeing right now. Being:-

- `./programs` : Applications & co.
- `./services` : Applications & co., except it's running on the background and
  it dosen't have a GUI (shocker.)
- `./sys` : mostly core components to keep this machine alive
