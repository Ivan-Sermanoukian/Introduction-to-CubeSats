%-------------------------------------------------------------------------%
% ITC_Output_file : Reads NASA 42 with .42 file extension
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

% LaTeX configuration
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

%% Operating System selection

% Choose simulation folder
data_folder    = "CHANGE_FOLDER";
mission_folder = "CHANGE_FOLDER"; 
folder = strcat(data_folder,filesep,mission_folder);

% Windows data path
if ispc
    display("Windows Path");
    linux = false;
    % Add simulation paths
    addpath(strcat(pwd,filesep,folder));
    addpath(genpath(strcat(pwd,filesep,'Output_results')));

% Linux data path
else
    display("Linux Path");
    linux = true;
    % Add simulation paths
    addpath(strcat(pwd,filesep,folder));
    addpath(genpath(strcat(pwd,filesep,'Output_results')));
    
end

%% Initial conditions

% Number of spacecraft
Nsc = 1;

%% Output data

% Simulation time [s]
sim_time = load(strcat(folder,filesep,'time.42'),'-ascii');
% Simulation time since J2000 [s]
sim_time_J2000 = load(strcat(folder,filesep,'DynTime.42'),'-ascii');

for Isc = 0:1:(Nsc-1)
    
    str = sprintf("u%02ld.42",Isc);
    u(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("x%02ld.42",Isc);
    x(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
%     str = sprintf("uf%02ld.42",Isc);
%     uf(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
%     str = sprintf("xf%02ld.42",Isc);
%     xf(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
%     str = sprintf("Constraint%02ld.42",Isc);
%     Constraint(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    
    str = sprintf("PosN%02ld.42",Isc);    
    PosN(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("VelN%02ld.42",Isc);
    VelN(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("PosW%02ld.42",Isc);
    PosW(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("VelW%02ld.42",Isc);
    VelW(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("PosR%02ld.42",Isc);
    PosR(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("VelR%02ld.42",Isc);
    VelR(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("qbn%02ld.42",Isc);
    qbn(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("wbn%02ld.42",Isc);
    wbn(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("Hvn%02ld.42",Isc);
    Hvn(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("svn%02ld.42",Isc);
    svn(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("svb%02ld.42",Isc);
    svb(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("KE%02ld.42",Isc);
    KE(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("RPY%02ld.42",Isc);
    RPY(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("Hwhl%02ld.42",Isc);
    Hwhl(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("MTB%02ld.42",Isc);
    MTB(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
%     str = sprintf("ProjArea%02ld.42",Isc);
%     ProjArea(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
    str = sprintf("Acc%02ld.42",Isc);
    Acc(:,:,Isc+1) = load(strcat(folder,filesep,str),'-ascii');
end



















