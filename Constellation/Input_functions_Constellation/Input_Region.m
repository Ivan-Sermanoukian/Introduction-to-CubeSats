function Input_Region(folder)

    % Constants
    regions = "2";
    existance = ["FALSE","FALSE"];
    reg_name = ["""TAG""","""LZ"""];
    world = ["MINORBODY_2","EARTH"];
    POSW_LLA = ["POSW","LLA"]; 
        % idk what this is 
    POSW = ["2400.9966","-1074.41895","439.1271";
            "0.0","0.0","0.0"];
        % Lng, Lat (deg), Alt (m)
    LLA = ["-24.120375966731","9.48979662","27.7155"; 
           "-80.53","28.46","1000.0"];
        % Elasticity, Damping, Friction Coef.
    EDFC = ["1.0E6","1.0E4","0.1";
            "1.0E6","1.0E4","0.1"];
        % Geometry File Name
    GFN = ["Rgn_TAG.obj","Rgn_Terrain.obj"];
    
    % File structure
    name = "Inp_Region";
    name_txt = strcat(name,".txt");
    directory = strcat(folder,filesep,name_txt);

    fid = fopen(directory,'w');
    
    fprintf(fid,"%s \n","********************  Regions for 42  *******************"); 
    fprintf(fid,"%s \t\t %s \n",regions,"!  Number of Regions");
    
    for i=1:1:str2double(regions)
       
       fprintf(fid,"%s \n","---------------------------------------------------------"); 
       fprintf(fid,"%s \t\t %s \n",existance(i),"! Exists");
       fprintf(fid,"%s \t\t %s \n",reg_name(i),"! Name");
       fprintf(fid,"%s \t\t %s \n",world(i),"! World");
       fprintf(fid,"%s \t\t %s \n",POSW_LLA(i),"! POSW or LLA");
       fprintf(fid,"%s %s %s \t %s \n",POSW(i,1),POSW(i,2),POSW(i,3),"! Position in W, m");
       fprintf(fid,"%s %s %s \t %s \n",LLA(i,1),LLA(i,2),LLA(i,3),"! Lng, Lat (deg), Alt (m)");
       fprintf(fid,"%s %s %s \t %s \n",EDFC(i,1),EDFC(i,2),EDFC(i,3),"! Elasticity, Damping, Friction Coef");
       fprintf(fid,"%s \t\t %s \n",GFN(i),"! Geometry File Name");
    end
    
    fclose(fid);
end