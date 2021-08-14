#!/bin/bash

bindir=./

${bindir}/riscvOVPsim.exe \
    --program add \
    --variant RVB32I \
    --signaturedump \
    --override riscvOVPsim/cpu/sigdump/SignatureFile=add.sig.dat.txt \
    --override riscvOVPsim/cpu/sigdump/StartAddress=0x100 \
    --override riscvOVPsim/cpu/sigdump/SignatureGranularity=4 \
    --override riscvOVPsim/cpu/sigdump/ByteCount=16 \
    --override riscvOVPsim/cpu/sigdump/SignatureAtEnd=T \
    --logfile fib.sig.run.log \
    --exitonaddress 0x38 \
    "$@"