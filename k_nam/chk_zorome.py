# chargs_zorome

# 案内出力
print('##############################################')
print('ゾロ目を出力するプログラムでございます。          ')
print('                                          ')
print('カンマ区切りでランダムな数字を入力してください     ')
print('#例: 123,abc,3333,555,321　                 ')
print('                                          ')
print('#結果例                                     ')
print('入力：111,222,333,123,1234,12345,text1,text2 ')
print("['1234', '12345', 'text1', 'text2']         ")
print("zorome: ['111', '222', '333']               ")
print("unzoromemach pattern: ['123']               ")
print('                                          ')
print('#説明                                       ')
print('zorome: 3桁の同じ数値                         ')
print('unzoromemach pattern: 3桁であり、同じ数値ではない文字及び数字    ')
print('##############################################')

# 文字&数字入力を受ける
inputdata = input('入力：').split(',')

# 関数設定
global args
global zorome
global unzorome
args = 0
zorome = []
unzorome = []
unzorome2 = []

# 入力データFor文
for x in range(0, len(inputdata)):

    # データが数字か判断
    if inputdata[x].isdecimal():

        # データが３桁か判断
        if len(inputdata[x]) == 3:
            b = inputdata[x]
            args = 0

            # リストのデータの値を合算する
            for d in range(0, len(b)):
                args = args + int(b[d])

            # Zorome確認
            if args / int(b[0]) != 3:
                unzorome.append(inputdata[x])
                args = 0

            elif len(inputdata[x]) != 3:
                unzorome.append(inputdata[x])

            else:
                zorome.append(b)

        # データが３桁か判断Else分岐
        else:
            unzorome2.append(inputdata[x])

    # データが数字か判断Else分岐
    else:
        unzorome.append(inputdata[x])

# 結果出力
print(', '.join(unzorome2))
print('zorome:', ', '.join(zorome))
print('unzoromemach pattern:', ', '.join(unzorome))

