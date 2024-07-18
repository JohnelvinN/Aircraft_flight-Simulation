% Parameters
ascent_rate = 10; % Ascent rate in meters per second
descent_rate = -10; % Descent rate in meters per second
cruising_altitude = 10000; % Cruising altitude in meters
cruise_time = 600; % Time at cruising altitude in seconds
total_time = 1800; % Total flight time in seconds
dt = 1; % Time step in seconds

% Time vectors
t_ascent = 0:dt:(cruising_altitude/ascent_rate);
t_cruise = (t_ascent(end) + dt):dt:(t_ascent(end) + dt + cruise_time);
t_descent = (t_cruise(end) + dt):dt:total_time;

% Altitude vectors
altitude_ascent = ascent_rate * t_ascent;
altitude_cruise = cruising_altitude * ones(size(t_cruise));
altitude_descent = cruising_altitude + descent_rate * (t_descent - t_descent(1));

% Combine time and altitude vectors
time = [t_ascent, t_cruise, t_descent];
altitude = [altitude_ascent, altitude_cruise, altitude_descent];

% Plotting the flight path
figure;
plot(time, altitude, 'b-', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Altitude (m)');
title('Aircraft Ascent, Cruise, and Descent');
grid on;
