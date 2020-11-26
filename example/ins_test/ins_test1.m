%% example 惯导解算
clear;
clc;
close all;

%%
Fs = 100;

%Groud True
pos_gt = csvread('generated_data/ref_pos.csv', 1, 0);
pos_gt = pos_gt - pos_gt(1,:);

%GNSS-SIM 软件仿真结果
pos_py_sim = csvread('generated_data/pos-algo0_0.csv', 1, 0);
pos_py_sim = pos_py_sim - pos_py_sim(1,:);

% m/s^(2), deg/s
 acc = csvread('generated_data/accel-0.csv', 1, 0);
 gyr = csvread('generated_data/gyro-0.csv', 1, 0);

gyr = deg2rad(gyr);
N = length(acc);

% 惯导解算
x = zeros(10,1);
x(7:10) = [1 0 0 0];

for i=1:N
    u = [acc(i,:) gyr(i,:)]';
    x = ch_nav_equ_local_tan(x, u , 1 / Fs, [0, 0, 9.795]');
    pos_matlab(i,:) = x(1:3);
    xeul(i,:) = rad2deg(ch_q2eul(x(7:10)));
end

%3D位置plot
plot3(pos_gt(:,1), pos_gt(:,2), pos_gt(:,3), '.r');
hold on;
plot3(pos_py_sim(:,1), pos_py_sim(:,2), pos_py_sim(:,3), '.g');
plot3(pos_matlab(:,1), pos_matlab(:,2), pos_matlab(:,3), '.b');
title('3D位置');
legend('GNSS-SIM真值', 'GNSS-SIM仿真结果', 'matlab仿真结果');
axis equal

% 2D位置plot
figure;
hold on;
plot(pos_gt(:,1), pos_gt(:,2), '-r');
plot(pos_py_sim(:,1), pos_py_sim(:,2), '-g');
plot(pos_matlab(:,1), pos_matlab(:,2), '-b');
title('2D位置');
legend('GNSS-SIM真值', 'GNSS-SIM仿真结果', 'matlab仿真结果');
axis equal

fprintf('最终位置差:%f\n', norm(pos_gt(N, :) - pos_matlab(N, :)));

