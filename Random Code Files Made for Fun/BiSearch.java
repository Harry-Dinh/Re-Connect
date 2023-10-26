import java.util.ArrayList;
import java.util.Comparator;
import java.util.Random;

public class BiSearch {
    public static void main(String[] args) {
        final int MAX_SIZE = 1000000;

        ArrayList<Integer> list = new ArrayList<>();
        Random randGenerator = new Random();

        for (int i = 0; i < MAX_SIZE; i++) {
            list.add(randGenerator.nextInt(0, MAX_SIZE));
        }

        list.sort(Comparator.naturalOrder());

        System.out.println("Finished adding number");
    }

    public static boolean binarySearch(int searchQuery, ArrayList<Integer> list) {
        int currentSize = list.size();
        int midpoint = 0;
        int startPos = 0;

        while (searchQuery == midpoint) {
            if (searchQuery < currentSize / 2) {
                startPos = 0;
                currentSize /= 2;
            } else if (searchQuery > currentSize / 2) {
                startPos = currentSize / 2;
                currentSize = list.size();
            }
        }

        return false;
    }
}
