function Input_Graphics(folder)
    
    % File structure
    name = "Inp_Graphics";
    name_txt = strcat(name,".txt");
    directory = strcat(folder,filesep,name_txt);
    
    fid = fopen(directory,'w');
    
    fprintf(fid,"%s \n","<<<<<<<<<<<<<<<<  42 Graphics Configuration File  >>>>>>>>>>>>>>>>>>>");
    fprintf(fid,"%s \t\t %s \n","1.0","!  GL Output Interval [sec]");
    fprintf(fid,"%s \t\t %s \n","Skymap09.txt","!  Star Catalog File Name");
    fprintf(fid,"%s \t\t %s \n","TRUE","!  Map Window Exists");
    fprintf(fid,"%s \t\t %s \n","TRUE","!  Orrery Window Exists");
    fprintf(fid,"%s \t\t %s \n","TRUE","!  Unit Sphere Window Exists");
    fprintf(fid,"%s \n","******************************* POV *********************************");
    fprintf(fid,"%s \t\t %s \n","FALSE","!  Pause at Startup");
    fprintf(fid,"%s \t\t %s \n","TRACK_HOST","!  POV Mode (TRACK_HOST, TRACK_TARGET, FIXED_IN_HOST)");
    fprintf(fid,"%s \t\t %s \n","SC","!  Host Type (WORLD, REFORB, FRM, SC, BODY)");
    fprintf(fid,"%s %s %s \t %s \n","0","0","L","!  Initial Host SC, Body, POV Frame");
    fprintf(fid,"%s \t\t %s \n","SC","!  Target Type (WORLD, REFORB, FRM, SC, BODY)");
    fprintf(fid,"%s %s %s \t %s \n","0","0","L","!  Initial Target SC, Body, POV Frame");
    fprintf(fid,"%s \t\t %s \n","POS_Z","!  Boresight Axis");
    fprintf(fid,"%s \t\t %s \n","NEG_Y","!  Up Axis");
    fprintf(fid,"%s \t\t %s \n","40.0","!  Initial POV Range from Target [m]");
    fprintf(fid,"%s \t\t %s \n","30.0","!  POV Angle (Vertical) [deg]");
    fprintf(fid,"%s %s %s \t %s \n","0.0","0.0","0.0","!  POV Position in Host [m]");
    fprintf(fid,"%s \t\t %s \n","FRONT","!  Initial POV View (FRONT, FRONT_RIGHT, etc)");
    fprintf(fid,"%s \n","******************************* CAM *********************************");
    fprintf(fid,"%s \t\t %s \n","""42 Cam""","! Cam Title [delimited by quotation marks]");
    fprintf(fid,"%s %s \t %s \n","800","800","!  Width, Height [pixels]");
    fprintf(fid,"%s \t\t %s \n","5.0E-5","!  Mouse Scale Factor");
    fprintf(fid,"%s \t\t %s \n","1.8","!  Display's Gamma Exponent (1.8-4.0)");
    fprintf(fid,"%s \n","************************** CAM Show Menu ****************************");
    fprintf(fid,"%s %s \t %s \n","FALSE","""N Axes""","!  Show N Axes");
    fprintf(fid,"%s %s \t %s \n","FALSE","""L Axes""","!  Show L Axes");
    fprintf(fid,"%s %s \t %s \n","FALSE","""F Axes""","!  Show F Axes");
    fprintf(fid,"%s %s \t %s \n","FALSE","""B Axes""","!  Show B Axes");
    fprintf(fid,"%s %s \t %s \n","FALSE","""N Grid""","!  Show N Grid");
    fprintf(fid,"%s %s \t %s \n","FALSE","""L Grid""","!  Show L Grid");
    fprintf(fid,"%s %s \t %s \n","FALSE","""F Grid""","!  Show F Grid");
    fprintf(fid,"%s %s \t %s \n","FALSE","""B Grid""","!  Show B Grid");
    fprintf(fid,"%s %s \t %s \n","FALSE","""Gal Grid""","!  Show B Grid");
    fprintf(fid,"%s %s \t %s \n","FALSE","""FOVs""","!  Show Fields of View");
    fprintf(fid,"%s %s \t %s \n","FALSE","""Prox Ops""","!  Show Prox Ops");
    fprintf(fid,"%s %s \t %s \n","FALSE","""TDRS""","!  Show TDRS Satellites");
    fprintf(fid,"%s %s \t %s \n","TRUE","""Shadows""","!  Show Shadows");
    fprintf(fid,"%s %s \t %s \n","FALSE","""Astro Labels""","!  Show Astro Labels");
    fprintf(fid,"%s %s \t %s \n","FALSE","""Truth Vectors""","!  Show Truth Vectors");
    fprintf(fid,"%s %s \t %s \n","FALSE","""FSW Vectors""","!  Show FSW Vectors");
    fprintf(fid,"%s %s \t %s \n","TRUE","""Milky Way""","!  Show Milky Way");
    fprintf(fid,"%s %s \t %s \n","FALSE","""Fermi Sky""","!  Show Fermi Sky");
    fprintf(fid,"%s \n","******************************* MAP *********************************");
    fprintf(fid,"%s \t\t %s \n","""42 Map""","! Map Title [delimited by quotations marks]");
    fprintf(fid,"%s %s \t %s \n","512","256","!  Width, Height [pixels]");
    fprintf(fid,"%s \n","************************** MAP Show Menu ****************************");
    fprintf(fid,"%s %s \t %s \n","TRUE","""Clock""","!  Show Clock");
    fprintf(fid,"%s %s \t %s \n","TRUE","""Tlm Clock""","!  Show Clock");
    fprintf(fid,"%s %s \t %s \n","FALSE","""Credits""","!  Show Credits");
    fprintf(fid,"%s %s \t %s \n","TRUE","""Night""","!  Show Night");
    fprintf(fid,"%s \n","********************* Unit Sphere Show Menu *************************");
    fprintf(fid,"%s \t\t %s \n","TRUE","Show Major Constellations");
    fprintf(fid,"%s \t\t %s \n","TRUE","!  Show Zodiac Constellations");
    fprintf(fid,"%s \t\t %s \n","FALSE","!  Show Minor Constellations");

    fclose(fid);
end