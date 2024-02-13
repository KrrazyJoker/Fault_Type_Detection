clear all; close all; clc;
% CEP FOR THE COURSE OF ELECTRICAL POWER SYSTEM PROTECTION EE-457
%% GROUP MEMBERS:
%% FURQAN ALI
%% BASIM ALI
%% CALCULATION OF SEQUENCE VOLTAGES FOR EACH PHASE
a = -0.5 + 1i*0.866;
a2 = -0.5 - 1i*0.866;
Va_mag = 10; Va_angle = deg2rad(90);
Vb_mag = 10; Vb_angle = deg2rad(-30);
Vc_mag = 10; Vc_angle = deg2rad(-150);
%{
disp('Enter magnitude and angle(in degrees) for each voltage phasor');
Va_mag = input('Enter magnitude of Va : ');
Va_angle = deg2rad(input('Enter angle of Va : '));
Vb_mag = input('Enter magnitude of Vb : ');
Vb_angle = deg2rad(input('Enter angle of Vb : '));
Vc_mag = input('Enter magnitude of Vc : ');
Vc_angle = deg2rad(input('Enter angle of Vc : '));
%}
Va = (Va_mag * cos(Va_angle)) + 1i * (Va_mag*sin(Va_angle));
Vb = (Vb_mag * cos(Vb_angle)) + 1i * (Vb_mag*sin(Vb_angle));
Vc = (Vc_mag * cos(Vc_angle)) + 1i * (Vc_mag*sin(Vc_angle));
Vabc = [Va;Vb;Vc];
A = (1/3)*[1 1 1; 1 a a2; 1 a2 a];
Va_seq = A*Vabc;
Va_0 = Va_seq(1);
Vb_0 = Va_seq(1);
Vc_0 = Va_seq(1);
Va_1 = Va_seq(2);
Vb_1 = a2*Va_seq(2);
Vc_1 = a*Va_seq(2);
Va_2 = Va_seq(3);
Vb_2 = a*Va_seq(3);
Vc_2 = a2*Va_seq(3);
Vb_seq = [Vb_0; Vb_1; Vb_2];
Vc_seq = [Vc_0; Vc_1; Vc_2];

%In case of magnitudes being zero corresponding angle should be zero
for i = 1:3
    if abs(Va_seq(i)) <= 0.001
        Va_seq(i) = 0;
    end
    if abs(Vb_seq(i)) <= 0.001
        Vb_seq(i) = 0;
    end
    if abs(Vc_seq(i)) <= 0.001
        Vc_seq(i) = 0;
    end
end

%Phase A voltage polar
polar_magnitudes_of_a = abs(Va_seq);
polar_angles_of_a = round(rad2deg(angle(Va_seq)),2);
%Phase B voltage polar
polar_magnitudes_of_b = abs(Vb_seq);
polar_angles_of_b = round(rad2deg(angle(Vb_seq)),2);
%Phase C voltage polar
polar_magnitudes_of_c = abs(Vc_seq);
polar_angles_of_c = round(rad2deg(angle(Vc_seq)),2);
%Sequence Components of Phase voltages in Polar form
Va_seq_polar = [polar_magnitudes_of_a, polar_angles_of_a];
Vb_seq_polar = [polar_magnitudes_of_b, polar_angles_of_b];
Vc_seq_polar = [polar_magnitudes_of_c, polar_angles_of_c];

%% CALCULATION OF SEQUENCE CURRENTS FOR EACH PHASE
Ia_mag = 10; Ia_angle = deg2rad(0);
Ib_mag = 10; Ib_angle = deg2rad(-120);
Ic_mag = 10; Ic_angle = deg2rad(120);
%{
disp('Enter magnitude and angle(in degrees) for each Current phasor');
Ia_mag = input('Enter magnitude of Ia : ');
Ia_angle = deg2rad(input('Enter angle of Ia : '));
Ib_mag = input('Enter magnitude of Ib : ');
Ib_angle = deg2rad(input('Enter angle of Ib : '));
Ic_mag = input('Enter magnitude of Ic : ');
Ic_angle = deg2rad(input('Enter angle of Ic : '));
%}
Ia = (Ia_mag * cos(Ia_angle)) + 1i * (Ia_mag*sin(Ia_angle));
Ib = (Ib_mag * cos(Ib_angle)) + 1i * (Ib_mag*sin(Ib_angle));
Ic = (Ic_mag * cos(Ic_angle)) + 1i * (Ic_mag*sin(Ic_angle));
Iabc = [Ia;Ib;Ic];
Ia_seq = A*Iabc;
Ia_0 = Ia_seq(1);
Ib_0 = Ia_seq(1);
Ic_0 = Ia_seq(1);
Ia_1 = Ia_seq(2);
Ib_1 = a2*Ia_seq(2);
Ic_1 = a*Ia_seq(2);
Ia_2 = Ia_seq(3);
Ib_2 = a*Ia_seq(3);
Ic_2 = a2*Ia_seq(3);
Ib_seq = [Ib_0; Ib_1; Ib_2];
Ic_seq = [Ic_0; Ic_1; Ic_2];

%In case of magnitudes being zero corresponding angle should be zero
for i = 1:3
    if abs(Ia_seq(i)) <= 0.001
        Ia_seq(i) = 0;
    end
    if abs(Ib_seq(i)) <= 0.001
        Ib_seq(i) = 0;
    end
    if abs(Ic_seq(i)) <= 0.001
        Ic_seq(i) = 0;
    end
end

%Phase A current polar
polar_magnitudes_of_a_current = abs(Ia_seq);
polar_angles_of_a_current = round(rad2deg(angle(Ia_seq)),2);
%Phase B current polar
polar_magnitudes_of_b_current = abs(Ib_seq);
polar_angles_of_b_current = round(rad2deg(angle(Ib_seq)),2);
%Phase C current polar
polar_magnitudes_of_c_current = abs(Ic_seq);
polar_angles_of_c_current = round(rad2deg(angle(Ic_seq)),2);
%Sequence Components of Phase Currents in Polar form
Ia_seq_polar = [polar_magnitudes_of_a_current, polar_angles_of_a_current];
Ib_seq_polar = [polar_magnitudes_of_b_current, polar_angles_of_b_current];
Ic_seq_polar = [polar_magnitudes_of_c_current, polar_angles_of_c_current];
%% Display the polar phasors
disp('Voltage sequence (Magnitude and Angle):');
fprintf('Va_zero_mag     = %d,             Va_zero_angle     = %.2f\n', ...
    polar_magnitudes_of_a(1), polar_angles_of_a(1));
fprintf('Va_positive_mag = %d, Va_positive_angle = %.2f\n', ...
    polar_magnitudes_of_a(2), polar_angles_of_a(2));
fprintf('Va_negative_mag = %d,             Va_negative_angle = %.2f\n', ...
    polar_magnitudes_of_a(3), polar_angles_of_a(3));
fprintf('Vb_zero_mag     = %d,             Vb_zero_angle     = %.2f\n', ...
    polar_magnitudes_of_b(1), polar_angles_of_b(1));
fprintf('Vb_positive_mag = %d, Vb_positive_angle = %.2f\n', ...
    polar_magnitudes_of_b(2), polar_angles_of_b(2));
fprintf('Vb_negative_mag = %d,             Vb_negative_angle = %.2f\n', ...
    polar_magnitudes_of_b(3), polar_angles_of_b(3));
fprintf('Vc_zero_mag     = %d,             Vc_zero_angle     = %.2f\n', ...
    polar_magnitudes_of_c(1), polar_angles_of_c(1));
fprintf('Vc_positive_mag = %d, Vc_positive_angle = %.2f\n', ...
    polar_magnitudes_of_c(2), polar_angles_of_c(2));
fprintf('Vc_negative_mag = %d,             Vc_negative_angle = %.2f\n', ...
    polar_magnitudes_of_c(3), polar_angles_of_c(3));

disp('Current sequence (Magnitude and Angle):');
fprintf('Ia_zero_mag     = %d,            Ia_zero_angle     = %.2f\n', ...
    polar_magnitudes_of_a_current(1), polar_angles_of_a_current(1));
fprintf('Ia_positive_mag = %d, Ia_positive_angle = %.2f\n', ...
    polar_magnitudes_of_a_current(2), polar_angles_of_a_current(2));
fprintf('Ia_negative_mag = %d,            Ia_negative_angle = %.2f\n', ...
    polar_magnitudes_of_a_current(3), polar_angles_of_a_current(3));
fprintf('Ib_zero_mag     = %d,            Ib_zero_angle     = %.2f\n', ...
    polar_magnitudes_of_b_current(1), polar_angles_of_b_current(1));
fprintf('Ib_positive_mag = %d, Ib_positive_angle = %.2f\n', ...
    polar_magnitudes_of_b_current(2), polar_angles_of_b_current(2));
fprintf('Ib_negative_mag = %d,            Ib_negative_angle = %.2f\n', ...
    polar_magnitudes_of_b_current(3), polar_angles_of_b_current(3));
fprintf('Ic_zero_mag     = %d,            Ic_zero_angle     = %.2f\n', ...
    polar_magnitudes_of_c_current(1), polar_angles_of_c_current(1));
fprintf('Ic_positive_mag = %d, Ic_positive_angle = %.2f\n', ...
    polar_magnitudes_of_c_current(2), polar_angles_of_c_current(2));
fprintf('Ic_negative_mag = %d,            Ic_negative_angle = %.2f\n', ...
    polar_magnitudes_of_c_current(3), polar_angles_of_c_current(3));

%% DECLARATION OF FAULT TYPE
%Balanced Fault
if (abs(Ia + Ib + Ic) <= 0.0001) & (abs(Va + Vb + Vc) <= 0.0001)
    disp('System is Balanced')
    variable = 0;
else
    disp('System is Unbalanced')
    variable = 1;
end
%LLL fault condition
if (abs(Ia_2) + abs(Ib_2) + abs(Ic_2)) <=0.001
    disp('Fault Type is LLL')
end
%LL fault condition
if ((Va_angle == Vb_angle) | (Va_angle == Vc_angle) | ...
        (Vb_angle == Vc_angle)) ~= 0
    if abs(Ia_0) <=0.0000001
        disp('Fault Type is LL')
    end
end
%LLG Fault condition
if ((Va_mag ==0) & (Vb_mag== 0)) | ((Va_mag ==0) & (Vc_mag== 0)) | ...
        ((Vb_mag==0) & (Vc_mag== 0)) ~=0
    if abs(Ia_0) >=0.0000001
        disp('Fault Type is LLG')
    end
end
%LG Fault condition
if ((Ia_mag ==0) & (Ib_mag== 0)) | ((Ia_mag ==0) & (Ic_mag== 0)) | ...
        ((Ib_mag==0) & (Ic_mag== 0)) ~=0
    disp('Fault Type is LG')
end
%{
%% Integration With Arduino
% Set up the serial connection
arduino = serial('COM4', 'BaudRate', 9600); 
fopen(arduino);

% Define your variable here
variable = 1;

% Check the condition and send the command to the Arduino
if variable > 0
    fprintf(arduino, '%d', 1); % Send command to trip the relay
else
    fprintf(arduino, '%d', 0); % Send command to reset the relay
end

% Close the serial connection
fclose(arduino);
delete(arduino);
clear arduino;
%}
%% Plot for Input Voltage Phasors
figure;
subplot(2, 2, 1);
polarplot(Va_angle, Va_mag, 'O', 'DisplayName', 'Va');
hold on;
polarplot(Vb_angle, Vb_mag, 'O', 'DisplayName', 'Vb');
polarplot(Vc_angle, Vc_mag, 'O', 'DisplayName', 'Vc');
title('Voltage Input Phasors (Vabc)');
legend('show');
hold off;
%% Plot for Positive Sequence Voltage
subplot(2, 2, 2);
polarplot(deg2rad(Va_seq_polar(2, 2)), Va_seq_polar(2, 1), 'o', ...
    'DisplayName', 'Va_1');
hold on;
polarplot(deg2rad(Vb_seq_polar(2, 2)), Vb_seq_polar(2, 1), 'o', ...
    'DisplayName', 'Vb_1');
polarplot(deg2rad(Vc_seq_polar(2, 2)), Vc_seq_polar(2, 1), 'o', ...
    'DisplayName', 'Vc_1');
title('Positive Sequence Voltage Phasors');
legend('show');
hold off;
%% Plot for Negative Sequence Voltage
subplot(2, 2, 3);
polarplot(deg2rad(Va_seq_polar(3, 2)), Va_seq_polar(3, 1), 'o', ...
    'DisplayName', 'Va_2');
hold on;
polarplot(deg2rad(Vb_seq_polar(3, 2)), Vb_seq_polar(3, 1), 'o', ...
    'DisplayName', 'Vb_2');
polarplot(deg2rad(Vc_seq_polar(3, 2)), Vc_seq_polar(3, 1), 'o', ...
    'DisplayName', 'Vc_2');
title('Negative Sequence Voltage Phasors');
legend('show');
hold off;
%% Plot for Zero Sequence Voltage
subplot(2, 2, 4);
polarplot(deg2rad(Va_seq_polar(1, 2)), Va_seq_polar(1, 1), 'o', ...
    'DisplayName', 'Va_0');
hold on;
polarplot(deg2rad(Vb_seq_polar(1, 2)), Vb_seq_polar(1, 1), 'o', ...
    'DisplayName', 'Vb_0');
polarplot(deg2rad(Vc_seq_polar(1, 2)), Vc_seq_polar(1, 1), 'o', ...
    'DisplayName', 'Vc_0');
title('Zero Sequence Voltage Phasors');
legend('show');
hold off;
%% Plot for Input Current Phasors
figure;
subplot(2, 2, 1);
polarplot(Ia_angle, Ia_mag, 'O', 'DisplayName', 'Ia');
hold on;
polarplot(Ib_angle, Ib_mag, 'O', 'DisplayName', 'Ib');
polarplot(Ic_angle, Ic_mag, 'O', 'DisplayName', 'Ic');
title('Current Input Phasors (Iabc)');
legend('show');
hold off;
%% Plot for Positive Sequence Current
subplot(2, 2, 2);
polarplot(deg2rad(Ia_seq_polar(2, 2)), Ia_seq_polar(2, 1), 'o', ...
    'DisplayName', 'Ia_1');
hold on;
polarplot(deg2rad(Ib_seq_polar(2, 2)), Ib_seq_polar(2, 1), 'o', ...
    'DisplayName', 'Ib_1');
polarplot(deg2rad(Ic_seq_polar(2, 2)), Ic_seq_polar(2, 1), 'o', ...
    'DisplayName', 'Ic_1');
title('Positive Sequence Current Phasors');
legend('show');
hold off;
%% Plot for Negative Sequence Current 
subplot(2, 2, 3);
polarplot(deg2rad(Ia_seq_polar(3, 2)), Ia_seq_polar(3, 1), 'o', ...
    'DisplayName', 'Ia_2');
hold on;
polarplot(deg2rad(Ib_seq_polar(3, 2)), Ib_seq_polar(3, 1), 'o', ...
    'DisplayName', 'Ib_2');
polarplot(deg2rad(Ic_seq_polar(3, 2)), Ic_seq_polar(3, 1), 'o', ...
    'DisplayName', 'Ic_2');
title('Negative Sequence Current Phasors');
legend('show');
hold off;
%% Plot for Zero Sequence Current
subplot(2, 2, 4);
polarplot(deg2rad(Ia_seq_polar(1, 2)), Ia_seq_polar(1, 1), 'o', ...
    'DisplayName', 'Ia_0');
hold on;
polarplot(deg2rad(Ib_seq_polar(1, 2)), Ib_seq_polar(1, 1), 'o', ...
    'DisplayName', 'Ib_0');
polarplot(deg2rad(Ic_seq_polar(1, 2)), Ic_seq_polar(1, 1), 'o', ...
    'DisplayName', 'Ic_0');
title('Zero Sequence Current Phasors');
legend('show');
hold off;
%% Phase Angle Difference i.e. V∠θ - I∠Φ
Ang_Dif_A = rad2deg([angle(Va_0)-angle(Ia_0); angle(Va_1)-angle(Ia_1); ...
    angle(Va_2)-angle(Ia_2)]);
Ang_Dif_B = rad2deg([angle(Vb_0)-angle(Ib_0); angle(Vb_1)-angle(Ib_1); ...
    angle(Vb_2)-angle(Ib_2)]);
Ang_Dif_C = rad2deg([angle(Vc_0)-angle(Ic_0); angle(Vc_1)-angle(Ic_1); ...
    angle(Vc_2)-angle(Ic_2)]);

ADA = {'Va_O∠θ - Ia_O∠Φ';'Va_1∠θ - Ia_1∠Φ';'Va_2∠θ - Ia_2∠Φ'};
ADB = {'Vb_O∠θ - Ib_O∠Φ';'Vb_1∠θ - Ib_1∠Φ';'Vb_2∠θ - Ib_2∠Φ'};
ADC = {'Vc_O∠θ - Ic_O∠Φ';'Vc_1∠θ - Ic_1∠Φ';'Vc_2∠θ - Ic_2∠Φ'};
%Displaying the Phase Angle Difference Values
for j = 1:3
    PANDA = [ADA(j)  Ang_Dif_A(j)];
    PANDB = [ADB(j)  Ang_Dif_B(j)];
    PANDC = [ADC(j)  Ang_Dif_C(j)];
    disp(PANDA)
    disp(PANDB)
    disp(PANDC)
end