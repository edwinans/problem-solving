
/**
 * @author Edwin Ansari
 * The Hanoi problem recursive solution
 */
import java.util.Stack;

public class Hanoi {

    public static Stack<Integer> a1 = new Stack<>(), a2 = new Stack<>(), a3 = new Stack<>();
    public static int move = 0;

    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        for (int i = n; i >= 1; i--) {
            a1.push(i);
        }
        printState();
        hanoi(n, a1, a2, a3);
    }

    public static void printState() {
        System.out.printf("MOVE#%d\ns1:%s\ns2:%s\ns3:%s\n", move++, a1, a2, a3);
    }

    public static void hanoi(int n, Stack<Integer> s1, Stack<Integer> s2, Stack<Integer> s3) {
        if (n <= 0) {
            return;
        } else if (n == 1) {
            s3.push(s1.pop());
            printState();
        } else {
            hanoi(n - 1, s1, s3, s2);
            hanoi(1, s1, s2, s3);
            hanoi(n - 1, s2, s1, s3);
        }
    }
}