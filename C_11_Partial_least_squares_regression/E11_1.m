clc,clear;
ab0=load('pz.txt'); 
mu=mean(ab0);   sig=std(ab0); %??????
rr=corrcoef(ab0); %??????
ab=zscore(ab0); %?????
a=ab(:,[1:3]);  b=ab(:,[4:end]); %????????????????
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats]=plsregress(a,b)
contr=cumsum(PCTVAR,2) %??????
xw=a\XS %??????????????????????xw=stats.W
yw=b\YS 

ncomp=input('???PCTVAR???????????? ncomp=');
[XL2,YL2,XS2,YS2,BETA2,PCTVAR2,MSE2,stats2]=plsregress(a,b,ncomp)
n=size(a,2);m=size(b,2);
beta3(1,:)=mu(n+1:end)-mu(1:n)./sig(1:n)*BETA2([2:end],:).*sig(n+1:end);
beta3([2:n+1],:)=(1./sig(1:n))'*sig(n+1:end).*BETA2([2:end],:)
bar(BETA2,'k')