#include <bits/stdc++.h>

using namespace std;

int main() {
    freopen("input.txt", "r", stdin);
    int cur = 50, ans = 0;
    char dir; int x;
    while (scanf(" %c%u", &dir, &x) != EOF) {
        if (dir == 'L') {
            if (cur == 0) cur = 100;
            cur = cur - x;
            ans += cur <= 0 ? (100 - cur) / 100 : 0;
            cur = ((cur % 100) + 100) % 100;
        }
        else if (dir == 'R') {
            cur = cur + x;
            ans += cur >= 100 ? cur / 100 : 0;
            cur %= 100;
        }
    }
    printf("%d\n", ans);
}