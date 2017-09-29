n = 10;                                % n starts from 10
warning off;

for i = 1:10                           % Create a for loop to help us
    A = hilb(n);                       % Construct A
    b = A*ones(n,1);                   % For each n construct the vector
    y = cond(A,inf);                   % Calculate condition number
    x = A\b;                           % Solve the linear system
    forward = norm(ones(n,1) - x,inf); % Calculate forward error
    n,y,forward
    n = n + 10;                        % Iterate 10 times
    
end
