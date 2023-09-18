function [alpha,a,d,qlim1,qlim2,qlim3,qlim4,qlim5,qlim6] = ur3_dh()

    
    alpha(1)=pi/2;     a(1)=0;        d(1)=0.1519;     
    alpha(2)=0;     a(2)=-0.24365;     d(2)=0; 
    alpha(3)=0;     a(3)=-0.21325;   d(3)=0;     
    alpha(4)=pi/2;  a(4)=0;          d(4)=0.11235;  
    alpha(5)=-pi/2;  a(5)=0;          d(5)=0.08535;     
    alpha(6)=0;     a(6)=0;           d(6)=0.0819;     

    qlim1=[-180, 180]/180*pi;
    qlim2=[-180, 180]/180*pi;
    qlim3=[-180, 180]/180*pi;
    qlim4=[-180, 180]/180*pi;
    qlim5=[-180, 180]/180*pi;
    qlim6=[-180, 180]/180*pi;


    

end