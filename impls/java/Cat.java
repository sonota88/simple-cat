import java.io.IOException;

public class Cat {

    public static void main(String[] args) {
        while (true) {
            int n = readByte();
            if (n == /*EOF*/-1) {
                break;
            }
            System.out.write(n);
        }

        System.out.flush();
    }

    private static int readByte() {
        try {
            return System.in.read();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
