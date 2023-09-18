

  r11= -0.0895;   r12= 0.1066 ;   r13=0.9903; Px= 0.2424;
   r21=-0.6365;    r22=0.7586;   r23=-0.1392;   Py=0.0061;
   r31=-0.7660;   r32=-0.6428;         r33=0;   Pz=-0.0646;
  d4=0.11235;  d6=0.0819;

 [theta1_1,theta1_2] = ik_theta1(Px,Py,d4,d6,r23,r13);

function [theta1_1,theta1_2] = ik_theta1(Px,Py,d4,d6,r23,r13)
    m=d6*r23-Py;
    n=r13*d6-Px;
    theta1_1 = atan2(m,n) -atan2(d4,  sqrt(m^2+n^2-d4^2));
    theta1_2 = atan2(m,n) - atan2(d4, -sqrt(m^2+n^2-d4^2));
end
 