fp = open("logExec")

line = fp.readline()

count = 0

result_list = []


while line:
  if ("NOP" in line):
    count = count + 1
  else:
    count = 0  
  
  if (count == 5):
    result_list.append(line)
    count = 0
  
  line = fp.readline()

for mys in result_list:
  mys = mys.replace("\n","")
  print(mys)

mylen = len(result_list)
print("my len is ", end="")
print(mylen)


seqlist = []
for s in result_list:
  s_list = s.split(":")
  seqlist.append(s_list[0])

print(seqlist)

for i in range(0,len(seqlist)):
  if (seqlist[i] == "1095334000"):
    print("wrong")
print("done")
  