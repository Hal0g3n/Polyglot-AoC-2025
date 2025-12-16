#include <bits/stdc++.h>

using namespace std;

int main() {
    freopen("input.txt", "r", stdin);
    int cur = 50, ans = 0;
    char dir; int x;
    while (scanf(" %c%u", &dir, &x) != EOF) {
        if (dir == 'L') cur = (cur - x + 100) % 100;
        else if (dir == 'R') cur = (cur + x) % 100;
        ans += cur == 0;
    }
    printf("%d\n", ans);
}