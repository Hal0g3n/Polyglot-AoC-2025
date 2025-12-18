// Source - https://stackoverflow.com/a
// Posted by Stefan Arentz, modified by community. See post 'Timeline' for change history
// Retrieved 2025-12-18, License - CC BY-SA 4.0

package main

import (
    "bufio"
    "fmt"
    "log"
    "os"
	"strings"
	"strconv"
)

func main() {
    file, err := os.Open("input.txt")
    if err != nil {
        log.Fatal(err)
    }
    defer file.Close()

	var values [][]int;
	ans := 0;
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
		line := scanner.Text();
		
		if line[0] == '*' || line[0] == '+' {
			for i, x := range strings.Fields(line) {
				cur := 1;
				switch x[0] {
				case '*':
					for _, line := range values {cur *= line[i];}
					break;
				case '+':
					cur = 0;
					for _, line := range values {cur += line[i];}
				}
				ans += cur;
			}
			
			fmt.Println(ans);
		} else {
			var data []int;
			for i, x := range strings.Fields(line) {data = append(data, 0); data[i], err = strconv.Atoi(x);}
			values = append(values, data);
		}
    }
}
