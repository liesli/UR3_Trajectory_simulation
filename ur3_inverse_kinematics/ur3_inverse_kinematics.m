function [valid,result_list] = ur3_inverse_kinematics(cartesian_position_DH)
    %return 8 sets of rad 
    [alpha_data,a_data,d,qlim1,qlim2,qlim3,qlim4,qlim5,qlim6] = ur3_dh();
    d1=d(1);
    d3=d(3);
    d4=d(4);
    d5=d(5);
    d6=d(6);
    a2=a_data(2);
    a3=a_data(3);
    qlim_list={qlim1,qlim2,qlim3,qlim4,qlim5,qlim6};

%     valid =  ik_valid(cartesian_position_DH,a2,a3,d4,d5,d6);
    valid=1;
    if valid
        [joints1,joints2,joints3,joints4,joints5,joints6,joints7,joints8] = inverse_kinematics_8_result(cartesian_position_DH);
        result_list={joints1,joints2,joints3,joints4,joints5,joints6,joints7,joints8};
        
        
        %result_list= in_robot_joint_limit(qlim_list,joints_list);
        %if size(result_list,1)==0
        %    valid=0;
        %end
        
    else
        result_list={};
    end
end

function results = in_robot_joint_limit(qlim_list,joints_list)
    results=[];
    for i =1:8
        joints = cell2mat(joints_list(i));
        valid=1;
        %4-6 matlab ������
        for j=1:3
            joint = joints(j);
            qlim = cell2mat(qlim_list(j));
            if joint < qlim(1) || joint > qlim(2)
                valid=0;
            end
        end
        
        if valid
            results=[results;joints];
        end
        
        
        
    end
    
    

end

function [joints1,joints2,joints3,joints4,joints5,joints6,joints7,joints8] = inverse_kinematics_8_result(cartesian_position_DH)

    [alpha_data,a_data,d,qlim1,qlim2,qlim3,qlim4,qlim5,qlim6] = ur3_dh();
    d1=d(1);
    d3=d(3);
    d4=d(4);
    d5=d(5);
    d6=d(6);
    a2=a_data(2);
    a3=a_data(3);
    
    Px = cartesian_position_DH(1,4);
    Py = cartesian_position_DH(2,4);
    Pz = cartesian_position_DH(3,4);
    
    r11=cartesian_position_DH(1,1);
    r12=cartesian_position_DH(1,2);
    r13=cartesian_position_DH(1,3);
    
    r21=cartesian_position_DH(2,1);
    r22=cartesian_position_DH(2,2);
    r23=cartesian_position_DH(2,3);
    
    r31=cartesian_position_DH(3,1);
    r32=cartesian_position_DH(3,2);
    r33=cartesian_position_DH(3,3);

    
    [theta1_1,theta1_2] = ik_theta1(Px,Py,d4,d6,r23,r13);
    
    [theta5_1,theta5_2,theta5_3,theta5_4] = ik_theta5(theta1_1,theta1_2,r13,r23);

    
    
     joints156_1 = ik_theta6(theta1_1,theta5_1,r11,r21,r12,r22);
     joints156_2 = ik_theta6(theta1_1,theta5_2,r11,r21,r12,r22);
     joints156_3 = ik_theta6(theta1_2,theta5_3,r11,r21,r12,r22);
     joints156_4 = ik_theta6(theta1_2,theta5_4,r11,r21,r12,r22);
     
     [theta3_1,theta3_2]=ik_theta3(joints156_1,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz);
     [theta3_3,theta3_4]=ik_theta3(joints156_2,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz);
     [theta3_5,theta3_6]=ik_theta3(joints156_3,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz);
     [theta3_7,theta3_8]=ik_theta3(joints156_4,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz);
     
     joints1356_1=[joints156_1(1),theta3_1,joints156_1(2),joints156_1(3)];
     joints1356_2=[joints156_1(1),theta3_2,joints156_1(2),joints156_1(3)];
     joints1356_3=[joints156_2(1),theta3_3,joints156_2(2),joints156_2(3)];
     joints1356_4=[joints156_2(1),theta3_4,joints156_2(2),joints156_2(3)];
     joints1356_5=[joints156_3(1),theta3_5,joints156_3(2),joints156_3(3)];
     joints1356_6=[joints156_3(1),theta3_6,joints156_3(2),joints156_3(3)];
     joints1356_7=[joints156_4(1),theta3_7,joints156_4(2),joints156_4(3)];
     joints1356_8=[joints156_4(1),theta3_8,joints156_4(2),joints156_4(3)];
     
     joints12356_1 = ik_theta2(joints1356_1,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz);
     joints12356_2 = ik_theta2(joints1356_2,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz);
     joints12356_3 = ik_theta2(joints1356_3,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz);
     joints12356_4 = ik_theta2(joints1356_4,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz);
     joints12356_5 = ik_theta2(joints1356_5,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz);
     joints12356_6 = ik_theta2(joints1356_6,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz);
     joints12356_7 = ik_theta2(joints1356_7,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz);
     joints12356_8 = ik_theta2(joints1356_8,r11,r12,r13,r21,r22,r23,r31,r32,r33,a2,a3,d1,d5,d6,Px,Py,Pz);
     
     joints1 = ik_theta4(joints12356_1,r11,r21,r31,r12,r22,r32);
     joints2 = ik_theta4(joints12356_2,r11,r21,r31,r12,r22,r32);
     joints3 = ik_theta4(joints12356_3,r11,r21,r31,r12,r22,r32);
     joints4 = ik_theta4(joints12356_4,r11,r21,r31,r12,r22,r32);
     joints5 = ik_theta4(joints12356_5,r11,r21,r31,r12,r22,r32);
     joints6 = ik_theta4(joints12356_6,r11,r21,r31,r12,r22,r32);
     joints7 = ik_theta4(joints12356_7,r11,r21,r31,r12,r22,r32);
     joints8 = ik_theta4(joints12356_8,r11,r21,r31,r12,r22,r32);
     

     
     

end