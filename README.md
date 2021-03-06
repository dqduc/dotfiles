Header: dotfiles/README.md

---

another _dotfiles_ repository

COPYING
-------

2-clause (*simplified* or *new*) BSD or MIT at your *name* preference

(if not explicitly stated otherwise in particular files)

USAGE
-----

* clone the repository or repositories: 
	% git clone git://github.com/tokiclover/dotfiles.git dotfiles
* zsh users may clone my [fork][1] of [prezto][2]: 
	% git clone --recurse-submodules git://github.com/tokiclover/prezto.git .zprezto
* and then exec your shell with `% exec $SHELL`

FILES
-----
### /bin

* fhp: is a simple script which put firefox profile into tmpfs/zram backed FS;
* hdu: is a simple script which ease updating '$Header:...$' or '$Id:...$' update;
* ips: is a script which can be used to retrieve IP block lists to be added to iptables rules;
* ipr: is script to generate statefull ip[6]tables net rules;
* kvm: is a script to ease kvm loadind with a few default option;
* lbd: is a script to add/remove loop back devices;
* a2jloop: a script to map loopback device to jack client (support zita/alsa);
* magnet: a little script to transliterate magnet uri to torrent (file);
* mkstage4: a stage4 maker scripts with squashed (system/local) directories support;
* soundon.user: an oss4 user soundon script;
* term256colors: terminal colors display scripts;
* xtr: stand for eXtract TaRball, just run with a list of tarball to extract;
* bfd-plugins: switch ld plugin beetwen LLVMgold.so and GCC liblto_plugin.so,
  beware to switch to bfd or gold beforehand (using: binutils-config --linker bfd).

### /lib

* functions.bash: a very few helpers not fully tested..;
* .zsh/functions: a more usable variant of the previous;
	% autoload -Uz $helpers #when need be

[1]: https://github.com/tokiclover/prezto
[2]: https://github.com/sorin-ionescu/prezto

---
vim:fenc=utf-8:
