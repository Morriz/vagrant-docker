#!/bin/bash

k () { cat ~/.ssh/id_rsa.pub | ssh -p $1 root@localhost "mkdir ~/.ssh ; cat > ~/.ssh/authorized_keys"; }

export -f k