function [ theta5_1,theta5_2,theta5_3,theta5_4] = ik_theta5(theta1_1,theta1_2,r13,r23)
    A=r13*sin(theta1_1)-r23*cos(theta1_1);
    theta5_1=atan2(sqrt(1-A^2),A);
    theta5_2=atan2(-sqrt(1-A^2),A);
    A=r13*sin(theta1_2)-r23*cos(theta1_2);
    theta5_3=atan2(sqrt(1-A^2),A);
    theta5_4=atan2(-sqrt(1-A^2),A);
    

end