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

connected = 1;
for edge=edges'
    x = findHead(edge(1));
    y = findHead(edge(2));
    if x != y 
        connected += 1;
    end
    parent(y) = x;
    
    if connected == N
        printf("%d", data(edge(1), 1) * data(edge(2), 1))
        break
    end
end