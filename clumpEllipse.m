function [ summfmajor,summfminor,orian,maxf ] = clumpEllipse( N,n,sizx,sizy,per,sizeOfPatch,filename,pplot )
%code checking highest n density clump (might be in same clump)

% filename='/Users/lucy/Desktop/SR/Cohesion/costensize/potential/D1_0.4_000360000.bt';
%  sizx=4.9502330130486512e-09/2; % patch size x
%  sizy=4.9502330130486512e-09/2; % patch size y
%  per=0.4; % threadhold percentage
%  N=150; % grid size
%  n=10;  %%% finding 10 max values and check
%  sizeOfPatch=4; %%% devide the patch into 4 and only check one of it
%  pplot=1;   %%% 1 for plot clump finding result, otherwise it wouldn't
%  plot
disp(filename);
posidata=textread(filename);

bas=zeros(N);

dx=sizx/N;
dy=sizy/N;

posi=posidata(:,5:7);
x=posi(:,1);
y=posi(:,2);

for i=1:size(bas,1)
    logy=(i-1)*dy-sizy/2<y & y<i*dy-sizy/2;
    for j=1:size(bas,2)
        logx=(j-1)*dx-sizx/2<x & x<j*dx-sizx/2;
        log=logy==1 & logx==1;
        bas(i,j)=sum(log);
    end
    %disp(i)
end
bassort=sort(bas(:));
maxf=max(bas(:));
% max1
siz=zeros(1,n);

for i=0:n-1
%figure
logicbas = bas(:)==bassort(end-i);
maxIndex=find(logicbas);
[rowv, colv] = ind2sub(size(bas), maxIndex);
row=rowv(1);
col=colv(1);

[a,b]=size(bas);
%[xx,yy]=meshgrid(1:b,1:a);

%%%%%% find particle along each line
%%% recenter
xrc=(1:b)-col;
yrc=(1:a)-row;

logxrc=-N/sizeOfPatch<xrc & xrc<N/sizeOfPatch; % pick checking size ~ half of the patch
indxrc=find(logxrc==1); % pick out index

logyrc=-N/sizeOfPatch<yrc & yrc<N/sizeOfPatch; % pick checking size ~ half of the patch
indyrc=find(logyrc==1); % pick out index
% pick out x and y satisfyking condition
xrc=xrc(indxrc);
if abs(min(xrc))~=abs(max(xrc))
    bondx=min([abs(min(xrc)),abs(max(xrc))]);
    xrc=xrc(xrc>-bondx & xrc<bondx);
end
yrc=yrc(indyrc);
if abs(min(yrc))~=abs(max(yrc))
    bondx=min([abs(min(yrc)),abs(max(yrc))]);
    yrc=yrc(yrc>-bondx & yrc<bondx);
end
[xxrc,yyrc]=meshgrid(xrc,yrc);
%%

%hold on
nnn2=20;
basinc=bas(yrc+row,xrc+col); % grid included in the area
%contour(xxrc,yyrc,basinc)
elipFb=zeros(1,nnn2);
elipFt=zeros(1,nnn2);
theta=zeros(1,nnn2);
sortyy={};
for k=1:nnn2
    theta(k)=pi/nnn2*(k-1);
    %tan(theta(k))
    if abs(tan(theta(k)))>1e16
        %logicyrc=tan(theta(k))*sin(theta(k))*xxrc*(1-1/nnn)<=yyrc & yyrc<=tan(theta(k))*sin(theta(k))*xxrc*(1+1/nnn) & yyrc>=0 | xxrc==0 | tan(theta(k))*sin(theta(k))*xxrc*(1+1/nnn)<=yyrc & yyrc<=tan(theta(k))*sin(theta(k))*xxrc*(1-1/nnn);  
        logicyrc=tan(theta(k))*xxrc<=yyrc+0.5 & tan(theta(k))*xxrc>=yyrc-0.5 | xxrc==0;
    elseif abs(tan(theta(k)))>1
        logicyrc=zeros(size(xxrc));
        ther=0.5;
        %disp('check')
        for r=0:0.1:sqrt(length(xrc)^2+length(yrc)^2)
            x_line=r*cos(theta(k));
            y_line=r*sin(theta(k));
            x_line_ne=-r*cos(theta(k));
            y_line_ne=-r*sin(theta(k));
            logcigxypolar=xxrc-ther<x_line & x_line<xxrc+ther & y_line>yyrc-ther & y_line<yyrc+ther;
            logcigxypolar_ne=xxrc-ther<x_line_ne & x_line_ne<xxrc+ther & y_line_ne>yyrc-ther & y_line_ne<yyrc+ther;
            logicyrc=logicyrc+logcigxypolar+logcigxypolar_ne;
            logicyrc=logicyrc>=1;
            logicyrctan=+logicyrc;
        end
    elseif tan(theta(k))==0
        logicyrc=yyrc==0;
    else
        %logicyrc=tan(theta(k))*sin(theta(k))*xxrc*(1-1/nnn)<=yyrc & yyrc<=tan(theta(k))*sin(theta(k))*xxrc*(1+1/nnn) & yyrc>=0 | tan(theta(k))*sin(theta(k))*xxrc*(1+1/nnn)<=yyrc & yyrc<=tan(theta(k))*sin(theta(k))*xxrc*(1-1/nnn);
        logicyrc=tan(theta(k))*xxrc<=yyrc+0.5 & tan(theta(k))*xxrc>=yyrc-0.5 ;
    end
    %surf(xxrc,yyrc,logicyrctan)
    %hold on
    xxrcch=xxrc(logicyrc);
    yyrcch=yyrc(logicyrc);
    if (tan(theta(k)))<-0.5 
        xxyysq=xxrcch.^2+yyrcch.^2;
        [sorty1,sortindey1]=sort(xxyysq(1:floor(length(xxyysq)/2)));
        [sorty2,sortindey2]=sort(-xxyysq(floor(length(xxyysq)/2)+1:end));
        sortindey1=reshape(sortindey1,1,[]);
        sortindey2=reshape(sortindey2,1,[]);
        sortindey=[sortindey1,sortindey2+floor(length(xxyysq)/2)];
        xxrcch=xxrcch(sortindey);
        yyrcch=yyrcch(sortindey);
        [sort1,sort2]=sort(yyrcch);
        xxrcch=xxrcch(sort2);
        yyrcch=yyrcch(sort2);
    elseif tan(theta(k))>0.5
        [sorty,sortindey]=sort(yyrcch);
        xxrcch=xxrcch(sortindey);
        yyrcch=sorty;
    end
    basrc=bas(row,col);
%     plot(xxrc(logicyrc),yyrc(logicyrc),'-o')
%     grid on
%     set(gca,'xtick',[-length(xxrc)/2:1:length(xxrc)/2])
%     set(gca,'ytick',[-length(xxrc)/2:1:length(xxrc)/2])
%     set(gca,'LineWidth',2)
%     set(gca, 'XColor', 'k','YColor', 'k')
    
%    hold on

    % check bottom half
    
    for ind=ceil(length(xxrcch)/2):length(xxrcch)-1
        if mean([bas(yyrcch(ind)+row,xxrcch(ind)+col),bas(yyrcch(ind+1)+row,xxrcch(ind+1)+col)])>per*basrc
        %elseif bas(yyrcch(ind)+row,xxrcch(ind)+col)~=0
                elipFb(k)=sqrt((xxrcch(ind)*dx)^2+(yyrcch(ind)*dy)^2);
        else
            break
        end
    end
    
    % check bottom half
    for ind=ceil(length(xxrcch)/2):-1:2
        if mean([bas(yyrcch(ind)+row,xxrcch(ind)+col),bas(yyrcch(ind-1)+row,xxrcch(ind-1)+col)])>per*basrc
        %elseif bas(yyrcch(ind)+row,xxrcch(ind)+col)~=0
                elipFt(k)=sqrt((xxrcch(ind)*dx)^2+(yyrcch(ind)*dy)^2);
        else
            break
        end
    end
    
end
%end
%%
%figure
%plot(elipFb)
%hold on
%plot(elipFt)
elip=(elipFt+elipFb)*1.49597892e11;
%plot(elipFt+elipFb)
summfmajorarr(i+1)=max(elip);
indmaxelip=find(elip==max(elip));
indmaxe=indmaxelip(1);
if indmaxe+floor(length(elip)/2)-1>length(elip)
    summfminorarr(i+1)=elip(indmaxe-floor(length(elip)/2)-1);
else
    summfminorarr(i+1)=elip(indmaxe+floor(length(elip)/2)-1);
end
orianarr(i+1)=pi/2-theta(indmaxe)/pi*180;
end
iarr=find(summfmajorarr==max(summfmajorarr));
i=iarr(1);

summfmajor=summfmajorarr(i);
summfminor=summfminorarr(i);
orian=orianarr(i);
fprintf('the major axis is %.3f m, and minor axis is %.3f m,oriantation is %.3f\n degree\n',summfmajor,summfminor,orian)

fprintf('the major axis is %.3f grid, and minor axis is %.3f grid,oriantation is %.3f\n degree\n',summfmajor/(dx*1.49597892e11),summfminor/(dx*1.49597892e11),orian)

%%
%%%%%%%%%% plot max
logicbas = bas(:)==bassort(end-i);
maxIndex=find(logicbas);
[rowv, colv] = ind2sub(size(bas), maxIndex);
row=rowv(1);
col=colv(1);

[a,b]=size(bas);
[xx,yy]=meshgrid(1:b,1:a);

%%%%%% find particle along each line
%%% recenter
xrc=(1:b)-col;
yrc=(1:a)-row;

logxrc=-N/sizeOfPatch<xrc & xrc<N/sizeOfPatch; % pick checking size ~ half of the patch
indxrc=find(logxrc==1); % pick out index

logyrc=-N/sizeOfPatch<yrc & yrc<N/sizeOfPatch; % pick checking size ~ half of the patch
indyrc=find(logyrc==1); % pick out index
% pick out x and y satisfying condition
xrc=xrc(indxrc);
if abs(min(xrc))~=abs(max(xrc))
    bondx=min([abs(min(xrc)),abs(max(xrc))]);
    xrc=xrc(xrc>-bondx & xrc<bondx);
end
yrc=yrc(indyrc);
if abs(min(yrc))~=abs(max(yrc))
    bondx=min([abs(min(yrc)),abs(max(yrc))]);
    yrc=yrc(yrc>-bondx & yrc<bondx);
end
[xxrc,yyrc]=meshgrid(xrc,yrc);
%%
%subplot(1,2,1)
nnn2=20;
basinc=bas(yrc+row,xrc+col); % grid included in the area
if pplot==1
figure
plot(x/dx,y/dy,'.')
xlim([min(xrc),max(xrc)]);
ylim([min(yrc),max(yrc)]);
figure
hold on
contour(xxrc,yyrc,basinc,'LineWidth',2)
end
elipFb=zeros(1,nnn2);
elipFt=zeros(1,nnn2);
theta=zeros(1,nnn2);
nnn=nnn2+10;
if pplot==1
plotpointsxt=[];
plotpointsyt=[];
plotpointsxb=[];
plotpointsyb=[];
end
for k=1:nnn2
    theta(k)=pi/nnn2*(k-1);
    %tan(theta(k))
    if tan(theta(k))>1e16
        %logicyrc=tan(theta(k))*sin(theta(k))*xxrc*(1-1/nnn)<=yyrc & yyrc<=tan(theta(k))*sin(theta(k))*xxrc*(1+1/nnn) & yyrc>=0 | xxrc==0 | tan(theta(k))*sin(theta(k))*xxrc*(1+1/nnn)<=yyrc & yyrc<=tan(theta(k))*sin(theta(k))*xxrc*(1-1/nnn);  
        logicyrc=tan(theta(k))*xxrc<=yyrc+0.5 & tan(theta(k))*xxrc>=yyrc-0.5 | xxrc==0;
    elseif abs(tan(theta(k)))>1
        logicyrc=zeros(size(xxrc));
        ther=0.5;
        %disp('check')
        for r=0:0.1:sqrt(length(xrc)^2+length(yrc)^2)
            x_line=r*cos(theta(k));
            y_line=r*sin(theta(k));
            x_line_ne=-r*cos(theta(k));
            y_line_ne=-r*sin(theta(k));
            logcigxypolar=xxrc-ther<x_line & x_line<xxrc+ther & y_line>yyrc-ther & y_line<yyrc+ther;
            logcigxypolar_ne=xxrc-ther<x_line_ne & x_line_ne<xxrc+ther & y_line_ne>yyrc-ther & y_line_ne<yyrc+ther;
            logicyrc=logicyrc+logcigxypolar+logcigxypolar_ne;
            logicyrc=logicyrc>=1;
            logicyrctan=+logicyrc;
        end
      elseif abs(tan(theta(k)))>2.7
      logicyrc=zeros(size(xxrc));
      ther=0.5;
      %disp('check')
      for r=0:0.1:sqrt(length(xrc)^2+length(yrc)^2)
          x_line=r*cos(theta(k));
          y_line=r*sin(theta(k));
          x_line_ne=-r*cos(theta(k));
          y_line_ne=-r*sin(theta(k));
          logcigxypolar=xxrc-ther<x_line & x_line<xxrc+ther & y_line>yyrc-ther & y_line<yyrc+ther;
          logcigxypolar_ne=xxrc-ther<x_line_ne & x_line_ne<xxrc+ther & y_line_ne>yyrc-ther & y_line_ne<yyrc+ther;
          logicyrc=logicyrc+logcigxypolar+logcigxypolar_ne;
          logicyrc=logicyrc>=1;
          logicyrctan=+logicyrc;
      end
    elseif tan(theta(k))==0
        logicyrc=yyrc==0;
    else
        %logicyrc=tan(theta(k))*sin(theta(k))*xxrc*(1-1/nnn)<=yyrc & yyrc<=tan(theta(k))*sin(theta(k))*xxrc*(1+1/nnn) & yyrc>=0 | tan(theta(k))*sin(theta(k))*xxrc*(1+1/nnn)<=yyrc & yyrc<=tan(theta(k))*sin(theta(k))*xxrc*(1-1/nnn);
        logicyrc=tan(theta(k))*xxrc<=yyrc+0.5 & tan(theta(k))*xxrc>=yyrc-0.5 ;
    end
    xxrcch=xxrc(logicyrc);
    yyrcch=yyrc(logicyrc);
    %tan(theta(k))
    if (tan(theta(k)))<-0.5 
        xxyysq=xxrcch.^2+yyrcch.^2;
        [sorty1,sortindey1]=sort(xxyysq(1:floor(length(xxyysq)/2)));
        [sorty2,sortindey2]=sort(-xxyysq(floor(length(xxyysq)/2)+1:end));
        sortindey1=reshape(sortindey1,1,[]);
        sortindey2=reshape(sortindey2,1,[]);
        sortindey=[sortindey1,sortindey2+floor(length(xxyysq)/2)];
        xxrcch=xxrcch(sortindey);
        yyrcch=yyrcch(sortindey);
        [sort1,sort2]=sort(yyrcch);
        xxrcch=xxrcch(sort2);
        yyrcch=yyrcch(sort2);
    elseif tan(theta(k))>0.5
        [sorty,sortindey]=sort(yyrcch);
        xxrcch=xxrcch(sortindey);
        yyrcch=sorty;
    end
    basrc=bas(row,col);
    if pplot==1
    plot(xxrcch,yyrcch,'-go')
    grid on
    set(gca,'xtick',[-length(xxrc)/2:1:length(xxrc)/2])
    set(gca,'xTickLabel',[])
    set(gca,'ytick',[-length(xxrc)/2:1:length(xxrc)/2])
    set(gca,'yTickLabel',[])
    set(gca,'LineWidth',2)
    set(gca, 'XColor', 'k','YColor', 'k')
    
   hold on
    end
    % check bottom half
    for ind=ceil(length(xxrcch)/2):length(xxrcch)-1
        if mean([bas(yyrcch(ind)+row,xxrcch(ind)+col),bas(yyrcch(ind+1)+row,xxrcch(ind+1)+col)])>per*basrc
        %elseif bas(yyrcch(ind)+row,xxrcch(ind)+col)~=0
                elipFb(k)=sqrt((xxrcch(ind)*dx)^2+(yyrcch(ind)*dy)^2); 
        else
            if pplot==1
            plotpointsxt=[plotpointsxt,xxrcch(ind)];
            plotpointsyt=[plotpointsyt,yyrcch(ind)];
            plot(xxrcch(ind),yyrcch(ind),'k.','markers',12)
            end
            break
        end
    end
    
    % check bottom half
    for ind=ceil(length(xxrcch)/2):-1:2
        if mean([bas(yyrcch(ind)+row,xxrcch(ind)+col),bas(yyrcch(ind-1)+row,xxrcch(ind-1)+col)])>per*basrc
        %elseif bas(yyrcch(ind)+row,xxrcch(ind)+col)~=0
                elipFt(k)=sqrt((xxrcch(ind)*dx)^2+(yyrcch(ind)*dy)^2); 
        else
            if pplot==1
            plotpointsxb=[plotpointsxb,xxrcch(ind)];
            plotpointsyb=[plotpointsyb,yyrcch(ind)];
            plot(xxrcch(ind),yyrcch(ind),'k.','markers',12)
            end
            break
        end
    end
    
end
if pplot==1
logivplx=plotpointsyt>=0;
plotpointsxt2=plotpointsxt(logivplx);
plotpointsyt2=plotpointsyt(logivplx);

logivplx2=plotpointsyb>=0;
plotpointsxb2=plotpointsxb(logivplx2);
plotpointsyb2=plotpointsyb(logivplx2);

logivpl2=plotpointsyt<0;
plotpointsxt3=plotpointsxt(logivpl2);
plotpointsyt3=plotpointsyt(logivpl2);

logivpl22=plotpointsyb<0;
plotpointsxb3=plotpointsxb(logivpl22);
plotpointsyb3=plotpointsyb(logivpl22);

[sortx,sortxind]=sort(plotpointsxb2);
sorty=plotpointsyb2(sortxind);
plot([plotpointsxt2,fliplr(sortx),plotpointsxb3,plotpointsxt3,plotpointsxt2(1)],[plotpointsyt2,fliplr(sorty),plotpointsyb3,plotpointsyt3,plotpointsyt2(1)],'k-o','LineWidth',2)

plot([plotpointsxt2,fliplr(sortx)],[plotpointsyt2,fliplr(sorty)],'k-o','LineWidth',2)

plot([plotpointsxt2],[plotpointsyt2],'-o','LineWidth',2)
plot([plotpointsxb2],[plotpointsyb2],'-o','LineWidth',2)
plot([plotpointsxt3],[plotpointsyt3],'-o','LineWidth',2)
plot([plotpointsxb3],[plotpointsyb3],'-o','LineWidth',2)
end

end
%%
% figure
% plot(elipFb)
% hold on
% plot(elipFt)
% plot(elipFt+elipFb)
% hold off
% end