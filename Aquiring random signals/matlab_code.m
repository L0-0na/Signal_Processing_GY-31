%we have a sample with N observation for each t=[0, T]. for Red, Blue,
%Green color
%% Find the mean and variance
RED=zeros(30,30);
for i=1:30
RED(i,:)=xlsread('New Microsoft Excel Worksheet (2)','Table','D'+string((2+30*(i-1)))+':D'+string(((30*i-1)+2)));
end

GREEN=zeros(30,30);
for i=1:30
GREEN(i,:)=xlsread('New Microsoft Excel Worksheet (2)','Table','N'+string((2+30*(i-1)))+':N'+string(((30*i-1)+2)));
end
BLUE=zeros(30,32);
for i=1:30
BLUE(i,:)=xlsread('New Microsoft Excel Worksheet (2)','Table','I'+string((2+32*(i-1)))+':I'+string(((32*i-1)+2)));
end
Red_mean = mean(RED);
Red_var = var(RED);
plot(Red_mean)
title('RED-mean');
figure;
plot(Red_var)
title('RED-variance');
Blue_mean = mean(BLUE);
Blue_var = var(BLUE);
plot(Blue_mean)
title('BLUE-mean');
figure;
plot(Blue_var)
title('BLUE-variance');
Green_mean = mean(GREEN);
Green_var = var(GREEN);
plot(Green_mean)
title('GREEN-mean');
figure;
plot(Green_var)
title('GREEN-variance');
%% Autocorelation for RED
% autocorelation matrix for RED
Rred=zeros(30,30);
for i=1:30
    for j=1:30
        Rred(i,j)=mean(RED(:,i).*RED(:,j));
    end
end
% autocorulation function for RED

X=zeros(1,30);
for j=0:29
    x=zeros(1,30);
for i=1:30-j
        x(i)=Rred(i,i+j);
end
X(j+1)=mean(x(1:30-j));
end
plot(X(1:29));
title('Rx');
%% cross-corelation between red and blue
%cross correlation matrix
RB=zeros(30,30);
for i=1:30
    for j=1:30
        RB(i,j)=mean(RED(:,i).*BLUE(:,j));
    end
end
% cross-corelation function 
X=zeros(1,30);
for j=0:29
    x=zeros(1,30);
    for i=1:30-j
        x(i)=RB(i,i+j);
    end
    X(j+1)=max(x(1:30-j));
end
plot(X(1:29));
title('cross-corelation for RED and BLUE');


