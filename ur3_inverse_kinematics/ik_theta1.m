function [theta1_1,theta1_2] = ik_theta1(Px,Py,d4,d6,r23,r13)
    m=d6*r23-Py;
    n=r13*d6-Px;
    theta1_1 = atan2(m,n) -  atan2(d4,  sqrt(m^2+n^2-d4^2));
    theta1_2 = atan2(m,n) -  atan2(d4, -sqrt(m^2+n^2-d4^2));
end
