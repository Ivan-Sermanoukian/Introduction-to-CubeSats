function Input_Simulation(folder,time_mode,duration,step_size,output_interval,GUI,...
               month,day,year,hour,minute,second,reference_orbits,orbits, ...
               number_spacecraft,spacecraft,number_ground_stations,ground_stations, ...
               Solar_System,Lagrange_System)
        
    % Constants
    leap_second = "37";    
    
    % Environment model
    [space_environment_models,F_10_7,Ap,magnetic_field,IGRF_degree,IGRF_order, ...
     Earth_model_N,Earth_model_M,Mars_model_N,Mars_model_M,Luna_model_N,Luna_model_M, ...
     Ephemerides] = Environment_models();
    
    % File structure
    name      = "Inp_Sim.txt";
    directory = strcat(folder,filesep,name);
    
    fid = fopen(directory,'w');
    fprintf(fid,"%s \n","<<<<<<<<<<<<<<<<<  42: The Mostly Harmless Simulator  >>>>>>>>>>>>>>>>>");
    
    fprintf(fid,"%s \n","************************** Simulation Control **************************");
    fprintf(fid,"%s \t\t %s \n"    ,time_mode,         "!  Time Mode (FAST, REAL, EXTERNAL, or NOS3)");
    fprintf(fid,"%s \t %s \t %s \n",duration,step_size,"!  Sim Duration, Step Size [sec]");
    fprintf(fid,"%s \t\t %s \n"    ,output_interval,   "!  File Output Interval [sec]");
    fprintf(fid,"%s \t\t %s \n"    ,GUI,               "!  Graphics Front End?");
    fprintf(fid,"%s \t %s \t \n"   ,"Inp_Cmd.txt",     "!  Command Script File Name");
    
    fprintf(fid,"%s \n","**************************  Reference Orbits  **************************");
    fprintf(fid,"%s \t\t %s \n"           ,reference_orbits,       "!  Number of Reference Orbits");
    
    for i=1:1:str2double(reference_orbits)
        fprintf(fid,"%s %s \t %s %s \n",orbits(i,1),orbits(i,2),"!  Input file name for Orb",int2str(i-1));
    end
    
    fprintf(fid,"%s \n","*****************************  Spacecraft  *****************************");
    fprintf(fid,"%s \t\t %s \n",number_spacecraft,"!  Number of Spacecraft");
    
    for i=1:1:str2double(number_spacecraft)
        fprintf(fid,"%s %s \t %s \t %s %s \n",spacecraft(i,1),spacecraft(i,2),spacecraft(i,3),"!  Existence, RefOrb, Input file for SC",int2str(i-1));
    end
    
    fprintf(fid,"%s \n","***************************** Environment  *****************************");
	fprintf(fid,"%s %s %s \t %s \t \n",month,day,year,             "!  Date (UTC) (Month, Day, Year)");
	fprintf(fid,"%s %s %s \t %s \t \n",hour,minute,second,         "!  Time (UTC) (Hr,Min,Sec)");
    fprintf(fid,"%s \t\t %s \n"       ,leap_second,                "!  Leap Seconds (sec)");
    fprintf(fid,"%s \t\t %s \n"       ,space_environment_models,   "!  F10.7, Ap (USER, NOMINAL or TWOSIGMA)");
	fprintf(fid,"%s \t\t %s \n"       ,F_10_7,                     "!  USER-provided F10.7");
	fprintf(fid,"%s \t\t %s \n"       ,Ap,                         "!  USER-provided Ap ");
    fprintf(fid,"%s \t\t %s \n"       ,magnetic_field,             "!  Magfield (NONE,DIPOLE,IGRF)");
	fprintf(fid,"%s \t %s \t %s \n"   ,IGRF_degree,IGRF_order,     "!  IGRF Degree and Order (<=10)");
	fprintf(fid,"%s \t %s \t %s \n"   ,Earth_model_N,Earth_model_M,"!  Earth Gravity Model N and M (<=18)");
	fprintf(fid,"%s \t %s \t %s \n"   ,Mars_model_N,Mars_model_M,  "!  Mars Gravity Model N and M (<=18)");
	fprintf(fid,"%s \t %s \t %s \n"   ,Luna_model_N,Luna_model_M,  "!  Luna Gravity Model N and M (<=18)");
    fprintf(fid,"%s \t %s \t %s \n"   ,"FALSE","FALSE",            "!  Aerodynamic Forces & Torques (Shadows)");
    fprintf(fid,"%s \t\t %s \n"       ,"FALSE",                    "!  Gravity Gradient Torques");
    fprintf(fid,"%s \t %s \t %s \n"   ,"FALSE","FALSE",            "!  Solar Pressure Forces & Torques (Shadows)");
    fprintf(fid,"%s \t\t %s \n"       ,"FALSE",                    "!  Gravity Perturbation Forces");
    fprintf(fid,"%s \t\t %s \n"       ,"FALSE",                    "!  Passive Joint Forces & Torques");
    fprintf(fid,"%s \t\t %s \n"       ,"FALSE",                    "!  Thruster Plume Forces & Torques");
    fprintf(fid,"%s \t\t %s \n"       ,"FALSE",                    "!  RWA Imbalance Forces and Torques");
    fprintf(fid,"%s \t\t %s \n"       ,"FALSE",                    "!  Contact Forces and Torques");
    fprintf(fid,"%s \t\t %s \n"       ,"FALSE",                    "!  CFD Slosh Forces and Torques");
    fprintf(fid,"%s \t\t %s \n"       ,"FALSE",                    "!  Output Environmental Torques to Files");
    
    fprintf(fid,"%s \n","********************* Celestial Bodies of Interest *********************");
    fprintf(fid,"%s \t\t %s \n",Ephemerides,     "!  Ephem Option (MEAN or DE430)");
    fprintf(fid,"%s \t\t %s \n",Solar_System(1), "!  Mercury");
    fprintf(fid,"%s \t\t %s \n",Solar_System(2), "!  Venus");
    fprintf(fid,"%s \t\t %s \n",Solar_System(3), "!  Earth and Luna");
    fprintf(fid,"%s \t\t %s \n",Solar_System(4), "!  Mars and its moons");
    fprintf(fid,"%s \t\t %s \n",Solar_System(5), "!  Jupiter and its moons");
    fprintf(fid,"%s \t\t %s \n",Solar_System(6), "!  Saturn and its moons");
    fprintf(fid,"%s \t\t %s \n",Solar_System(7), "!  Uranus and its moons");
    fprintf(fid,"%s \t\t %s \n",Solar_System(8), "!  Neptune and its moons");
    fprintf(fid,"%s \t\t %s \n",Solar_System(9), "!  Pluto and its moons");
    fprintf(fid,"%s \t\t %s \n",Solar_System(10),"!  Asteroids and Comets");
    
    fprintf(fid,"%s \n","***************** Lagrange Point Systems of Interest ******************");
    fprintf(fid,"%s \t\t %s \n",Lagrange_System(1),"!  Earth-Moon");
    fprintf(fid,"%s \t\t %s \n",Lagrange_System(2),"!  Sun-Earth");
    fprintf(fid,"%s \t\t %s \n",Lagrange_System(3),"!  Sun-Jupiter");
    
    fprintf(fid,"%s \n","************************* Ground Stations ***************************");
    fprintf(fid,"%s \t \t \t \t %s \n",number_ground_stations,"! Number of Ground Stations");
    
    for i=1:1:str2double(number_ground_stations)
        fprintf(fid,"%s %s %s %s %s \t %s \n",ground_stations(i,1),ground_stations(i,2),ground_stations(i,3), ...
            ground_stations(i,4),ground_stations(i,5),        "! Exists, World, Lng, Lat, Label");
    end

    fclose(fid);
    
end