%startup_rvc
clear;clc;close all

addpath(genpath('ur3_demo'),genpath('ur3_trajectory_plan'),genpath('ur3_forward_kinematics'),genpath('ur3_robot'),genpath('ur3_utils'))

%%
demo_ik_fk=0; %正逆解测试
demo_show_forward=0; %正解显示
demo_show_inverse=0; %位置逆解显示
demo_bring_cup_with_matlab_jtraj=0;  %调用matlab的方法进行轨迹规划
demo_my_trajectory_plan=1;
if demo_ik_fk+demo_show_forward+demo_show_inverse+demo_bring_cup_with_matlab_jtraj>1
    error('run one function one time 一次运行一个选项')
end


demo_csdn=0;
%joint_angles=[0 90 90 90 0 0]; err
%robot = puma560_dh(joint_angles,1);
%disp('fowrard_kinematics:')


%% 测试inverse kinematics 和 forward kinematics
if demo_ik_fk
    %测试正逆解的代码是否正确
    %输入一个目标角度先用正解找到末端执行器的矩阵后,逆解出8组解，在将八组解正解看是否相同，
    %调用的方法位于demo文件夹
    joint_rads=[50 90 61 60 32 50]/180*pi;
    %joint_rads=[90 90 90 0 0 90]/180*pi;
    test_ik_fk(joint_rads);
end

if demo_show_forward
    %直观的查看正解的资讯
    %输入关节显示正解的矩阵并显示robot的状态
    %调用的方法位于demo文件夹
    joints = [50 70 90 20 32 50];
    ur3_show_forward(joints);
end

if demo_bring_cup_with_matlab_jtraj
    bring_cup_with_matlab_jtraj();
end
if demo_my_trajectory_plan
    bring_cup_with_ur3_trajectory();
end