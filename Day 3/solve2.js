const fs = require("fs");
const input = fs.readFileSync("input.txt", "utf-8").trim().split("\n");
let answer = 0;
for (const l of input) {
    const line = l.trim();

    let l_ans = 0;
    let large = 0;
    for (let i = 12; i > 0; i--) {
        l_ans *= 10;
        for (let j = large; j < line.length - i + 1; j++)
            if (line[large] < line[j]) large = j;
        l_ans += Number(line[large]);
        large += 1;
    }

    console.log(l_ans)
    answer += l_ans;
}
console.log(answer);