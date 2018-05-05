# dotfiles

```sh
git clone https://github.com/kateinoigakukun/dotfiles.git
cd dotfiles
make deploy
```

## Cleanup global gems

```sh
gem list -q|awk '{ print $1 }'|egrep -v 'rdoc|psych|openssl|json|io-console|bigdecimal'|xargs gem uninstall
```
