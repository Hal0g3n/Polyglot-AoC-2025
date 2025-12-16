import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

class Main {
    public static void main(String args[]) throws FileNotFoundException {
        File input = new File("input.txt");
        try (Scanner scanner = new Scanner(input)) {
            scanner.useDelimiter("\\A");
            String grid[] = scanner.next().split("\n");

            int[] dx = {0, 1, 1, 1, 0, -1, -1, -1};
            int[] dy = {1, 1, 0, -1, -1, -1, 0, 1};
            int ans = 0, prev = -1;

            while (ans != prev) {
                prev = ans;
                for (int i = 0; i < grid.length; ++i) {
                    for (int j = 0; j < grid[0].length(); ++j) {
                        if (grid[i].charAt(j) != '@') continue;
                        int count = 0;
                        for (int k = 0; k < 8; ++k) {
                            int nx = i + dx[k];
                            int ny = j + dy[k];
                            if (nx < 0 || grid.length <= nx) continue;
                            if (ny < 0 || grid[0].length() <= ny) continue;

                            if (grid[nx].charAt(ny) != '@') continue;
                            ++count;
                        }
                        if (count >= 4) continue;
                        grid[i] = grid[i].substring(0, j) + '.' + grid[i].substring(j + 1);
                        ++ans;
                    }
                }
            }
            System.out.println(ans);
        }
    }
}