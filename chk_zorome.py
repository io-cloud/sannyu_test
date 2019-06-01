"""
条件
    標準入力からカンマ区切りでランダムな文字列or数値を受け取る
    受け取った値が、3桁の数字でない場合は、unmach pattern: <受け取った値>を表示する
    受け取った値が、3桁のぞろ目の数字であった場合は、zorome: <受け取った値>を表示する
    受け取った値が、上記に当てはまらない場合は、そのまま受け取った値を表示する
"""
    
def main():
    # 標準入力からカンマ区切りでランダムな文字列or数値を受け取る。
    x = input("Please enter ramdom string or number (separated by comma): ").split(",")

    # 受け取った値を1つずつ処理する。
    for item in x:

        # 受け取った値が、数字であった場合は、「桁数」と「ぞろ目」のチェックを行う。
        if item.isnumeric():
            num = list(item)

            # 3桁の数字ではない場合、unmach pattern: <受け取った値>を表示する。
            if len(num) != 3:
                print("unmach pattern: "+item)
 
            # 3桁のぞろ目の数字であった場合は、zorome: <受け取った値>を表示する。
            elif(all(i==num[0] for i in num)):
                print("zorome: "+item)

            # 上記に当てはまらない場合は、そのまま受け取った値を表示する。
            else:
                print(item)

        # 受け取った値が、数字ではない場合は、unmach pattern: <受け取った値>を表示する。
        else:
            print("unmach pattern: "+item)

if __name__ == "__main__":
    main()
