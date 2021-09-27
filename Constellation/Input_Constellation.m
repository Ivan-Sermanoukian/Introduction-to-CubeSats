%-------------------------------------------------------------------------%
% Input_main: Creation of 42's constellation input files (.txt)
%-------------------------------------------------------------------------%

%{
  Introduction to CubeSats
  Date: 09/09/2021
  Author: Ivan Sermanoukian Molina
%}

% Clear workspace, command window and close windows
clc
clear all
close all

%% Operating System selection

% Choose simulation folder name 
folder = "folder_name";

% Windows data path
if ispc
    display("Windows Path");
    linux = false;
    % Add function paths
    addpath(strcat(pwd,filesep,'Input_functions_Constellation'));
    
    % Create folder 
    if not(isfolder(folder))
        mkdir(folder);
    else
        rmdir(folder,'s')
        mkdir(folder);
    end

% Linux data path
else
    display("Linux Path");
    linux = true;
    % Add function paths
    addpath(strcat(pwd,filesep,'Input_functions'));
    
    % Create folder 
    if not(isfolder(folder))
        mkdir(folder);
    else
        rmdir(folder,'s')
        mkdir(folder);
    end
end


%% Input data

% Input Command Script

    % Add user manual to Cmd script
    User_manual = "TRUE";            % [T/F] 

% Input Simulation Control

    % Time variables
    time_mode       = "FAST";        % [FAST, REAL, EXTERNAL, or NOS3]
    duration        = "10000";       % [s]
    step_size       = "0.1";         % [s]
    output_interval = "1";           % [s]
    
    % Initial time
    month           = "09";          % [mm]
    day             = "25";          % [dd]
    year            = "2021";        % [yyyy]
    hour            = "12";          % [hh]
    minute          = "00";          % [mm]
    second          = "00.00";       % [ss.ss]
    
    % Graphical User Interface
    GUI             = "TRUE";       % [T/F]
    
    % Orbits
    reference_orbits = "75";        % Number of orbits
    [orbits] = Input_Orbit(folder,reference_orbits);  

    % Spacecraft
    number_spacecraft = "75";       % Number of spacecraft
    [spacecraft] = Input_SC(folder,number_spacecraft);  

    % Ground Stations
    number_ground_stations = "1";   % Number of ground stations
        % Exists, World, Lng, Lat, Label
    ground_stations = ["TRUE","EARTH","-77.0","37.0","""GSFC"""]; 
    
    % Select Solar System variables   
        % Me - V - E - Ma - J - S - U - N - P - Ast
    Solar_System = ["TRUE","TRUE","TRUE","TRUE","TRUE","TRUE","TRUE","TRUE","TRUE","TRUE"];
        % Earth-Moon / Sun-Earth / Sun-Jupiter
    Lagrange_System = ["FALSE","FALSE","FALSE"];

%% Create files

% List of commands
Input_Command_Script(folder,User_manual);

% Graphical User Interface and FOV settings
if (GUI == "TRUE")
    Input_Graphics(folder);
    Input_FOV(folder);
end

% Tracking and Data Relay Satellite System
Input_TDRS(folder);
% World Regions
Input_Region(folder);
% Intercommunications
Input_IPC(folder)

% Simulation settings
Input_Simulation(folder,time_mode,duration,step_size,output_interval,GUI,...
               month,day,year,hour,minute,second,reference_orbits,orbits, ...
               number_spacecraft,spacecraft,number_ground_stations,ground_stations, ...
               Solar_System,Lagrange_System);


% if (linux)
%            
%     % Run 42
%     cd('/home/ivan/plathon/42');
%     system('./42 Sims/');
%     
% end
    
    
    