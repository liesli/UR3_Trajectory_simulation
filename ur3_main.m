%startup_rvc
clear;clc;close all

addpath(genpath('ur3_demo'),genpath('ur3_trajectory_plan'),genpath('ur3_forward_kinematics'),genpath('ur3_robot'),genpath('ur3_utils'))

%%
demo_ik_fk=0; %��������
demo_show_forward=0; %������ʾ
demo_show_inverse=0; %λ�������ʾ
demo_bring_cup_with_matlab_jtraj=0;  %����matlab�ķ������й켣�滮
demo_my_trajectory_plan=1;
if demo_ik_fk+demo_show_forward+demo_show_inverse+demo_bring_cup_with_matlab_jtraj>1
    error('run one function one time һ������һ��ѡ��')
end


demo_csdn=0;
%joint_angles=[0 90 90 90 0 0]; err
%robot = puma560_dh(joint_angles,1);
%disp('fowrard_kinematics:')


%% ����inverse kinematics �� forward kinematics
if demo_ik_fk
    %���������Ĵ����Ƿ���ȷ
    %����һ��Ŀ��Ƕ����������ҵ�ĩ��ִ�����ľ����,����8��⣬�ڽ���������⿴�Ƿ���ͬ��
    %���õķ���λ��demo�ļ���
    joint_rads=[50 90 61 60 32 50]/180*pi;
    %joint_rads=[90 90 90 0 0 90]/180*pi;
    test_ik_fk(joint_rads);
end

if demo_show_forward
    %ֱ�۵Ĳ鿴�������Ѷ
    %����ؽ���ʾ����ľ�����ʾrobot��״̬
    %���õķ���λ��demo�ļ���
    joints = [50 70 90 20 32 50];
    ur3_show_forward(joints);
end

if demo_bring_cup_with_matlab_jtraj
    bring_cup_with_matlab_jtraj();
end
if demo_my_trajectory_plan
    bring_cup_with_ur3_trajectory();
end