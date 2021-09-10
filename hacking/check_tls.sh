#!/usr/bin/env bash
for f in *.crt; do openssl x509 -in "$f" -noout -text | grep -A2 Validity; done
