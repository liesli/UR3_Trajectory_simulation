function joints156 = ik_theta6(theta1,theta5,r11,r21,r12,r22)
    mm=(r11*sin(theta1)-r21*cos(theta1))/theta5;
    nn=(-r12*sin(theta1)+r22*cos(theta1))/theta5;
    theta6 = atan2(nn,mm);
    joints156=[theta1,theta5,theta6];
    
end

    
    
    