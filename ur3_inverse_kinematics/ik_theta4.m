function pack123456=ik_theta4(joints12356,r11,r21,r31,r12,r22,r32)
         theta1=joints12356(1);
         theta2=joints12356(2);
         theta3=joints12356(3);
         theta5=joints12356(4);
         theta6=joints12356(5);
         theta4=atan2(-sin(theta6)*(r11*cos(theta1)+r21*sin(theta1))-cos(theta6)*(r12*cos(theta1)+r22*sin(theta1)),r32*cos(theta6)+r31*sin(theta6))-theta2-theta3;
        
         pack123456=[theta1,theta2,theta3,theta4,theta5,theta6];
         

  
end