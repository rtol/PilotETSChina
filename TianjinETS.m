address1 = 'https://www.chinatcx.com.cn/list/13.html';
%address2 = '.jhtml';
j = 0;

for k = 1:25,

if k == 1,
    address=address1;
    [s, error] = urlread(address);
else
    address=strcat(address1,'?page=',num2str(k));
    [s, error] = urlread(address);
end

sep1 = strfind(s,'<table');
sep2 = strfind(s,'/table>');
s1 = s(sep1:sep2);

sep3 = strfind(s1,'<td');
sep4 = strfind(s1,'</td>');
n = length(sep3);
%n2 = length(sep4);
%sep4 = sep4(n2-n+1:n2);
nobs = round(n/8);

for i = 1:nobs,
    j = j+1;
    date{j} = {s1(sep3(i+(i-1)*7)+18:sep4(i+(i-1)*7)-1)};
    vintage{j} = {s1(sep3(i+(i-1)*7+1)+18:sep4(i+(i-1)*7+1)-1)};
    volume1{j} = {s1(sep3(i+(i-1)*7+2)+18:sep4(i+(i-1)*7+2)-1)};
    volume2{j} = {s1(sep3(i+(i-1)*7+3)+18:sep4(i+(i-1)*7+3)-1)};
    turnover1{j} = {s1(sep3(i+(i-1)*7+4)+18:sep4(i+(i-1)*7+4)-1)};
    turnover2{j} = {s1(sep3(i+(i-1)*7+5)+18:sep4(i+(i-1)*7+5)-1)};
    price1{j} = {s1(sep3(i+(i-1)*7+6)+18:sep4(i+(i-1)*7+6)-1)};
    price2{j} = {s1(sep3(i+(i-1)*7+7)+4:sep4(i+(i-1)*7+7)-1)};
end

end

%%
A = [table2array(cell2table(date')) table2array(cell2table(vintage')) table2array(cell2table(volume1')) table2array(cell2table(volume2')) table2array(cell2table(turnover1')) table2array(cell2table(turnover2')) table2array(cell2table(price1')) table2array(cell2table(price2'))];