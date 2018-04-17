//filename:chk_zorome.go

package main

import "strings"
import "fmt"
import "regexp"
import "flag"

func main () {
    flag.Parse()
    var s string = ""

    //引数が空だとsはからのまま。値があると代入。カンマ区切りだと要素１つ分のみ
    for i := 0; i < flag.NArg(); i++ {
        if i > 0 {
            s += " "
        }
        s += flag.Arg(i)
    }

    //スライスarr作成。カンマ区切りを要素に分解して代入
    var arr []string
    arr = strings.Split(s, ",")

    //要素ごとに判定
    //他言語で使うゾロ目の正規表現"^([0-9])\1{2}$"が使えなかったので10通り並べた
    for i := range arr {
        re_3zorome := regexp.MustCompile(`^(000|111|222|333|444|555|666|777|888|999)$`)
//        re_3zorome := regexp.MustCompile(`^([0-9])\\1{2}$`) //←うまくいかない・・・
        result1 := re_3zorome.MatchString(arr[i])
        if result1 == true {
            fmt.Println("zorome: ",arr[i])
        } else {
                re_3digits := regexp.MustCompile(`^[0-9]{3}$`)
                result2 := re_3digits.MatchString(arr[i])
                if result2 == true {
                    fmt.Println(arr[i])
                } else {
                        fmt.Println("unmatch pattern: ",arr[i])
                        }
                }
        }
}
