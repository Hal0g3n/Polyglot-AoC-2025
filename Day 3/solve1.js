const fs = require("fs");
const input = fs.readFileSync("input.txt", "utf-8").trim().split("\n");
let answer = 0;
for (const l of input) {
    const line = l.trim();

    let large1 = 0;
    for (let i = 1; i < line.length - 1; i++) {
        if (line[large1] < line[i]) large1 = i;
    }
    let large2 = large1 + 1;
    for (let i = large1 + 2; i < line.length; i++) {
        if (i !== large1 && line[large2] < line[i]) large2 = i;
    }

    console.log(Number(line[large1]), Number(line[large2]));
    answer += Number(line[large1] + line[large2]);
}
console.log(answer);