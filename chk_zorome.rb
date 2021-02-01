###########################################################
#
# スクリプト名：chk_zorome.rb
# 概　　　　要：標準入力から受けたカンマ区切りの文字列、数値に応じて
#           　以下の処理を実施する。
#           ・3桁の数値ではない → unmach pattern: <受け取った値>
#           ・3桁のゾロ目の数値 → zorome: <受け取った値>
#           ・上記以外の数値   → <受け取った値>
#
############################################################

# 標準入力を受け付ける
print "カンマ区切りで文字列、数値を入力してください： "
ary_input = $stdin.gets.chomp.split(',')

# 入力された文字列または数値分ループをする
ary_input.each do |value|

  # 標準入力の値が3桁の数値か判定する
  if((/^[+-]?[0-9]{,3}?$/ =~ value.to_s) == nil) then
    print "unmach pattern: ", value, "\n"
    next
  end

  # 数値がゾロ目かどうか判定する
  if(/^[+-]?([1-9])\1+$/ =~ value.to_s) then
    print "zorome: ", value.to_i, "\n"
  else
    print value.to_i, "\n"
  end

end