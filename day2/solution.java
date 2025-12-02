import java.io.*;
import java.util.*;
import java.util.stream.IntStream;

public class solution {
    
    private static long part1(List<AbstractMap.SimpleEntry<Long, Long>> rangeList) {
        long ans = 0;
        for (AbstractMap.SimpleEntry<Long, Long> range : rangeList) {
            for (long i = range.getKey(); i <= range.getValue(); i++) {
                String iStr = Long.toString(i);
                String leftStr = iStr.substring(0, iStr.length()/2);
                String rightStr = iStr.substring(iStr.length()/2);
                if (leftStr.equals(rightStr)) ans += i;
            }
        }
        return ans;
    }
    private static long part2(List<AbstractMap.SimpleEntry<Long, Long>> rangeList) {
        long ans = 0;
        for (AbstractMap.SimpleEntry<Long, Long> range : rangeList) {
            for (long i = range.getKey(); i <= range.getValue(); i++) {
                String iStr = Long.toString(i);
                for (int j = 2; j <= iStr.length(); j++) {
                    if (iStr.length() % j != 0) continue;
                    final int len = iStr.length()/j;
                    if (IntStream.range(0, j).mapToObj(x -> iStr.substring(x*len, Math.min((x + 1)*len, iStr.length()))).distinct().count() == 1) {
                        ans += i;
                        break;
                    }
                }
            }
        }
        return ans;
    }

    public static void main(String[] args) throws FileNotFoundException {
        String input;
        try (Scanner scanner = new Scanner(new File ("day2/input"))) {
            input = scanner.nextLine();
        }
        String[] ranges = input.split(",");
        List<AbstractMap.SimpleEntry<Long, Long>> rangeList = Arrays.stream(ranges).map(x -> {
            String[] lr = x.split("-");
            return new AbstractMap.SimpleEntry<Long, Long> (Long.valueOf(lr[0]), Long.valueOf(lr[1]));
        }).toList();

        System.out.println(part1(rangeList));
        System.out.println(part2(rangeList));
    }
}