function [orbits] = Input_Orbit(folder,reference_orbits)        
    
    %% Orbit constellation method
    
    for Isc = 1:1:str2double(reference_orbits) 
                
        % Orbit type
        orbit_type(Isc) = ["CENTRAL"];
        
        % Orbit Type Zero
        world(Isc)  = ["EARTH"];
        grav_0(Isc) = ["FALSE"];
        % Orbit Type Flight
        region(Isc)    = ["0"];
        gravity_F(Isc) = ["FALSE"];
        % Orbit Type Central
        orbit_center(Isc) = ["EARTH"];
        J2(Isc)           = ["FALSE"];
        % Use Keplerian elements (KEP) or (RV) or FILE 
        KEP_RV_FILE(Isc) = ["FILE"];
            % Keplerian orbit
            PA_AE(Isc)  = ["PA"]; % Use Peri/Apoapsis (PA) or min alt/ecc (AE) 
                PA(Isc,1) = ["35000.0"];
                PA(Isc,2) = ["35000.0"];
                AE(Isc,1) = ["0.0"];
                AE(Isc,2) = ["0.0"];
            inc(Isc)   = ["0"];   % deg
            RAAN(Isc)  = ["0.0"]; % deg
            w(Isc)     = ["0.0"]; % deg
            theta(Isc) = ["0.0"]; % deg
            % RV orbit
            RV_x(Isc,1) = ["0.0"];
            RV_x(Isc,2) = ["0.0"];
            RV_x(Isc,3) = ["0.0"];
            RV_v(Isc,1) = ["0.0"];
            RV_v(Isc,2) = ["0.0"];
            RV_v(Isc,3) = ["0.0"];
            % File orbit
            TLE_TRV(Isc) = ["TLE"]; % TLE or TRV format, Label to find in file 
            if((TLE_TRV(Isc) == "TLE") && (Isc == 1))
               [sat_id] = TLE_to_42(folder); 
               file_label(Isc) = strcat("""",sat_id(Isc),"""");
               description(Isc) = sat_id(Isc);
               file_name(Isc)  = ["""TLE_IRIDIUM_NEXT.txt"""];
            
            elseif ((TLE_TRV(Isc) == "TLE") && (Isc ~= 1))
                file_label(Isc) = strcat("""",sat_id(Isc),"""");
                description(Isc) = sat_id(Isc);
                file_name(Isc)  = ["""TLE_IRIDIUM_NEXT.txt"""];
            end
            
            if (TLE_TRV(Isc) == "TRV")
               warning("TRV format not implemented !") 
            end
    
          
        
        
        % Orbit Type Zero
        if (orbit_type == "ZERO")  
            description(Isc) = ["ROVER"];
        % Orbit Type Flight
        elseif (orbit_type == "FLIGHT") 
            description(Isc) = ["REENTRY"];
        % Orbit Type Central
        elseif ((orbit_type(Isc) == "CENTRAL") && (KEP_RV_FILE(Isc) ~= "FILE"))
            description(Isc) = ["LEOSAT"];              
        % Orbit Type Three Body
            % WIP
        end
    end
              
    
    for i = 1:1:str2double(reference_orbits)       

        % File structure
        name      = "SAT";
        name_txt  = strcat("Orb_",name,"_",sprintf('%.f',i),".txt");
        orbit_name(i) = name_txt;
        directory = strcat(folder,filesep,name_txt);

        % Variables to .txt format
        fid = fopen(directory,'w');

        fprintf(fid,"%s \n","<<<<<<<<<<<<<<<<<  42: Orbit Description File   >>>>>>>>>>>>>>>>>");
        fprintf(fid,"%s \t\t\t %s \n",description(i),"!  Description");
        fprintf(fid,"%s \t\t %s \n",orbit_type(i),"!  Orbit Type (ZERO, FLIGHT, CENTRAL, THREE_BODY)");
        fprintf(fid,"%s \n","::::::::::::::  Use these lines if ZERO           :::::::::::::::::");
        fprintf(fid,"%s \t\t %s \n",world(i),"!  World");
        fprintf(fid,"%s \t\t %s \n",grav_0(i),"! Use Polyhedron Gravity");
        fprintf(fid,"%s \n","::::::::::::::  Use these lines if FLIGHT         :::::::::::::::::");
        fprintf(fid,"%s \t\t %s \n",region(i),"!  Region Number");
        fprintf(fid,"%s \t\t %s \n",gravity_F(i),"! Use Polyhedron Gravity");
        fprintf(fid,"%s \n","::::::::::::::  Use these lines if CENTRAL        :::::::::::::::::");
        fprintf(fid,"%s \t\t %s \n",orbit_center(i),"!  Orbit Center");
        fprintf(fid,"%s \t\t %s \n",J2(i),"!  Secular Orbit Drift Due to J2");
        fprintf(fid,"%s \t\t %s \n",KEP_RV_FILE(i),"!  Use Keplerian elements (KEP) or (RV) or FILE");
        fprintf(fid,"%s \t\t %s \n",PA_AE(i),"!  Use Peri/Apoapsis (PA) or min alt/ecc (AE)");
        fprintf(fid,"%s %s \t %s \n",PA(i,1),PA(i,2),"!  Periapsis & Apoapsis Altitude, km");
        fprintf(fid,"%s %s \t %s \n",AE(i,1),AE(1,2),"!  Min Altitude (km), Eccentricity");
        fprintf(fid,"%s \t\t %s \n",inc(i),"!  Inclination (deg)");
        fprintf(fid,"%s \t\t %s \n",RAAN(i),"!  Right Ascension of Ascending Node (deg)");
        fprintf(fid,"%s \t\t %s \n",w(i),"!  Argument of Periapsis (deg)");
        fprintf(fid,"%s \t\t %s \n",theta(i),"!  True Anomaly (deg)");
        fprintf(fid,"%s %s %s \t %s \n",RV_x(i,1),RV_x(i,2),RV_x(i,3),"!  RV Initial Position (km)");
        fprintf(fid,"%s %s %s \t %s \n",RV_v(i,1),RV_v(i,2),RV_v(i,3),"!  RV Initial Velocity (km/sec)");
        fprintf(fid,"%s %s \t %s \n",TLE_TRV(i),file_label(i),"!  TLE or TRV format, Label to find in file");
        fprintf(fid,"%s \t\t %s \n",file_name(i),"!  File name");
        fprintf(fid,"%s \n",":::::::::::::  Use these lines if THREE_BODY      ::::::::::::::::");
        fprintf(fid,"%s \n","Undefined !  Lagrange system");
        fprintf(fid,"%s \n","Undefined !  Propagate using LAGDOF_MODES or LAGDOF_COWELL or LAGDOF_SPLINE");
        fprintf(fid,"%s \n","Undefined !  Initialize with MODES or XYZ or FILE");
        fprintf(fid,"%s \n","Undefined !  Libration point (L1, L2, L3, L4, L5)");
        fprintf(fid,"%s \n","Undefined !  XY Semi-major axis, km");
        fprintf(fid,"%s \n","Undefined !  Initial XY Phase, deg  (CCW from -Y)");
        fprintf(fid,"%s \n","Undefined !  Sense (CW, CCW), viewed from +Z");
        fprintf(fid,"%s \n","Undefined !  Second XY Mode Semi-major Axis, km (L4, L5 only)");
        fprintf(fid,"%s \n","Undefined !  Second XY Mode Initial Phase, deg (L4, L5 only)");
        fprintf(fid,"%s \n","Undefined !  Sense (CW, CCW), viewed from +Z (L4, L5 only)");
        fprintf(fid,"%s \n","Undefined !  Z Semi-axis, km");
        fprintf(fid,"%s \n","Undefined !  Initial Z Phase, deg");
        fprintf(fid,"%s \n","Undefined !  Initial X, Y, Z (Non-dimensional)");
        fprintf(fid,"%s \n","Undefined !  Initial Xdot, Ydot, Zdot (Non-dimensional)");
        fprintf(fid,"%s \n","Undefined !  TLE, TRV or SPLINE format, Label to find in file");
        fprintf(fid,"%s \n","Undefined !  File name");
        fprintf(fid,"%s \n","******************* Formation Frame Parameters ************************");
        fprintf(fid,"%s \n","L                             !  Formation Frame Fixed in [NL]");
        fprintf(fid,"%s \n","0.0  0.0  0.0  123            !  Euler Angles (deg) and Sequence");
        fprintf(fid,"%s \n","L                             !  Formation Origin expressed in [NL]");
        fprintf(fid,"%s \n","0.0  0.0  0.0                 !  Formation Origin wrt Ref Orbit (m)");

        fclose(fid);
        
    end
    
    for on_off = 1:1:str2double(reference_orbits)     
        orbits(on_off,1) = "TRUE";
        orbits(on_off,2) = orbit_name(on_off);
    end
end