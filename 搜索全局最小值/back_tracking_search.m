clear all
close all
clc
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ！！！！！！！回溯直线下降法！！！！！！！！！！



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 函数生成
x1=-1.5:0.05:1.5;
x2=-1.5:0.05:1.5;
[x,y]=meshgrid(x1,x2);

banana=@(x,y)(100*(1-x).^2+100*(y-x.^2).^2);

banana_d_x=@(x,y)(-200*(1-x)-400*(y-x.^2)*x);
banana_d_y=@(x,y)(200*(y-x.^2));

z=banana(x,y);
% figure(1)
% surf(x,y,z);grid on
% figure(2)
% contour(x,y,z,100,'ShowText','on');grid on

%% 设置alpha值和beta值以及其他初始值

%alpha=0.25+rand()/4;
alpha=0.25;
beta=0.6;
%beta=rand();
t=1;
% initial=randi([-15,15],1,2)/10;
initial=[-1.2,-1.2]
banana(-0.5,-1)
% 定义一个随机的方向
a=randn(1,2);
direction=a./sqrt(a*a');



%%
for i=1:1:1000
    break_point=1;
    while banana(initial(1)+t*direction(1),initial(2)+t*direction(2))>=banana(initial(1),initial(2))
        b=randn(1,2);
        direction=b./sqrt(b*b');
        break_point=break_point+1;
        i=i+1;
        if break_point>=10;
            break
        end
        
    end
    
    on_the_line=banana(initial(1)+t*direction(1),initial(2)+t*direction(2));
    line=banana(initial(1),initial(2))+alpha*t*((banana_d_x(initial(1),initial(2))*direction(1))+(banana_d_y(initial(1),initial(2))*direction(2)));
    
        
    
    if on_the_line>line
%         initial(1)=initial(1)+t*direction(1);
%         initial(2)=initial(2)+t*direction(2);
        t=beta*t;
    else
        initial(1)=initial(1)+t*direction(1);
        initial(2)=initial(2)+t*direction(2);      
    end
    
    if on_the_line<=1e-3
        break
    end
    
    
    figure(2)
%     contour(x,y,z,100,'ShowText','on');grid on;hold on;
    contour(x,y,z,100);grid on;hold on;
    plot(initial(1),initial(2),"-o",'Linewidth',2);grid on;
    axis([-1.5 1.5 -1.5 1.5]);
    m=getframe;
end

movie(m)

display(i)
