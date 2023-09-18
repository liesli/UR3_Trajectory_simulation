function joints12356 = ik_theta2(joints1356,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz)
    theta1=joints1356(1);
    theta3=joints1356(2);
    theta5=joints1356(3);
    theta6=joints1356(4);
    mmm=d5*(sin(theta6)*(r11*cos(theta1)+r21*sin(theta1))+cos(theta6)*(r12*cos(theta1)+r22*sin(theta1)))+...
        +Px*cos(theta1)-d6*(r13*cos(theta1)+r23*sin(theta1))+Py*sin(theta1);
    nnn=d5*(r32*cos(theta6)+r31*sin(theta6))+Pz-d1-r33*d6;
    s2=((a3*cos(theta3)+a2)*nnn-a3*sin(theta3)*mmm)/(a2^2+a3^2+2*a2*a3*cos(theta3));
    c2=(mmm+a3*sin(theta3)*s2)/(a3*cos(theta3)+a2);
    theta2=atan2(s2,c2);
    joints12356=[theta1,theta2,theta3,theta5,theta6];
end