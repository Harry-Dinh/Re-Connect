import java.util.ArrayList;
import java.util.Comparator;
import java.util.Random;

public class BiSearch {
    public static void main(String[] args) {
        final int MAX_SIZE = 10000000;

        ArrayList<Integer> list = new ArrayList<>();
        Random randGenerator = new Random();
        boolean isInList;

        for (int i = 0; i < MAX_SIZE; i++) {
            list.add(randGenerator.nextInt(0, MAX_SIZE));
        }

        // Binary search require the list to be sorted in order to be used.
        // list.sort(Comparator.naturalOrder());

        System.out.println("Finished adding number");

        isInList = linearSearch(102813, list);
        System.out.println(isInList);
    }

    public static boolean binarySearch(int searchQuery, ArrayList<Integer> list) {
        return false;
    }

    public static boolean linearSearch(int searchQuery, ArrayList<Integer> list) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i) == searchQuery) {
                return true;
            }
        }

        return false;
    }
}
