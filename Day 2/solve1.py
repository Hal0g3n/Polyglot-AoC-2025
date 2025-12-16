def check(n: int) -> bool:
    s = str(n)
    if len(s) % 2 != 0: return False
    check = True
    for j in range(len(s) // 2):
        if s[j] != s[len(s) // 2 + j]: 
            check = False
            break
    return check

with open("input.txt") as f:
    data = f.read().strip().split(",")
    count = 0
    for rng in data:
        a, b = map(int, rng.split("-"))
        for n in range(a, b + 1):
            if not check(n): continue
            count += n
    print(count)
