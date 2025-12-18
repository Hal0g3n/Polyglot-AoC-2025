// Source - https://stackoverflow.com/a
// Posted by Stefan Arentz, modified by community. See post 'Timeline' for change history
// Retrieved 2025-12-18, License - CC BY-SA 4.0

package main

import (
    "bufio"
    "fmt"
    "log"
    "os"
	"strconv"
	"strings"
)

func main() {
    file, err := os.Open("input.txt")
    if err != nil {
        log.Fatal(err)
    }
    defer file.Close()

	var grid []string;
	ans := 0;
    scanner := bufio.NewScanner(file)
    for scanner.Scan() { grid = append(grid, scanner.Text()); }
	cur := 0;
	op := "+"[0];

	for c, _ := range grid[0] {
		
		if (grid[len(grid) - 1][c] != ' ') {
			ans += cur;
			op = grid[len(grid) - 1][c];
			if op == '+' {cur = 0;} else {cur = 1;}
		}

		num_raw := ""
		for r, _ := range grid[:len(grid) - 1] {
			num_raw += grid[r][c:c+1];
		}
		num, err := strconv.Atoi(strings.TrimSpace(num_raw));
		
		if err != nil {continue;}
		if op == '+' {cur += num;} else {cur *= num;}
	}

	fmt.Println(ans + cur);
}