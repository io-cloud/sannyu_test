import java.util.Scanner;

public class Main {

  public static void main(String[] args) {
    System.out.print("<入力して下さい>");
    Scanner sc = new Scanner(System.in);
    String line = sc.nextLine();
    sc.close();

    //カンマで分割
    for (String s : line.split(",")) {
      //3桁の数字でない場合はメッセージ
      if (!s.matches("\\d{3}")) {
        System.out.println("unmatch pattern:" + s);
        continue;
      }
      //1文字ずつ分割
      String[] nums = s.split("");
      boolean zorome = true;
      for (String n : nums) {
        //等しくない数値だったらフラグを下ろす
        if (!n.equals(nums[0])) {
          zorome = false;
          break;
        }
      }
      if (zorome) {
        System.out.println("zorome:" + s);
      } else {
        System.out.println(s);
      }
    }
  }

}
