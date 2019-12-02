address1 = 'http://www.cerx.cn/en/endaily/index';
address2 = '.jhtml';
j = 0;

for k = 1:252,

if k == 1,
    address=strcat(address1,address2);
    [s, error] = urlread(address);
else
    address=strcat(address1,'_',num2str(k),address2);
    [s, error] = urlread(address);
end

sep1 = strfind(s,'<table');
sep2 = strfind(s,'table>');
s1 = s(sep1:sep2);

sep3 = strfind(s1,'<td>');
sep4 = strfind(s1,'</td>');
n = length(sep3);
n2 = length(sep4);
sep4 = sep4(n2-n+1:n2);
nobs = round(n/9);

for i = 1:nobs,
    j = j+1;
    date{j} = {s1(sep3(i+(i-1)*8)+4:sep4(i+(i-1)*8)-1)};
    vintage{j} = {s1(sep3(i+(i-1)*8+1)+4:sep4(i+(i-1)*8+1)-1)};
    openprice{j} = {s1(sep3(i+(i-1)*8+2)+4:sep4(i+(i-1)*8+2)-1)};
    maxprice{j} = {s1(sep3(i+(i-1)*8+3)+4:sep4(i+(i-1)*8+3)-1)};
    minprice{j} = {s1(sep3(i+(i-1)*8+4)+4:sep4(i+(i-1)*8+4)-1)};
    avgprice{j} = {s1(sep3(i+(i-1)*8+5)+4:sep4(i+(i-1)*8+5)-1)};
    closeprice{j} = {s1(sep3(i+(i-1)*8+6)+4:sep4(i+(i-1)*8+6)-1)};
    volume{j} = {s1(sep3(i+(i-1)*8+7)+4:sep4(i+(i-1)*8+7)-1)};
    turnover{j} = {s1(sep3(i+(i-1)*8+8)+4:sep4(i+(i-1)*8+8)-1)};
end

end

%%
A = [table2array(cell2table(date')) table2array(cell2table(vintage')) table2array(cell2table(openprice')) table2array(cell2table(maxprice')) table2array(cell2table(minprice')) table2array(cell2table(avgprice')) table2array(cell2table(closeprice')) table2array(cell2table(volume'))  table2array(cell2table(turnover'))];