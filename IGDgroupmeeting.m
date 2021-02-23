%网瘾组 组会顺序之终端决策器
clc
clear
rng('shuffle')
name={'王梓良','耿晓敏','张佳琳','吴露露','宋坤儒','许琳旋','付玉','邹博文','李鑫'};
iter=100000;
for i=1:iter
    res(i,:)=name(randperm(length(name)));
end
tabulate(char(res));
for i=1:length(name)
    flag=1;
    subplot(3,3,i)
    temp=tabulate(char(res(:,i))) ;
    bar(categorical(temp(:,1)),cell2mat(temp(:,2)),'BaseValue',10000)
    title(['第' num2str(i) '次组会报告'])
%     temp=tabulate(char(res(:,i))) ;
    [~,I]= sort(cell2mat(temp(:,3)),'descend');
    if i==1
    finallist{i}=temp{I(flag),1};
    end
    while sum(contains(finallist,temp{I(flag),1}))&&i~=1%如果已被抽到了
        flag=flag+1;%顺延
        if flag >=8
            flag=8;
        end
    end
    finallist{i}=temp{I(flag),1};
    fprintf('有请第%d位幸运儿：%s\n',i,temp{I(flag),1})
end
