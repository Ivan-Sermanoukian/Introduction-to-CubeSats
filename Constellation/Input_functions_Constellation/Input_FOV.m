function Input_FOV(folder)
    
    % File structure
    name = "Inp_FOV";
    name_txt = strcat(name,".txt");
    directory = strcat(folder,filesep,name_txt);
    
    fid = fopen(directory,'w');
    
    fprintf(fid,"%s \n","/*                 Note: FOV Boresight is +Z Axis                 */");
    fprintf(fid,"%s \n","************************* Fields of View ***************************");
    fprintf(fid,"%s \n","4                                  !  Number of FOVs");
    fprintf(fid,"%s \n","--------------------------------------------------------------------");
    fprintf(fid,"%s \n","""SOLID""                            !  Label");
    fprintf(fid,"%s \n","4   4.0                            !  Number of Sides, Length [m]");
    fprintf(fid,"%s \n","8.0  4.0                           !  X Width, Y Height [deg]");
    fprintf(fid,"%s \n","0.0 1.0 0.0 0.5                    !  Color RGB+Alpha");
    fprintf(fid,"%s \n","SOLID                              !  WIREFRAME, SOLID, VECTOR, or PLANE");
    fprintf(fid,"%s \n","TRUE  TRUE                         !  Draw Near Field, Draw Far Field");
    fprintf(fid,"%s \n","0  0                               !  SC, Body ");
    fprintf(fid,"%s \n","0.0  0.0  1.0                      !  Position in Body [m]");
    fprintf(fid,"%s \n","0.0  0.0  0.0  321                 !  Euler Angles [deg], Sequence");
    fprintf(fid,"%s \n","--------------------------------------------------------------------");
    fprintf(fid,"%s \n","""WIRE""                             !  Label");
    fprintf(fid,"%s \n","24   4.0                           !  Number of Sides, Length [m]");
    fprintf(fid,"%s \n","10.0  5.0                          !  X Width, Y Height [deg]");
    fprintf(fid,"%s \n","0.7 0.7 0.0 1.0                    !  Color RGB+Alpha");
    fprintf(fid,"%s \n","WIREFRAME                          !  WIREFRAME, SOLID, VECTOR, or PLANE");
    fprintf(fid,"%s \n","TRUE  TRUE                         !  Draw Near Field, Draw Far Field");
    fprintf(fid,"%s \n","0  0                               !  SC, Body"); 
    fprintf(fid,"%s \n","1.0  0.0  0.0                      !  Position in Body [m]");
    fprintf(fid,"%s \n","90.0  0.0  0.0  213                !  Euler Angles [deg], Sequence");
    fprintf(fid,"%s \n","--------------------------------------------------------------------");
    fprintf(fid,"%s \n","""VECTOR""                           !  Label");
    fprintf(fid,"%s \n","0   4.0                            !  Number of Sides, Length [m]");
    fprintf(fid,"%s \n","0.0  0.0                           !  X Width, Y Height [deg]");
    fprintf(fid,"%s \n","0.0 1.0 1.0 1.0                    !  Color RGB+Alpha");
    fprintf(fid,"%s \n","VECTOR                             !  WIREFRAME, SOLID, VECTOR, or PLANE"); 
    fprintf(fid,"%s \n","TRUE  TRUE                         !  Draw Near Field, Draw Far Field");
    fprintf(fid,"%s \n","0  0                               !  SC, Body"); 
    fprintf(fid,"%s \n","1.0  0.0  0.0                      !  Position in Body [m]");
    fprintf(fid,"%s \n","135.0  0.0  0.0  213               !  Euler Angles [deg], Sequence");
    fprintf(fid,"%s \n","--------------------------------------------------------------------");
    fprintf(fid,"%s \n","""PLANE""                            !  Label");
    fprintf(fid,"%s \n","24    8.0                          !  Number of Sides, Length [m]");
    fprintf(fid,"%s \n","0.0  0.0                           !  X Width, Y Height [deg]");
    fprintf(fid,"%s \n","1.0 1.0 1.0 0.3                    !  Color RGB+Alpha");
    fprintf(fid,"%s \n","PLANE                              !  WIREFRAME, SOLID, VECTOR, or PLANE"); 
    fprintf(fid,"%s \n","TRUE  TRUE                         !  Draw Near Field, Draw Far Field");
    fprintf(fid,"%s \n","0  0                               !  SC, Body");
    fprintf(fid,"%s \n","0.0  0.0  0.0                      !  Position in Body [m]");
    fprintf(fid,"%s \n","-45.0  0.0  0.0  213               !  Euler Angles [deg], Sequence");
    
    fclose(fid);
end