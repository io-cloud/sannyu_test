# chk_zorome

# 案内出力
print('############################################')
print('##ゾロ目を出力するプログラムでございます。        ##')
print('##カンマ区切りでランダムな数字を入力してください   ##')
print('##例: 123,abc,3333,555,321　               ##')
print('############################################')

# 文字&数字入力を受ける
a = input('入力：').split(',')

global k
global re
global un
k=0
re=[]
un=[]

# 文字以外処理
for x in range(0, len(a)):
    try:
        int(a[x])

    except ValueError:
        un.append(a[x])

    else:
       b = a[x]
       k = 0
       for d in range(0, len(b)):
          k = k + int(b[d])

       if k / int(b[0]) != 3:
          un.append(a[x])
          k = 0

       elif len(a[x]) != 3:
            un.append(a[x])

       else:
           re.append(b)

    if x == len(a)-1 :
        print('zorome:',re)

        if len(un) != 0 :
            print('unmach pattern:', un)

