%load image
load clown
figure(1)
image(X)
size(X)
colormap(gray)
pause


%compute svd
[U,S,V] = svd(X);
sig = diag(S);
[m,n]=size(sig);
pause

%plot singular values
x = 1:1:m
figure(3)
semilogy(x,sig,'+')


%initialization for the loop
sum = 0;
error=zeros(20,1);

figure(2)
for k = 1:20
    sum = sum + sig(k)*U(:,k)*V(:,k)';
    image(sum);
    colormap(gray);
    title(['rank = ',int2str(k)])
    error(k)=norm(X-sum,'fro')/norm(X,'fro')
    pause
end

%plotting the error
error
figure(4)
semilogy(1:20,error,'-+')
legend('relative error')
    