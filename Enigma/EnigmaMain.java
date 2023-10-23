import java.util.Scanner;

public class EnigmaMain {

    public static Scanner scanner = new Scanner(System.in);
    public static void main(String[] args) {
        int option = -1;
        boolean isRunning = true;

        while (isRunning) {
            printMenu();
            try {
                System.out.print("> ");
                option = Integer.parseInt(scanner.nextLine());

                switch (option) {
                    case 0:
                        isRunning = false;
                        System.out.println("0 entered, stopping Enigma now...");
                        break;
                    case 1:
                        System.out.println("Encrypt");
                        break;
                    case 2:
                        System.out.println("Decrypt");
                        break;
                    default:
                        System.out.println("Not an option from the list, please try again.");
                        continue;
                }
            } catch (Exception e) {
                System.out.println("Error, enter a number only!");
                continue;
            }
        }
    }

    public static void printMenu() {
        System.out.println("E N I G M A  M A C H I N E");
        System.out.println("=============================");
        System.out.println("Please choose from the following options");
        System.out.println("1. Encrypt Message\n2. Decrypt Message\n3. Adjust Plugboard\n0. Stop\n");
    }
}