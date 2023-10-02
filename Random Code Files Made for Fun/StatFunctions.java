import java.util.ArrayList;
import java.util.Scanner;

public class StatFunctions {
    public static void main(String[] args) {
        ArrayList<Double> data = new ArrayList<Double>();
        Scanner scanner = new Scanner(System.in);
        double userInput = -1;

        while (userInput != -100) {
            System.out.print("Please enter a data point (-100 to stop): ");
            userInput = scanner.nextDouble();
            data.add(userInput);
        }

        scanner.close();
        data.remove(data.size() - 1);

        double variance = sampleVariance(data);
        System.out.println("The variance of the data set is: " + variance);
    }



    /**
     * Calculate the sample variance of a data set.
     * @param data - The source for the function to calculate
     * @return The sample variance of the given data set
     */
    public static double sampleVariance(ArrayList<Double> data) {
        double sumSquared = 0;
        double sumAllSquared = 0;
        double finalAnswer = 0;

        for (int i = 0; i < data.size(); i++) {
            sumSquared += Math.pow(data.get(i), 2);
            sumAllSquared += data.get(i);
        }

        sumAllSquared = (double) (Math.pow(sumAllSquared, 2) / data.size());
        finalAnswer = (double) ((1 / (data.size() - 1)) * (sumSquared - sumAllSquared));
        return finalAnswer;
    }

    

    /**
     * Calculate the sample standard deviation from the given data set. Since the standard deviation is just the square root of the variance, we can call {@code sampleVariance()} to calculate the standard deviation and then return its square root.
     * @param data - The source for the function to calculate
     * @return The sample standard deviation of the given data set
     */
    public static double sampleStdDev(ArrayList<Double> data) {
        double variance = sampleVariance(data);
        return Math.sqrt(variance);
    }
}