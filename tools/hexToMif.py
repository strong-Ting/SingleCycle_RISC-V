import argparse
parser = argparse.ArgumentParser()
parser.add_argument("inputHex",
                    type=str)

parser.add_argument("width",
                    help="Hex width",
                    type=int)

parser.add_argument("length",
                    help="the max address",
                    type=int)


args = parser.parse_args()
width = int(args.width)
length = int(args.length)

f = open(args.inputHex,'r')
lines = f.readlines()
f.close()
for i in range(len(lines)):
    lines[i] = lines[i].rstrip("\n")

f = open(args.inputHex.rstrip('.hex')+'.mif','w')
f.write(f"WIDTH={width};\n")
f.write(f"DEPTH={length};\n")
f.write(f"\n")
f.write(f"ADDRESS_RADIX=HEX;\n")
f.write(f"DATA_RADIX=HEX;\n")
f.write(f"CONTENT BEGIN\n")

for i in range(len(lines)):
    f.write(f"{hex(i)[2:]} : {lines[i]};\n")

f.write(f"END;")
f.close()
