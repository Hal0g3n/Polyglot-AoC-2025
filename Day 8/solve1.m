data = importdata("input.txt");
N = rows(data);
edges = nchoosek(1:N, 2);
[sorted_dist, idx] = sort(sqrt(sum((data(edges(:, 1), :) - data(edges(:, 2), :)).^2, 2)));
edges = edges(idx, :);

global parent = 1:N;
function head = findHead(x)
    global parent;
    if x != parent(x)
        parent(x) = findHead(parent(x));
    end
    head = parent(x);
end

connected = 0;
for edge=edges'
    x = findHead(edge(1));
    y = findHead(edge(2));
    parent(y) = x;
    connected += 1;

    if connected == 1000
        break
    end
end

group = zeros(1, N);
for i = 1:N
    group(findHead(i)) += 1;
end

[group, idx] = sort(group, 'descend');
disp(group(1) * group(2) * group(3))