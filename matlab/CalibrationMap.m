% Load calibration points and transform into a map for uncertainty analysis
clc;clear all;

drive ='E';         % the drive leter where the data is being stored.

path=strcat(drive,':\Data2\Ely_May28th\Calibration\location 7');cd(path);

file='cal00L.txt';
fopen(file);
A=importdata(file,',',7);           Lf    = A.data;
A=importdata(file,',',9);           Lc    = A.data;

file='cal00R.txt';
fopen(file);
A=importdata(file,',',7);           Rf    = A.data;
A=importdata(file,',',9);           Rc    = A.data;

A=importdata('Ely_May28th.grd');    Sv    = A.data; 

Li=flipdim(imread('cal00L','tif'),1);
Ri=imread('cal00R','tif');

% for i=1:length(Lc)
%     for j=1:2
%     Lc(i,j)=Lc(i,j)-Lf(1,j);
%     end
% end
% 
% for i=1:length(Rc)
%     for j=1:2
%     Rc(i,j)=Rc(i,j)-Rf(1,j);
%     end
% end
% Lf(1,1:2)=0; Rf(1,1:2)=0;



% Sv variable formats, spatial locations plus Left and Right 
% spatial correlation components. 
        % X mm,Y mm,Z mm,
        % L dX/dx, L dX/dy, L dX/dz,
        % L dY/dx, L dY/dy, L dY/dz,
        % R dX/dx, R dX/dy, R dX/dz,
        % R dY/dx, R dY/dy, R dY/dz

figure (1); hold on;
    colormap('bone');contourf(Li);
    h=plot(Lc(:,1),Lc(:,2),'gd',Lf(1,1),Lf(1,2),'go');
    set(h(1),'markersize',16);
    axis equal;
figure (2); hold on;
    plot(Rc(:,1),Rc(:,2),'r.',Rf(1,1),Rf(1,2),'ro');
