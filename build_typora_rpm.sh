#!/usr/bin/env bash

ITERATION="${1:-0}"

RPM_NAME=typora
VERSION=0.9.86
VENDOR=Typora

curl -L https://typora.io/linux/Typora-linux-x64.tar.gz | tar xzvf -


fpm -s dir -t rpm \
  --verbose \
  --force \
  --no-depends \
  --no-auto-depends \
  --rpm-rpmbuild-define "_build_id_links none" \
  --rpm-auto-add-directories \
  --rpm-compression=xz \
  --vendor $VENDOR \
  --iteration "$ITERATION" \
  -n $RPM_NAME \
  -v "$VERSION" \
  --description "Clean MarkDown editor" \
  --package-name-suffix $VENDOR \
  bin/Typora-linux-x64=/usr/share/ \
  typora.desktop=/usr/share/applications/ \
  typora=/usr/bin/ \
  ;

rm -rf bin
