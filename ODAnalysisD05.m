clear
cd /Users/lucy/Desktop/SR/Cohesion/costensize/D05/

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% optical depth 0.8 %%%%%%%%%%%%%%%%%%%%%%%%%%%
% ss files for 0.1,2 and 6.6 are different
x1=[6.6e-3,1.5e-2,5e-2,0.1,0.4,0.8,1.2,2,6.6];
% density 0.5
o663=[0.975576,0.951771,0.937315];
o152=[0.93369,0.960236,0.968951];
o552=[0.96262,0.954018,0.968541];
o01=[0.916733,0.907682,0.919656];
o04=[0.827874,0.833079,0.837817];
o08=[0.304858,0.302255,0.311772];
o12=[0.286395,0.281086,0.273293];
o2=[0.356071,0.359007,0.340671];
o66=[0.485358,0.428314,0.42698];

Y4410D05=[mean(o663),mean(o152),mean(o552),mean(o01),mean(o04),mean(o08),mean(o12),mean(o2),mean(o66)];
Y4410eD05=[std(o663),std(o152),std(o552),std(o01),std(o04),std(o08),std(o12),std(o2),std(o66)];
%%
N=60;
n=5;
sizx=9.9004660260973029e-10;
sizy=9.9004660260973029e-10;
% density 1
filename66='D05_6.6e-3_000360000.bt';
filename66_1='D05_6.6e-3_000354000.bt';
filename66_2='D05_6.6e-3_000348000.bt';

filename15='D05_1.5e-2_000360000.bt';
filename15_1='D05_1.5e-2_000354000.bt';
filename15_2='D05_1.5e-2_000348000.bt';

filename5='D05_5e-2_000360000.bt';
filename5_1='D05_5e-2_000354000.bt';
filename5_2='D05_5e-2_000348000.bt';

filename01='D05_0.1_000360000.bt';
filename01_1='D05_0.1_000354000.bt';
filename01_2='D05_0.1_000348000.bt';

filename04='D05_0.4_000360000.bt';
filename04_1='D05_0.4_000354000.bt';
filename04_2='D05_0.4_000348000.bt';

filename08='D05_0.8_000360000.bt';
filename08_1='D05_0.8_000354000.bt';
filename08_2='D05_0.8_000348000.bt';

filename12='D05_1.2_000360000.bt';
filename12_1='D05_1.2_000354000.bt';
filename12_2='D05_1.2_000348000.bt';

filename2='D05_2_000090000.bt';
filename2_1='D05_2_000084000.bt';
filename2_2='D05_2_000078000.bt';

filename66b='D05_6.6_000048000.bt';
filename66b_1='D05_6.6_000042000.bt';
filename66b_2='D05_6.6_000036000.bt';

%% calculation using ellipse
[summfmajor66_1,summfminor66_1,orian66_1,maxf66_1]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename66,0);
[summfmajor66_2,summfminor66_2,orian66_2,maxf66_2]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename66_1,0);
[summfmajor66_3,summfminor66_3,orian66_3,maxf66_3]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename66_2,0);
summfmajor66=mean([summfmajor66_1,summfmajor66_2,summfmajor66_3]);
summfminor66=mean([summfminor66_1,summfminor66_2,summfminor66_3]);
orian66=mean([orian66_1,orian66_2,orian66_3]);
maxf66=mean([maxf66_1,maxf66_2,maxf66_3]);

[summfmajor15_1,summfminor15_1,orian15_1,maxf15_1]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename15,0);
[summfmajor15_2,summfminor15_2,orian15_2,maxf15_2]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename15_1,0);
[summfmajor15_3,summfminor15_3,orian15_3,maxf15_3]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename15_2,0);
summfmajor15=mean([summfmajor15_1,summfmajor15_2,summfmajor15_3]);
summfminor15=mean([summfminor15_1,summfminor15_2,summfminor15_3]);
orian15=mean([orian15_1,orian15_2,orian15_3]);
maxf15=mean([maxf15_1,maxf15_2,maxf15_3]);

[summfmajor5_1,summfminor5_1,orian5_1,maxf5_1]=clumpEllipse(N,n,sizx,sizy,0.4,4,filename5,0);
[summfmajor5_2,summfminor5_2,orian5_2,maxf5_2]=clumpEllipse(N,n,sizx,sizy,0.4,4,filename5_1,0);
[summfmajor5_3,summfminor5_3,orian5_3,maxf5_3]=clumpEllipse(N,n,sizx,sizy,0.4,4,filename5_2,0);
summfmajor5=mean([summfmajor5_1,summfmajor5_2,summfmajor5_3]);
summfminor5=mean([summfminor5_1,summfminor5_2,summfminor5_3]);
orian5=mean([orian5_1,orian5_2,orian5_3]);
maxf5=mean([maxf5_1,maxf5_2,maxf5_3]);

[summfmajor01_1,summfminor01_1,orian01_1,maxf01_1]=clumpEllipse(N,n,sizx,sizy,0.3,4,filename01,0);
[summfmajor01_2,summfminor01_2,orian01_2,maxf01_2]=clumpEllipse(N,n,sizx,sizy,0.3,4,filename01_1,0);
[summfmajor01_3,summfminor01_3,orian01_3,maxf01_3]=clumpEllipse(N,n,sizx,sizy,0.3,4,filename01_2,0);
summfmajor01=mean([summfmajor01_1,summfmajor01_2,summfmajor01_3]);
summfminor01=mean([summfminor01_1,summfminor01_2,summfminor01_3]);
orian01=mean([orian01_1,orian01_2,orian01_3]);
maxf01=mean([maxf01_1,maxf01_2,maxf01_3]);

[summfmajor04_1,summfminor04_1,orian04_1,maxf04_1]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename04,0);
[summfmajor04_2,summfminor04_2,orian04_2,maxf04_2]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename04_1,0);
[summfmajor04_3,summfminor04_3,orian04_3,maxf04_3]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename04_2,0);
summfmajor04=mean([summfmajor04_1,summfmajor04_2,summfmajor04_3]);
summfminor04=mean([summfminor04_1,summfminor04_2,summfminor04_3]);
orian04=mean([orian04_1,orian04_2,orian04_3]);
maxf04=mean([maxf04_1,maxf04_2,maxf04_3]);

[summfmajor08_1,summfminor08_1,orian08_1,maxf08_1]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename08,0);
[summfmajor08_2,summfminor08_2,orian08_2,maxf08_2]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename08_1,0);
[summfmajor08_3,summfminor08_3,orian08_3,maxf08_3]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename08_2,0);
summfmajor08=mean([summfmajor08_1,summfmajor08_2,summfmajor08_3]);
summfminor08=mean([summfminor08_1,summfminor08_2,summfminor08_3]);
orian08=mean([orian08_1,orian08_2,orian08_3]);
maxf08=mean([maxf08_1,maxf08_2,maxf08_3]);

[summfmajor12_1,summfminor12_1,orian12_1,maxf12_1]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename12,0);
[summfmajor12_2,summfminor12_2,orian12_2,maxf12_2]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename12_1,0);
[summfmajor12_3,summfminor12_3,orian12_3,maxf12_3]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename12_2,0);
summfmajor12=mean([summfmajor12_1,summfmajor12_2,summfmajor12_3]);
summfminor12=mean([summfminor12_1,summfminor12_2,summfminor12_3]);
orian12=mean([orian12_1,orian12_2,orian12_3]);
maxf12=mean([maxf12_1,maxf12_2,maxf12_3]);

[summfmajor2_1,summfminor2_1,orian2_1,maxf2_1]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename2,0);
[summfmajor2_2,summfminor2_2,orian2_2,maxf2_2]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename2_1,0);
[summfmajor2_3,summfminor2_3,orian2_3,maxf2_3]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename2_2,0);
summfmajor2=mean([summfmajor2_1,summfmajor2_2,summfmajor2_3]);
summfminor2=mean([summfminor2_1,summfminor2_2,summfminor2_3]);
orian2=mean([orian2_1,orian2_2,orian2_3]);
maxf2=mean([maxf2_1,maxf2_2,maxf2_3]);

[summfmajor66b_1,summfminor66b_1,orian66b_1,maxf66b_1]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename66b,0);
[summfmajor66b_2,summfminor66b_2,orian66b_2,maxf66b_2]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename66b_1,0);
[summfmajor66b_3,summfminor66b_3,orian66b_3,maxf66b_3]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename66b_2,0);
summfmajor66b=mean([summfmajor66b_1,summfmajor66b_2,summfmajor66b_3]);
summfminor66b=mean([summfminor66b_1,summfminor66b_2,summfminor66b_3]);
orian66b=mean([orian66b_1,orian66b_2,orian66b_3]);
maxf66b=mean([maxf66b_1,maxf66b_2,maxf66b_3]);

% plotting
cohe=[6.6e-3,1.5e-2,5e-2,0.1,0.4,0.8,1.2,2,6.6];
summfmajor=[summfmajor66,summfmajor15,summfmajor5,summfmajor01,summfmajor04,summfmajor08,summfmajor12,summfmajor2,summfmajor66b];
summfminor=[summfminor66,summfminor15,summfminor5,summfminor01,summfminor04,summfminor08,summfminor12,summfminor2,summfminor66b];
orian=[orian66,orian15,orian5,orian01,orian04,orian08,orian12,orian2,orian66b];
maxf=[maxf66,maxf15,maxf5,maxf01,maxf04,maxf08,maxf12,maxf2,maxf66b];

elip66=(1-([summfminor66_2,summfminor66_3].*[summfminor66_2,summfminor66_3])./([summfmajor66_2,summfmajor66_3].*[summfmajor66_2,summfmajor66_3])).^0.5;
elip15=(1-([summfminor15_1,summfminor15_2,summfminor15_3].*[summfminor15_1,summfminor15_2,summfminor15_3])./([summfmajor15_1,summfmajor15_2,summfmajor15_3].*[summfmajor15_1,summfmajor15_2,summfmajor15_3])).^0.5;
elip5=(1-([summfminor5_1,summfminor5_2,summfminor5_3].*[summfminor5_1,summfminor5_2,summfminor5_3])./([summfmajor5_1,summfmajor5_2,summfmajor5_3].*[summfmajor5_1,summfmajor5_2,summfmajor5_3])).^0.5;
elip01=(1-([summfminor01_1,summfminor01_3].*[summfminor01_1,summfminor01_3])./([summfmajor01_1,summfmajor01_3].*[summfmajor01_1,summfmajor01_3])).^0.5;
elip04=(1-([summfminor04_1,summfminor04_2,summfminor04_3].*[summfminor04_1,summfminor04_2,summfminor04_3])./([summfmajor04_1,summfmajor04_2,summfmajor04_3].*[summfmajor04_1,summfmajor04_2,summfmajor04_3])).^0.5;
elip08=(1-([summfminor08_1,summfminor08_2,summfminor08_3].*[summfminor08_1,summfminor08_2,summfminor08_3])./([summfmajor08_1,summfmajor08_2,summfmajor08_3].*[summfmajor08_1,summfmajor08_2,summfmajor08_3])).^0.5;
elip12=(1-([summfminor12_1,summfminor12_2,summfminor12_3].*[summfminor12_1,summfminor12_2,summfminor12_3])./([summfmajor12_1,summfmajor12_2,summfmajor12_3].*[summfmajor12_1,summfmajor12_2,summfmajor12_3])).^0.5;
elip2=(1-([summfminor2_1,summfminor2_2,summfminor2_3].*[summfminor2_1,summfminor2_2,summfminor2_3])./([summfmajor2_1,summfmajor2_2,summfmajor2_3].*[summfmajor2_1,summfmajor2_2,summfmajor2_3])).^0.5;
elip66b=(1-([summfminor66b_1,summfminor66b_2,summfminor66b_3].*[summfminor66b_1,summfminor66b_2,summfminor66b_3])./([summfmajor66b_1,summfmajor66b_2,summfmajor66b_3].*[summfmajor66b_1,summfmajor66b_2,summfmajor66b_3])).^0.5;

elip=[mean(elip66),mean(elip15),mean(elip5),mean(elip01),mean(elip04),mean(elip08),mean(elip12),mean(elip2),mean(elip66b)];


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% optical depth 1.4 %%%%%%%%%%%%%%%%%%%%%%%%%%%

% density 1

o663=[1.13913,1.06355,1.16759];
o152=[1.32048,1.47337,1.50881];
o552=[1.82967,1.81251,1.81443];
o01=[1.0904,1.11497,1.00059];
o04=[1.52419,1.52393,1.50424];
o08=[0.5875,0.582,0.579202];
o12=[0.474674,0.471918,0.476944];
o2=[0.513012,0.484745,0.504652];
o66=[0.459757,0.395652,0.36837];

Y4410o14=[mean(o663),mean(o152),mean(o552),mean(o01),mean(o04),mean(o08),mean(o12),mean(o2),mean(o66)];
Y4410eo14=[std(o663),std(o152),std(o552),std(o01),std(o04),std(o08),std(o12),std(o2),std(o66)];
%% analysis using ellipse
N=60*1.75;
n=5;
sizx=1.7325815545670283e-09;
sizy=1.7325815545670283e-09;
%density 1
filename66='O_1.4_D05_6.6e-3_000360000.bt';
filename66_1='O_1.4_D05_6.6e-3_000354000.bt';
filename66_2='O_1.4_D05_6.6e-3_000348000.bt';

filename15='O_1.4_D05_1.5e-2_000360000.bt';
filename15_1='O_1.4_D05_1.5e-2_000354000.bt';
filename15_2='O_1.4_D05_1.5e-2_000348000.bt';

filename5='O_1.4_D05_5e-2_000108000.bt';
filename5_1='O_1.4_D05_5e-2_000102000.bt';
filename5_2='O_1.4_D05_5e-2_000096000.bt';

filename01='O_1.4_D05_0.1_000360000.bt';
filename01_1='O_1.4_D05_0.1_000354000.bt';
filename01_2='O_1.4_D05_0.1_000348000.bt';

filename04='O_1.4_D05_0.4_000360000.bt';
filename04_1='O_1.4_D05_0.4_000354000.bt';
filename04_2='O_1.4_D05_0.4_000348000.bt';

filename08='O_1.4_D05_0.8_000318000.bt';
filename08_1='O_1.4_D05_0.8_000330000.bt';
filename08_2='O_1.4_D05_0.8_000324000.bt';

filename12='O_1.4_D05_1.2_000360000.bt';
filename12_1='O_1.4_D05_1.2_000354000.bt';
filename12_2='O_1.4_D05_1.2_000348000.bt';

filename2='O_1.4_D05_2_000114000.bt';
filename2_1='O_1.4_D05_2_000108000.bt';
filename2_2='O_1.4_D05_2_000102000.bt';

filename66b='O_1.4_D05_6.6_000060000.bt';
filename66b_1='O_1.4_D05_6.6_000054000.bt';
filename66b_2='O_1.4_D05_6.6_000048000.bt';
%% calculate size
[oosummfmajor66_1,oosummfminor66_1,ooorian66_1,oomaxf66_1]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename66,0);
[oosummfmajor66_2,oosummfminor66_2,ooorian66_2,oomaxf66_2]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename66_1,0);
[oosummfmajor66_3,oosummfminor66_3,ooorian66_3,oomaxf66_3]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename66_2,0);
osummfmajor66=mean([oosummfmajor66_1,oosummfmajor66_2,oosummfmajor66_3]);
osummfminor66=mean([oosummfminor66_1,oosummfminor66_2,oosummfminor66_3]);
oorian66=mean([ooorian66_1,ooorian66_2,ooorian66_3]);
omaxf66=mean([oomaxf66_1,oomaxf66_2,oomaxf66_3]);

[oosummfmajor15_1,oosummfminor15_1,oorian15_1,omaxf15_1]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename15,0);
[oosummfmajor15_2,oosummfminor15_2,oorian15_2,omaxf15_2]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename15_1,0);
[oosummfmajor15_3,oosummfminor15_3,oorian15_3,omaxf15_3]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename15_2,0);
osummfmajor15=mean([oosummfmajor15_1,oosummfmajor15_2,oosummfmajor15_3]);
osummfminor15=mean([oosummfminor15_1,oosummfminor15_2,oosummfminor15_3]);
oorian15=mean([oorian15_1,oorian15_2,oorian15_3]);
omaxf15=mean([omaxf15_1,omaxf15_2,omaxf15_3]);

[osummfmajor5_1,osummfminor5_1,oorian5_1,omaxf5_1]=clumpEllipse(N,n,sizx,sizy,0.4,4,filename5,0);
[osummfmajor5_2,osummfminor5_2,oorian5_2,omaxf5_2]=clumpEllipse(N,n,sizx,sizy,0.4,4,filename5_1,0);
[osummfmajor5_3,osummfminor5_3,oorian5_3,omaxf5_3]=clumpEllipse(N,n,sizx,sizy,0.4,4,filename5_2,0);
osummfmajor5=mean([osummfmajor5_1,osummfmajor5_2,osummfmajor5_3]);
osummfminor5=mean([osummfminor5_1,osummfminor5_2,osummfminor5_3]);
oorian5=mean([oorian5_1,oorian5_2,oorian5_3]);
omaxf5=mean([omaxf5_1,omaxf5_2,omaxf5_3]);

[osummfmajor01_1,osummfminor01_1,oorian01_1,omaxf01_1]=clumpEllipse(N,n,sizx,sizy,0.3,4,filename01,0);
[osummfmajor01_2,osummfminor01_2,oorian01_2,omaxf01_2]=clumpEllipse(N,n,sizx,sizy,0.3,4,filename01_1,0);
[osummfmajor01_3,osummfminor01_3,oorian01_3,omaxf01_3]=clumpEllipse(N,n,sizx,sizy,0.3,4,filename01_2,0);
osummfmajor01=mean([osummfmajor01_1,osummfmajor01_2,osummfmajor01_3]);
osummfminor01=mean([osummfminor01_1,osummfminor01_2,osummfminor01_3]);
oorian01=mean([oorian01_1,oorian01_2,oorian01_3]);
omaxf01=mean([omaxf01_1,omaxf01_2,omaxf01_3]);


[osummfmajor04_1,osummfminor04_1,oorian04_1,omaxf04_1]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename04,0);
[osummfmajor04_2,osummfminor04_2,oorian04_2,omaxf04_2]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename04_1,0);
[osummfmajor04_3,osummfminor04_3,oorian04_3,omaxf04_3]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename04_2,0);
osummfmajor04=mean([osummfmajor04_1,osummfmajor04_2,osummfmajor04_3]);
osummfminor04=mean([osummfminor04_1,osummfminor04_2,osummfminor04_3]);
oorian04=mean([oorian04_1,oorian04_2,oorian04_3]);
omaxf04=mean([omaxf04_1,omaxf04_2,omaxf04_3]);

[osummfmajor08_1,osummfminor08_1,oorian08_1,omaxf08_1]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename08,0);
[osummfmajor08_2,osummfminor08_2,oorian08_2,omaxf08_2]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename08_1,0);
[osummfmajor08_3,osummfminor08_3,oorian08_3,omaxf08_3]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename08_2,0);
osummfmajor08=mean([osummfmajor08_1,osummfmajor08_2,osummfmajor08_3]);
osummfminor08=mean([osummfminor08_1,osummfminor08_2,osummfminor08_3]);
oorian08=mean([oorian08_1,oorian08_2,oorian08_3]);
omaxf08=mean([omaxf08_1,omaxf08_2,omaxf08_3]);

[osummfmajor12_1,osummfminor12_1,oorian12_1,omaxf12_1]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename12,0);
[osummfmajor12_2,osummfminor12_2,oorian12_2,omaxf12_2]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename12_1,0);
[osummfmajor12_3,osummfminor12_3,oorian12_3,omaxf12_3]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename12_2,0);
osummfmajor12=mean([osummfmajor12_1,osummfmajor12_2,osummfmajor12_3]);
osummfminor12=mean([osummfminor12_1,osummfminor12_2,osummfminor12_3]);
oorian12=mean([oorian12_1,oorian12_2,oorian12_3]);
omaxf12=mean([omaxf12_1,omaxf12_2,omaxf12_3]);

[osummfmajor2_1,osummfminor2_1,oorian2_1,omaxf2_1]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename2,0);
[osummfmajor2_2,osummfminor2_2,oorian2_2,omaxf2_2]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename2_1,0);
[osummfmajor2_3,osummfminor2_3,oorian2_3,omaxf2_3]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename2_2,0);
osummfmajor2=mean([osummfmajor2_1,osummfmajor2_2,osummfmajor2_3]);
osummfminor2=mean([osummfminor2_1,osummfminor2_2,osummfminor2_3]);
oorian2=mean([oorian2_1,oorian2_2,oorian2_3]);
omaxf2=mean([omaxf2_1,omaxf2_2,omaxf2_3]);

[osummfmajor66b_1,osummfminor66b_1,oorian66b_1,omaxf66b_1]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename66b,0);
[osummfmajor66b_2,osummfminor66b_2,oorian66b_2,omaxf66b_2]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename66b_1,0);
[osummfmajor66b_3,osummfminor66b_3,oorian66b_3,omaxf66b_3]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename66b_2,0);
osummfmajor66b=mean([osummfmajor66b_1,osummfmajor66b_2,osummfmajor66b_3]);
osummfminor66b=mean([osummfminor66b_1,osummfminor66b_2,osummfminor66b_3]);
oorian66b=mean([oorian66b_1,oorian66b_2,oorian66b_3]);
omaxf66b=mean([omaxf66b_1,omaxf66b_2,omaxf66b_3]);

elip66o=(1-([oosummfminor66_1,oosummfminor66_2,oosummfminor66_3].*[oosummfminor66_1,oosummfminor66_2,oosummfminor66_3])./([oosummfmajor66_1,oosummfmajor66_2,oosummfmajor66_3].*[oosummfmajor66_1,oosummfmajor66_2,oosummfmajor66_3])).^0.5;
elip15o=(1-([oosummfminor15_1,oosummfminor15_2,oosummfminor15_3].*[oosummfminor15_1,oosummfminor15_2,oosummfminor15_3])./([oosummfmajor15_1,oosummfmajor15_2,oosummfmajor15_3].*[oosummfmajor15_1,oosummfmajor15_2,oosummfmajor15_3])).^0.5;
elip5o=(1-([osummfminor5_1,osummfminor5_2,osummfminor5_3].*[osummfminor5_1,osummfminor5_2,osummfminor5_3])./([osummfmajor5_1,osummfmajor5_2,osummfmajor5_3].*[osummfmajor5_1,osummfmajor5_2,osummfmajor5_3])).^0.5;
elip5o=elip5o(find(~isnan(elip5o)));
elip01o=(1-([osummfminor01_1,osummfminor01_2,osummfminor01_3].*[osummfminor01_1,osummfminor01_2,osummfminor01_3])./([osummfmajor01_1,osummfmajor01_2,osummfmajor01_3].*[osummfmajor01_1,osummfmajor01_2,osummfmajor01_3])).^0.5;
elip04o=(1-([osummfminor04_1,osummfminor04_2,osummfminor04_3].*[osummfminor04_1,osummfminor04_2,osummfminor04_3])./([osummfmajor04_1,osummfmajor04_2,osummfmajor04_3].*[osummfmajor04_1,osummfmajor04_2,osummfmajor04_3])).^0.5;
elip08o=(1-([osummfminor08_1,osummfminor08_2,osummfminor08_3].*[osummfminor08_1,osummfminor08_2,osummfminor08_3])./([osummfmajor08_1,osummfmajor08_2,osummfmajor08_3].*[osummfmajor08_1,osummfmajor08_2,osummfmajor08_3])).^0.5;
elip12o=(1-([osummfminor12_1,osummfminor12_2,osummfminor12_3].*[osummfminor12_1,osummfminor12_2,osummfminor12_3])./([osummfmajor12_1,osummfmajor12_2,osummfmajor12_3].*[osummfmajor12_1,osummfmajor12_2,osummfmajor12_3])).^0.5;
elip2o=(1-([osummfminor2_1,osummfminor2_2,osummfminor2_3].*[osummfminor2_1,osummfminor2_2,osummfminor2_3])./([osummfmajor2_1,osummfmajor2_2,osummfmajor2_3].*[osummfmajor2_1,osummfmajor2_2,osummfmajor2_3])).^0.5;
elip66bo=(1-([osummfminor66b_1,osummfminor66b_2,osummfminor66b_3].*[osummfminor66b_1,osummfminor66b_2,osummfminor66b_3])./([osummfmajor66b_1,osummfmajor66b_2,osummfmajor66b_3].*[osummfmajor66b_1,osummfmajor66b_2,osummfmajor66b_3])).^0.5;

omaxf=[omaxf66,omaxf15,omaxf5,omaxf01,omaxf04,omaxf08,omaxf12,omaxf2,omaxf66b];

coheo=[6.6e-3,1.5e-2,5e-2,0.1,0.4,0.8,1.2,2,6.6];
osummfmajor=[osummfmajor66,osummfmajor15,osummfmajor5,osummfmajor01,osummfmajor04,osummfmajor08,osummfmajor12,osummfmajor2,osummfmajor66b];
osummfminor=[osummfminor66,osummfminor15,osummfminor5,osummfminor01,osummfminor04,osummfminor08,osummfminor12,osummfminor2,osummfminor66b];
oorian=[oorian66,oorian15,oorian5,oorian01,oorian04,oorian08,oorian12,oorian2,oorian66b];
elipo=[mean(elip66o),mean(elip15o),mean(elip5o),mean(elip01o),mean(elip04o),mean(elip08o),mean(elip12o),mean(elip2o),mean(elip66bo)];

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% optical depth 1.8 %%%%%%%%%%%%%%%%%%%%%%%%%%%
o663=[1.28342,1.43735,1.36955];
o152=[0.9313,1.03343,1.08496];
o552=[1.25263,1.14914,1.01489];
o01=[1.2351,1.1495,0.992422];
o04=[0.876071,0.94587,0.911352];
o08=[0.729116,0.684873,0.663976];
o12=[0.675201,0.701983,0.719692];
o2=[0.575739,0.579569,0.560575];
o66=[1.50781,1.22771,0.993848]; % only has 1 file

Y4410o18=[mean(o663),mean(o152),mean(o552),mean(o01),mean(o04),mean(o08),mean(o12),mean(o2),mean(o66)];
Y4410eo18=[std(o663),std(o152),std(o552),std(o01),std(o04),std(o08),std(o12),std(o2),std(o66)];

%% analysis using ellipse
N=60*2.25;
n=5;
sizx=2.2276048558718937e-09;
sizy=2.2276048558718937e-09;
%density 1
filename66='O_1.8_D05_6.6e-3_000360000.bt';
filename66_1='O_1.8_D05_6.6e-3_000354000.bt';
filename66_2='O_1.8_D05_6.6e-3_000348000.bt';

filename15='O_1.8_D05_1.5e-2_000360000.bt';
filename15_1='O_1.8_D05_1.5e-2_000354000.bt';
filename15_2='O_1.8_D05_1.5e-2_000348000.bt';

filename5='O_1.8_D05_5e-2_000360000.bt';
filename5_1='O_1.8_D05_5e-2_000354000.bt';
filename5_2='O_1.8_D05_5e-2_000348000.bt';

filename01='O_1.8_D05_0.1_000360000.bt';
filename01_1='O_1.8_D05_0.1_000354000.bt';
filename01_2='O_1.8_D05_0.1_000348000.bt';

filename04='O_1.8_D05_0.4_000360000.bt';
filename04_1='O_1.8_D05_0.4_000354000.bt';
filename04_2='O_1.8_D05_0.4_000348000.bt';

filename08='O_1.8_D05_0.8_000360000.bt';
filename08_1='O_1.8_D05_0.8_000354000.bt';
filename08_2='O_1.8_D05_0.8_000348000.bt';

filename12='O_1.8_D05_1.2_000360000.bt';
filename12_1='O_1.8_D05_1.2_000354000.bt';
filename12_2='O_1.8_D05_1.2_000348000.bt';

filename2='O_1.8_D05_2_000186000.bt';
filename2_1='O_1.8_D05_2_000180000.bt';
filename2_2='O_1.8_D05_2_000174000.bt';

filename66b='O_1.8_D05_6.6_000024000.bt';
filename66b_1='O_1.8_D05_6.6_000018000.bt';
filename66b_2='O_1.8_D05_6.6_000012000.bt';
%% calculate size
[oosummfmajor66_1,oosummfminor66_1,ooorian66_1,oomaxf66_1]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename66,0);
[oosummfmajor66_2,oosummfminor66_2,ooorian66_2,oomaxf66_2]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename66_1,0);
[oosummfmajor66_3,oosummfminor66_3,ooorian66_3,oomaxf66_3]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename66_2,0);
osummfmajor66=mean([oosummfmajor66_1,oosummfmajor66_2,oosummfmajor66_3]);
osummfminor66=mean([oosummfminor66_1,oosummfminor66_2,oosummfminor66_3]);
oorian66=mean([ooorian66_1,ooorian66_2,ooorian66_3]);
omaxf66=mean([oomaxf66_1,oomaxf66_2,oomaxf66_3]);

[oosummfmajor15_1,oosummfminor15_1,oorian15_1,omaxf15_1]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename15,0);
[oosummfmajor15_2,oosummfminor15_2,oorian15_2,omaxf15_2]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename15_1,0);
[oosummfmajor15_3,oosummfminor15_3,oorian15_3,omaxf15_3]=clumpEllipse(N,n,sizx,sizy,0.5,4,filename15_2,0);
osummfmajor15=mean([oosummfmajor15_1,oosummfmajor15_2,oosummfmajor15_3]);
osummfminor15=mean([oosummfminor15_1,oosummfminor15_2,oosummfminor15_3]);
oorian15=mean([oorian15_1,oorian15_2,oorian15_3]);
omaxf15=mean([omaxf15_1,omaxf15_2,omaxf15_3]);

[osummfmajor5_1,osummfminor5_1,oorian5_1,omaxf5_1]=clumpEllipse(N,n,sizx,sizy,0.4,4,filename5,0);
[osummfmajor5_2,osummfminor5_2,oorian5_2,omaxf5_2]=clumpEllipse(N,n,sizx,sizy,0.4,4,filename5_1,0);
[osummfmajor5_3,osummfminor5_3,oorian5_3,omaxf5_3]=clumpEllipse(N,n,sizx,sizy,0.4,4,filename5_2,0);
osummfmajor5=mean([osummfmajor5_1,osummfmajor5_2,osummfmajor5_3]);
osummfminor5=mean([osummfminor5_1,osummfminor5_2,osummfminor5_3]);
oorian5=mean([oorian5_1,oorian5_2,oorian5_3]);
omaxf5=mean([omaxf5_1,omaxf5_2,omaxf5_3]);

[osummfmajor01_1,osummfminor01_1,oorian01_1,omaxf01_1]=clumpEllipse(N,n,sizx,sizy,0.3,4,filename01,0);
[osummfmajor01_2,osummfminor01_2,oorian01_2,omaxf01_2]=clumpEllipse(N,n,sizx,sizy,0.3,4,filename01_1,0);
[osummfmajor01_3,osummfminor01_3,oorian01_3,omaxf01_3]=clumpEllipse(N,n,sizx,sizy,0.3,4,filename01_2,0);
osummfmajor01=mean([osummfmajor01_1,osummfmajor01_2,osummfmajor01_3]);
osummfminor01=mean([osummfminor01_1,osummfminor01_2,osummfminor01_3]);
oorian01=mean([oorian01_1,oorian01_2,oorian01_3]);
omaxf01=mean([omaxf01_1,omaxf01_2,omaxf01_3]);


[osummfmajor04_1,osummfminor04_1,oorian04_1,omaxf04_1]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename04,0);
[osummfmajor04_2,osummfminor04_2,oorian04_2,omaxf04_2]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename04_1,0);
[osummfmajor04_3,osummfminor04_3,oorian04_3,omaxf04_3]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename04_2,0);
osummfmajor04=mean([osummfmajor04_1,osummfmajor04_2,osummfmajor04_3]);
osummfminor04=mean([osummfminor04_1,osummfminor04_2,osummfminor04_3]);
oorian04=mean([oorian04_1,oorian04_2,oorian04_3]);
omaxf04=mean([omaxf04_1,omaxf04_2,omaxf04_3]);

[osummfmajor08_1,osummfminor08_1,oorian08_1,omaxf08_1]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename08,0);
[osummfmajor08_2,osummfminor08_2,oorian08_2,omaxf08_2]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename08_1,0);
[osummfmajor08_3,osummfminor08_3,oorian08_3,omaxf08_3]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename08_2,0);
osummfmajor08=mean([osummfmajor08_1,osummfmajor08_2,osummfmajor08_3]);
osummfminor08=mean([osummfminor08_1,osummfminor08_2,osummfminor08_3]);
oorian08=mean([oorian08_1,oorian08_2,oorian08_3]);
omaxf08=mean([omaxf08_1,omaxf08_2,omaxf08_3]);


[osummfmajor12_1,osummfminor12_1,oorian12_1,omaxf12_1]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename12,0);
[osummfmajor12_2,osummfminor12_2,oorian12_2,omaxf12_2]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename12_1,0);
[osummfmajor12_3,osummfminor12_3,oorian12_3,omaxf12_3]=clumpEllipse(N,n,sizx*2,sizy*2,0.1,4*2,filename12_2,0);
osummfmajor12=mean([osummfmajor12_1,osummfmajor12_2,osummfmajor12_3]);
osummfminor12=mean([osummfminor12_1,osummfminor12_2,osummfminor12_3]);
oorian12=mean([oorian12_1,oorian12_2,oorian12_3]);
omaxf12=mean([omaxf12_1,omaxf12_2,omaxf12_3]);

[osummfmajor2_1,osummfminor2_1,oorian2_1,omaxf2_1]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename2,0);
[osummfmajor2_2,osummfminor2_2,oorian2_2,omaxf2_2]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename2_1,0);
[osummfmajor2_3,osummfminor2_3,oorian2_3,omaxf2_3]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename2_2,0);
osummfmajor2=mean([osummfmajor2_1,osummfmajor2_2,osummfmajor2_3]);
osummfminor2=mean([osummfminor2_1,osummfminor2_2,osummfminor2_3]);
oorian2=mean([oorian2_1,oorian2_2,oorian2_3]);
omaxf2=mean([omaxf2_1,omaxf2_2,omaxf2_3]);

[osummfmajor66b_1,osummfminor66b_1,oorian66b_1,omaxf66b_1]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename66b,0);
[osummfmajor66b_2,osummfminor66b_2,oorian66b_2,omaxf66b_2]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename66b_1,0);
[osummfmajor66b_3,osummfminor66b_3,oorian66b_3,omaxf66b_3]=clumpEllipse(N,n,sizx,sizy,0.1,4,filename66b_2,0);
osummfmajor66b=mean([osummfmajor66b_1,osummfmajor66b_2,osummfmajor66b_3]);
osummfminor66b=mean([osummfminor66b_1,osummfminor66b_2,osummfminor66b_3]);
oorian66b=mean([oorian66b_1,oorian66b_2,oorian66b_3]);
omaxf66b=mean([omaxf66b_1,omaxf66b_2,omaxf66b_3]);

elip66o18=(1-([oosummfminor66_1,oosummfminor66_2,oosummfminor66_3].*[oosummfminor66_1,oosummfminor66_2,oosummfminor66_3])./([oosummfmajor66_1,oosummfmajor66_2,oosummfmajor66_3].*[oosummfmajor66_1,oosummfmajor66_2,oosummfmajor66_3])).^0.5;
elip15o18=(1-([oosummfminor15_1,oosummfminor15_2,oosummfminor15_3].*[oosummfminor15_1,oosummfminor15_2,oosummfminor15_3])./([oosummfmajor15_1,oosummfmajor15_2,oosummfmajor15_3].*[oosummfmajor15_1,oosummfmajor15_2,oosummfmajor15_3])).^0.5;
elip5o18=(1-([osummfminor5_1,osummfminor5_2,osummfminor5_3].*[osummfminor5_1,osummfminor5_2,osummfminor5_3])./([osummfmajor5_1,osummfmajor5_2,osummfmajor5_3].*[osummfmajor5_1,osummfmajor5_2,osummfmajor5_3])).^0.5;
elip01o18=(1-([osummfminor01_1,osummfminor01_2,osummfminor01_3].*[osummfminor01_1,osummfminor01_2,osummfminor01_3])./([osummfmajor01_1,osummfmajor01_2,osummfmajor01_3].*[osummfmajor01_1,osummfmajor01_2,osummfmajor01_3])).^0.5;
elip04o18=(1-([osummfminor04_1,osummfminor04_2,osummfminor04_3].*[osummfminor04_1,osummfminor04_2,osummfminor04_3])./([osummfmajor04_1,osummfmajor04_2,osummfmajor04_3].*[osummfmajor04_1,osummfmajor04_2,osummfmajor04_3])).^0.5;
elip08o18=(1-([osummfminor08_1,osummfminor08_2,osummfminor08_3].*[osummfminor08_1,osummfminor08_2,osummfminor08_3])./([osummfmajor08_1,osummfmajor08_2,osummfmajor08_3].*[osummfmajor08_1,osummfmajor08_2,osummfmajor08_3])).^0.5;
elip12o18=(1-([osummfminor12_1,osummfminor12_2,osummfminor12_3].*[osummfminor12_1,osummfminor12_2,osummfminor12_3])./([osummfmajor12_1,osummfmajor12_2,osummfmajor12_3].*[osummfmajor12_1,osummfmajor12_2,osummfmajor12_3])).^0.5;
elip2o18=(1-([osummfminor2_1,osummfminor2_2,osummfminor2_3].*[osummfminor2_1,osummfminor2_2,osummfminor2_3])./([osummfmajor2_1,osummfmajor2_2,osummfmajor2_3].*[osummfmajor2_1,osummfmajor2_2,osummfmajor2_3])).^0.5;
elip66bo18=(1-([osummfminor66b_1,osummfminor66b_2,osummfminor66b_3].*[osummfminor66b_1,osummfminor66b_2,osummfminor66b_3])./([osummfmajor66b_1,osummfmajor66b_2,osummfmajor66b_3].*[osummfmajor66b_1,osummfmajor66b_2,osummfmajor66b_3])).^0.5;

omaxfo18=[omaxf66,omaxf15,omaxf5,omaxf01,omaxf04,omaxf08,omaxf12,omaxf2,omaxf66b];

osummfmajoro18=[osummfmajor66,osummfmajor15,osummfmajor5,osummfmajor01,osummfmajor04,osummfmajor08,osummfmajor12,osummfmajor2,osummfmajor66b];
osummfminoro18=[osummfminor66,osummfminor15,osummfminor5,osummfminor01,osummfminor04,osummfminor08,osummfminor12,osummfminor2,osummfminor66b];
ooriano18=[oorian66,oorian15,oorian5,oorian01,oorian04,oorian08,oorian12,oorian2,oorian66b];
elipo18=[mean(elip66o18),mean(elip15o18),mean(elip5o18),mean(elip01o18),mean(elip04o18),mean(elip08o18),mean(elip12o18),mean(elip2o18),mean(elip66bo18)];

%% plotting OD1.4 analysis vs OD0.8
% poly fit for major axis
p_od14=polyfit(log(coheo),osummfmajor./2,1);
m_od14=p_od14(1);
b_od14=p_od14(2);

p_od08=polyfit(log(cohe),summfmajor./2,1);
m_od08=p_od08(1);
b_od08=p_od08(2);

p_od18=polyfit(log(cohe),osummfmajoro18./2,1);
m_od18=p_od18(1);
b_od18=p_od18(2);

figure
h(1)=subplot(3,2,1);
semilogx(x1,Y4410o14,'b--o')
hold on
semilogx(x1,Y4410D05,'r--+')
semilogx(x1,Y4410o18,'k--*')
xlim([5e-3 6.9])
ylabel('\tau_P','FontSize',15)
%legend('\tau_P, \tau_D=1.4','\tau_P, \tau_D=0.8','\tau_P, \tau_D=1.8')

h(3)=subplot(3,2,3);
str_1=sprintf('\tau_D=1.4 Fit %.1f*log(cohe)+%.1f',m_od14,b_od14);
str_2=sprintf('\tau_D=0.8 Fit %.1f*log(cohe)+%.1f',m_od08,b_od08);
str_3=sprintf('\tau_D=1.8 Fit %.1f*log(cohe)+%.1f',m_od18,b_od18);

semilogx(coheo,osummfmajor./2,'b--o')
hold on
semilogx(cohe,summfmajor./2,'r--+')
semilogx(cohe,osummfmajoro18./2,'k--*')
semilogx(coheo,log(coheo)*m_od14+b_od14,'b-')
semilogx(cohe,log(cohe)*m_od08+b_od08,'r-')
semilogx(cohe,log(cohe)*m_od18+b_od18,'k-')
xlim([5e-3 6.9])
ylabel('Semimajor Axis [m]','FontSize',15)
%legend(str_1,str_2,str_3,'Major Axis \tau_D=1.4 [m]','Major Axis \tau_D=0.8 [m]','Major Axis \tau_D=1.8 [m]')
%legend(str_1,str_2,str_3)

h(5)=subplot(3,2,5);
semilogx(coheo,osummfminor./2,'b--o')
hold on
semilogx(cohe,summfminor./2,'r--+')
semilogx(cohe,osummfminoro18./2,'k--*')
xlim([5e-3 6.9])
xlabel('Cohesion [Pa]','FontSize',15)
ylabel('Semiminor Axis [m]','FontSize',15)
%legend('Minor Axis \tau_D=1.4 [m]','Minor Axis \tau_D=0.8 [m]','Minor Axis \tau_D=1.8 [m]')

h(4)=subplot(3,2,4);
semilogx(coheo,oorian,'b--o')
hold on 
semilogx(cohe,orian,'r--+')
semilogx(coheo,ooriano18,'k--*')
xlim([5e-3 6.9])
ylabel('Orientation [degree]','FontSize',15)
%legend('Orientation \tau_D=1.4','Orientation \tau_D=0.8','Orientation \tau_D=1.8')

h(2)=subplot(3,2,2);
semilogx(coheo,omaxf,'b--o')
hold on 
semilogx(cohe,maxf,'r--+')
semilogx(coheo,omaxfo18,'k--*')
xlim([5e-3 6.9])
ylabel('Max Projected Particle/Cell','FontSize',15)
%legend('Max Density \tau_D=1.4','Max Density \tau_D=0.8','Max Density \tau_D=1.8')

h(6)=subplot(3,2,6);
semilogx(coheo,elipo,'b--o')
hold on
semilogx(cohe,elip,'r--+')
semilogx(coheo,elipo18,'k--*')
xlim([5e-3 6.9])
xlabel('Cohesion [Pa]','FontSize',15)
ylabel('Ellipticity','FontSize',15)
%legend('Ellipticity, \tau_D=1.4','Ellipticity, \tau_D=0.8','Ellipticity, \tau_D=1.8')

set(h(1),'xticklabel',[]);
set(h(2),'xticklabel',[]);
set(h(3),'xticklabel',[]);
set(h(4),'xticklabel',[]);

pos=get(h,'position');
pos{3}(2)=pos{1}(2)-pos{1}(4)-0.02;
pos{5}(2)=pos{3}(2)-pos{1}(4)-0.02;

pos{4}(2)=pos{2}(2)-pos{2}(4)-0.02;
pos{6}(2)=pos{4}(2)-pos{2}(4)-0.02;

set(h(1),'position',pos{1});
set(h(3),'position',pos{3});
set(h(5),'position',pos{5});
set(h(2),'position',pos{2});
set(h(4),'position',pos{4});
set(h(6),'position',pos{6});
suptitle('Analysis for Particle Material Density 0.5 g/cm^3')