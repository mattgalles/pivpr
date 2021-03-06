% This script creates the similarity plots for axial velocity profiles
% by velocity, and by station.
clc; clear all; close all;
tic();

% Inputs
Runs=[1:38 41:70];
Station =1;

% drive information
drive ='E'; 
d=':\Data2\Ely_May28th\Vector\';
Vin=importdata(strcat(drive,':\Data2\Vindex.txt'));

% plot generation
for i = Runs
    VaxProf{i}=xlsread(strcat(drive,d,num2str(i),'\VaxProfile',num2str(i),'.xls'));
    VazProf{i}=xlsread(strcat(drive,d,num2str(i),'\VazProfile',num2str(i),'.xls'));
    
    Vcore(i)=min(VaxProf{i}(:,2));
    
    leg{i}=strcat(num2str(Vin(i,2)),' m/s');
    legv(i)=strcat(num2str(rem(Vin(i,1)-1,10)));
    fprintf('finished run number %2.0f \n',i);
end

a=VaxProf;
b=VazProf;

% This line corrects for a linear scaling error that occured during
% data processing resulting from an incorrect delta(t) value.
a{15}(:,2)=1.6.*a{15}(:,2);


%plot by velocity, constant stations
ConstStations{1}=1:10;
ConstStations{2}=11:20;
ConstStations{3}=21:30;
ConstStations{4}=31:38;
ConstStations{5}=41:50;
ConstStations{6}=51:60;
ConstStations{7}=61:70;

for m=1:7
Runs = ConstStations{m};
figure(m); hold on; c=varycolor(length(ConstStations{m}));
j(1)=plot(a{Runs(1)}(:,1),a{Runs(1)}(:,2),'Color',c(1,:));
j(2)=plot(a{Runs(2)}(:,1),a{Runs(2)}(:,2),'Color',c(2,:));
j(3)=plot(a{Runs(3)}(:,1),a{Runs(3)}(:,2),'Color',c(3,:));
j(4)=plot(a{Runs(4)}(:,1),a{Runs(4)}(:,2),'Color',c(4,:));
j(5)=plot(a{Runs(5)}(:,1),a{Runs(5)}(:,2),'Color',c(5,:));
j(6)=plot(a{Runs(6)}(:,1),a{Runs(6)}(:,2),'Color',c(6,:));
j(7)=plot(a{Runs(7)}(:,1),a{Runs(7)}(:,2),'Color',c(7,:));
j(8)=plot(a{Runs(8)}(:,1),a{Runs(8)}(:,2),'Color',c(8,:));
if m~=4
j(9)=plot(a{Runs(9)}(:,1),a{Runs(9)}(:,2),'Color',c(9,:));
j(10)=plot(a{Runs(10)}(:,1),a{Runs(10)}(:,2),'Color',c(10,:));
end

if m~=4
    set(j(1:10),'LineWidth',1.5); grid on;
else
    set(j(1:8),'LineWidth',1.5); grid on;
end

if m~=4
legend(leg{Runs(1)},leg{Runs(2)},leg{Runs(3)},...
    leg{Runs(4)},leg{Runs(5)},leg{Runs(6)},...
    leg{Runs(7)},leg{Runs(8)},leg{Runs(9)},...
    leg{Runs(10)});
else 
legend(leg{Runs(1)},leg{Runs(2)},leg{Runs(3)},...
    leg{Runs(4)},leg{Runs(5)},leg{Runs(6)},...
    leg{Runs(7)},leg{Runs(8)});
end

legend('Location','SouthEast');
xlabel('Distance to core (mm)'); ylabel('V_a_x_i_a_l as percent of free stream'); 
t= strcat('Axial Velocity profiles at station  ',num2str(m),...
    ' as a function of velocity');
title(t);
axis([-70 70 0.75 1.1]);
end

for z=1:7
     form='-djpeg85';res='-r800'; 
    print(figure (z),strcat('AxialVelocityStation',num2str(z)),form,res);
end

close all

%plot by Station, "constant" velocities.
ConstVelocities{1}=1:10:61;
ConstVelocities{2}=2:10:62;
ConstVelocities{3}=3:10:63;
ConstVelocities{4}=4:10:64;
ConstVelocities{5}=5:10:65;
ConstVelocities{6}=6:10:66;
ConstVelocities{7}=7:10:67;
ConstVelocities{8}=8:10:68;
ConstVelocities{9}=[9 19 29 49 59 69];
ConstVelocities{10}=[10 20 30 50 60 70];

for n=1:10
    Runs = ConstVelocities{n};
figure(n); hold on; c=varycolor(length(ConstVelocities{n}));
j(1)=plot(a{Runs(1)}(:,1),a{Runs(1)}(:,2),'Color',c(1,:));
j(2)=plot(a{Runs(2)}(:,1),a{Runs(2)}(:,2),'Color',c(2,:));
j(3)=plot(a{Runs(3)}(:,1),a{Runs(3)}(:,2),'Color',c(3,:));
j(4)=plot(a{Runs(4)}(:,1),a{Runs(4)}(:,2),'Color',c(4,:));
j(5)=plot(a{Runs(5)}(:,1),a{Runs(5)}(:,2),'Color',c(5,:));
j(6)=plot(a{Runs(6)}(:,1),a{Runs(6)}(:,2),'Color',c(6,:));
if and(n~=9,n~=10)
j(7)=plot(a{Runs(7)}(:,1),a{Runs(7)}(:,2),'Color',c(7,:));

end

if and(n~=9,n~=10)
    set(j(1:7),'LineWidth',1.5); grid on;
else
    set(j(1:6),'LineWidth',1.5); grid on;
end

if and(n~=9,n~=10)
legend(legv{Runs(1)},legv{Runs(2)},legv{Runs(3)},...
    legv{Runs(4)},legv{Runs(5)},legv{Runs(6)},...
    legv{Runs(7)});
else 
legend(legv{Runs(1)},legv{Runs(2)},legv{Runs(3)},...
    legv{Runs(4)},legv{Runs(5)},legv{Runs(6)});
end

legend('Location','SouthEast');
xlabel('Distance to core (mm)'); ylabel('V_a_x_i_a_l as percent of free stream'); 
t= strcat('Axial Velocity profiles at station  ',num2str(m),...
    ' as a function of velocity');
title(t);
axis([-70 70 0.75 1.1]);

end

for zz=1:10
     form='-djpeg85';res='-r800'; 
    print(figure (zz),strcat('AxialVelocity',num2str(zz)),form,res);
end





















