function  robot = ur3_robot(base_xyz)

    joint_angles = [0 0 0 0 0 0];
    joint_rads = joint_angles/180*pi;
    %% DH  data
    [alpha,a,d,qlim1,qlim2,qlim3,qlim4,qlim5,qlim6] = ur3_dh();
    %% link
    L(1) = Link([joint_rads(1),d(1),a(1),alpha(1)],'standard','qlim',qlim1);
    L(2) = Link([joint_rads(2),d(2),a(2),alpha(2)],'standard','qlim',qlim2);
    L(3) = Link([joint_rads(3),d(3),a(3),alpha(3)],'standard','qlim',qlim3);
    L(4) = Link([joint_rads(4),d(4),a(4),alpha(4)],'standard','qlim',qlim4);
    L(5) = Link([joint_rads(5),d(5),a(5),alpha(5)],'standard','qlim',qlim5);
    L(6) = Link([joint_rads(6),d(6),a(6),alpha(6)],'standard','qlim',qlim6);
      

    %% robot
    robot = SerialLink(L,'name','ur3');
    robot.base=transl(base_xyz(1),base_xyz(2),base_xyz(3));
    
    
    

    
    
    
end
