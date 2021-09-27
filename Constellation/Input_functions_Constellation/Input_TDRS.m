function Input_TDRS(folder)
    
    % File structure
    name = "Inp_TDRS";
    name_txt = strcat(name,".txt");
    directory = strcat(folder,filesep,name_txt);
    
    fid = fopen(directory,'w');

    fprintf(fid,"%s \n","<<<<<<<<<<<<<<<<<<<  42 TDRS Configuration File  >>>>>>>>>>>>>>>>>>>>>>");
    fprintf(fid,"%s \n","FALSE  ""TDRS-1""             ! TDRS-1 Exists, Designation");
    fprintf(fid,"%s \n","FALSE  ""In Memorium""        ! TDRS-2 was lost along with Challenger");
    fprintf(fid,"%s \n","TRUE   ""TDZ""                ! TDRS-3 Exists, Designation");
    fprintf(fid,"%s \n","FALSE  ""TDS""                ! TDRS-4 Exists, Designation");
    fprintf(fid,"%s \n","FALSE  ""TD171""              ! TDRS-5 Exists, Designation");
    fprintf(fid,"%s \n","TRUE   ""TDW""                ! TDRS-6 Exists, Designation");
    fprintf(fid,"%s \n","FALSE  ""TDRS-7""             ! TDRS-7 Exists, Designation");
    fprintf(fid,"%s \n","FALSE  ""TD271""              ! TDRS-8 Exists, Designation");
    fprintf(fid,"%s \n","FALSE  ""TDRS-9""             ! TDRS-9 Exists, Designation");
    fprintf(fid,"%s \n","TRUE   ""TDE""                ! TDRS-10 Exists, Designation");

    fclose(fid);
end