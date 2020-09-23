#標準入力受付変数：nyuryoku
nyuryoku = input()

#カンマで入力を区切りlist化する。
hec = nyuryoku.split(',')

#出力結果をlist化するため空のlist：outputを作成
output = []

#入力結果(list)の要素１つ１つを判断していく
for i in range(len(hec)):
    #整数かそれ以外か判断
    if hec[i].isdecimal():
        #整数だった場合、3桁かそれ以外か判断
        if len(hec[i]) == 3:
            hec_list = list(hec[i])
            #整数で3桁だった場合、ぞろ目かそれ以外か判断
            if (all(x==hec_list[0] for x in hec_list)):
                output.append("zorome:" + str(hec[i]))
            else:
                output.append(hec[i])
        else:
            output.append("unmatch pattern:" + str(hec[i]))
    else:
        output.append("unmatch pattern:" + str(hec[i]))

#結果を出力
for x in range(len(output)):
    print(output[x])
