import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class Main {
    public static void main(String[] args) throws Exception {

        Scanner stdIn = new Scanner(System.in);
        // 入力した値をカンマ区切りで収納
        String[] str = stdIn.nextLine().split(",");

	// 1～9の数字による正規表現パターンを定義
        Pattern p1 = Pattern.compile("^[0-9]+$");
        
        for(int i = 0; i < str.length; i++){
	　　//標準入力から受け取った値を判定
            Matcher m1 = p1.matcher(str[i]);
            boolean result1 = m1.matches();
            if(result1){
                int x = Integer.parseInt(str[i]);
                if(x >= 1000)
                    System.out.println("unmach pattern:" + str[i]);
                else if(x % 111 == 0)
                    System.out.println("zorome:" + str[i]);
                else
                    System.out.println(str[i]);
            }else{
                System.out.println("unmach pattern:" + str[i]);
            }
        }
    }
}
