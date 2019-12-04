address1 = 'http://www.hbets.cn/index.php/index-show-tid-11.html';
%address2 = '.jhtml';
j = 0;

for k = 1:1868,

if k == 1,
    address=address1;
    [s, error] = urlread(address);
else
    address=strcat(address1,'?p=',num2str(k));
    [s, error] = urlread(address);
end

sep1 = strfind(s,'<div class="future_table">');
sep2 = strfind(s,'<div class="page">');
s1 = s(sep1:sep2);

sep3 = strfind(s1,'<li');
sep4 = strfind(s1,'</li');
ncol = 5; %number of columns
sep3 = sep3(ncol+1:length(sep3)); %skip header
sep4 = sep4(ncol+1:length(sep4));
nobs = round(length(sep3)/ncol);

for i = 1:nobs,
    j = j+1;
    market{j} = {s1(sep3(i+(i-1)*(ncol-1))+16:sep4(i+(i-1)*(ncol-1))-1)};
    price{j} = {s1(sep3(i+(i-1)*(ncol-1)+1)+16:sep4(i+(i-1)*(ncol-1)+1)-1)};
    turnover{j} = {s1(sep3(i+(i-1)*(ncol-1)+2)+34:sep4(i+(i-1)*(ncol-1)+2)-1)};
    volume{j} = {s1(sep3(i+(i-1)*(ncol-1)+3)+34:sep4(i+(i-1)*(ncol-1)+3)-1)};
    date{j} = {s1(sep3(i+(i-1)*(ncol-1)+4)+16:sep4(i+(i-1)*(ncol-1)+4)-1)};
end

end

%%
A = [table2array(cell2table(date')) table2array(cell2table(market')) table2array(cell2table(volume')) table2array(cell2table(turnover')) table2array(cell2table(price'))];