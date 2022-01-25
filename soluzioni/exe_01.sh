#!/bin/bash

# find all .txt that contain 'Bennet'

grep -Rl 'Bennet' # occhio che cerca anche in file non-txt

find . -name '*.txt' -exec grep -l 'Bennet' {} \;

grep -l 'Bennet' $(find . -name '*.txt')

# aggiungete un file il cui nome contiene uno spazio e all'interno c'e' Bennet
# questi comandi funzionano?
