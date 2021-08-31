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
outputName = args.inputHex.rstrip(".hex")
f0 = open(outputName+"0.hex",'w')
f1 = open(outputName+"1.hex",'w')
f2 = open(outputName+"2.hex",'w')
f3 = open(outputName+"3.hex",'w')

for i in range(len(lines)):
    #f.write(f"{hex(i)[2:]} : {lines[i]};\n")
    f0.write(f"{lines[i][0:2]}\n")
    f1.write(f"{lines[i][2:4]}\n")
    f2.write(f"{lines[i][4:6]}\n")
    f3.write(f"{lines[i][6:8]}\n")

   
#f.write(f"END;")
f0.close()
f1.close()
f2.close()
f3.close()
