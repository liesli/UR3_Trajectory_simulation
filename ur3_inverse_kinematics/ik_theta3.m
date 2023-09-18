function [theta3_1,theta3_2] = ik_theta3(joints156,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz)
    theta1=joints156(1);
    theta6=joints156(3);
    mmm=d5*(sin(theta6)*(r11*cos(theta1)+r21*sin(theta1))+cos(theta6)*(r12*cos(theta1)+r22*sin(theta1)))+...
        +Px*cos(theta1)-d6*(r13*cos(theta1)+r23*sin(theta1))+Py*sin(theta1);
    nnn=d5*(r32*cos(theta6)+r31*sin(theta6))+Pz-d1-r33*d6;
    theta3_1 = acos((mmm^2+nnn^2-a2^2-a3^2)/(2*a2*a3));
    theta3_2 = -acos((mmm^2+nnn^2-a2^2-a3^2)/(2*a2*a3));
end