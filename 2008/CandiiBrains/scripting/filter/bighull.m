function [x,y]=bighull(in)
in2=in;
n=1;
area=[];
loc=[];
if(~any(in2(:)))
    x=[];
    y=[];
    return
end
while(any(in2(:)))
	ind=find(in2,1,'first');
	cr=imfill(~in2,ind)~=~in2;
    loc(n)=ind; %#ok<AGROW>
    area(n)=sum(cr(:)); %#ok<AGROW>
    in2=in2&(~cr);
    n=n+1;
end
[m,ind]=max(area);
it=imfill(~in,loc(ind))~=~in;
[I]=find(it);
[y,x]=ind2sub(size(it),I);
ind=convhull(x,y);
x=x(ind);
y=y(ind);
return