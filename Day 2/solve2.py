def check(n: int) -> bool:
    s = str(n)
    for i in range(1, len(s)):
        if len(s) % i != 0: continue
        check = True
        for j in range(i):
            if len(set(list(s[j::i]))) != 1: 
                check = False
                break
        if check: return True
    return False

with open("input.txt") as f:
    data = f.read().strip().split(",")
    count = 0
    for rng in data:
        a, b = map(int, rng.split("-"))
        for n in range(a, b + 1):
            if not check(n): continue
            count += n
    print(count)
