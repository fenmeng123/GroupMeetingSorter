%����� ���˳��֮�ն˾�����
clc
clear
rng('shuffle')
name={'������','������','�ż���','��¶¶','������','������','����','�޲���','����'};
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
    title(['��' num2str(i) '����ᱨ��'])
%     temp=tabulate(char(res(:,i))) ;
    [~,I]= sort(cell2mat(temp(:,3)),'descend');
    if i==1
    finallist{i}=temp{I(flag),1};
    end
    while sum(contains(finallist,temp{I(flag),1}))&&i~=1%����ѱ��鵽��
        flag=flag+1;%˳��
        if flag >=8
            flag=8;
        end
    end
    finallist{i}=temp{I(flag),1};
    fprintf('�����%dλ���˶���%s\n',i,temp{I(flag),1})
end
