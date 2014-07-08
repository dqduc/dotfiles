#!/bin/zsh
# $Id: ~/scripts/hdu.zsh,v 1.1 2014/07/07 22:00:55 -tclover Exp $
usage() {
  cat <<-EOF
  usage: ${(%):-%1x} [options] <files>
  -d|-date <date>      old date or regex to replace by a new date
  -a|-author <author>  include <file> or file
  -u|-usage            print this help/usage and exit
EOF
exit 0
}
error() { print -P "%B%F{red}*%b%f $@" }
die() {
	error $@
	exit 1
}
alias die='die "%F{yellow}%1x:%U${(%):-%I}%u:%f" $@'

zmodload zsh/zutil
zparseopts -E -D -K -A opts a: author: d: date: u usage || usage

if [[ -n ${(k)opts[-u]} ]] || [[ -n ${(k)opts[-usage]} ]] { usage }
if [[ -z ${opts[*]} ]] { typeset -A opts }
:	${opts[-date]:=${opts[-d]:-2014}}
: 	${opts[-newd]:=$(date +%Y/%m/%d\ %T)}
if [[ -n ${opts[-author]:-${opts[-a]}} ]] {
	opts[-author]="-e s,-\ .*([a-z][A-Z]).*\ Exp,-\ ${opts[-author]:-${opts[-a]}}\ Exp,g"
}
for file ($*)
	sed -e "s,${opts[-date]}.*-,${opts[-newd]} -,g" ${opts[-author]} \
		-i ${file} || die "${file}: failed to update file"
unset -v opts

# vim:fenc=utf-8:ci:pi:sts=0:sw=4:ts=4: