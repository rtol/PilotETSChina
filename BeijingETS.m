address1 = 'https://www.bjets.com.cn/article/jyxx/';
%address2 = '.jhtml';
j = 0;

for k = 1:71,

if k == 1,
    address=strcat(address1,'#');
    [s, error] = urlread(address);
else
    address=strcat(address1,'?',num2str(k));
    [s, error] = urlread(address);
end

sep1 = strfind(s,'<table');
sep2 = strfind(s,'table>');
s1 = s(sep1:sep2);

sep3 = strfind(s1,'<td>');
sep4 = strfind(s1,'</td>');
n = length(sep3);
%n2 = length(sep4);
%sep4 = sep4(n2-n+1:n2);
nobs = round(n/4);

for i = 1:nobs,
    j = j+1;
    date{j} = {s1(sep3(i+(i-1)*3)+4:sep4(i+(i-1)*3)-1)};
    volume{j} = {s1(sep3(i+(i-1)*3+1)+4:sep4(i+(i-1)*3+1)-1)};
    price{j} = {s1(sep3(i+(i-1)*3+2)+4:sep4(i+(i-1)*3+2)-1)};
    turnover{j} = {s1(sep3(i+(i-1)*3+3)+4:sep4(i+(i-1)*3+3)-1)};
end

end

%%
A = [table2array(cell2table(date')) table2array(cell2table(volume')) table2array(cell2table(price')) table2array(cell2table(turnover'))];