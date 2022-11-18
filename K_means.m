function [Idx, Center]=K_means(x,k)
% Idx es la marca de la clase a la que pertenecen los datos y Center es la posición central de cada clase
% X son todos los puntos de datos bidimensionales, k se divide en k categorías
figure;
plot(x(:,1),x(:,2),'bo');hold on;
plot(x(1:k,1),x(1:k,2),'r*');hold off;
grid on;
title('raw data and original center');
len=length(x);
Idx=zeros(len,1);
c=x(1:k,:);

for i=1:10000
    for j=1:len
        xtemp=x(j,:);
        for jj=1:k
             d(jj)=norm(xtemp-c(jj,:));
        end
        [~,id]=min(d);
        Idx(j)=id;
    end
   
    for j=1:k
       L=x(Idx==j,:);
       c(j,:)=mean(L);
     end
end
Center=c;