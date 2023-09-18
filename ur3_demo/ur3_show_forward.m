function ur3_show_forward(joints)
    % end joint 
    
    joint_rads=joints/180*pi;
    T = ur3_forward_kinematics(6,joint_rads)

    base_xyz =[0 0 0];
    robot = ur3_robot(base_xyz);
    robot.display();    
    robot.plot(joint_rads);
    
end