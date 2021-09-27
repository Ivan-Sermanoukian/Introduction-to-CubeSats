function Input_Command_Script(folder,User_manual)

    % File structure
    name      = "Inp_Cmd";
    name_txt = strcat(name,".txt");
    directory = strcat(folder,"/",name_txt);
    
    fid = fopen(directory,'w');

    fprintf(fid,"%s \n","<<<<<<<<<<<<<<<<<  42:  Command Script File  >>>>>>>>>>>>>>>>>");
    % Insert commands here ------------------------------------------------
        
    
    
    % ---------------------------------------------------------------------
    fprintf(fid,"%s \n","EOF");
    
    if (User_manual == "TRUE") 
        fprintf(fid,"%s \n","##############################################################");
        fprintf(fid,"%s \n","# All lines after EOF are ignored");
        fprintf(fid,"%s \n","# Comment lines begin with #, %, or //");
        fprintf(fid,"%s \n","# Blank lines are permitted");
        fprintf(fid,"\n");
        fprintf(fid,"%s \n","# Here are recognized command formats.");
        fprintf(fid,"%s \n","#  %lf means that a floating-point number is expected");
        fprintf(fid,"%s \n","#  %ld means that an integer is expected");
        fprintf(fid,"%s \n","#  %s means that a string is expected");
        fprintf(fid,"%s \n","#  %c means that a character is expected");
        fprintf(fid,"%s \n","#  Look in functions SimCmdInterpreter, GuiCmdInterpreter, ");
        fprintf(fid,"%s \n","#     and FswCmdInterpreter for strings and characters that ");
        fprintf(fid,"%s \n","#     are meaningful in a particular context");
        fprintf(fid,"%s \n","#  The first %lf is always the SimTime of command execution.");
        fprintf(fid,"\n");
        fprintf(fid,"%s \n","# Sim-related commands");
        fprintf(fid,"%s \n","%lf DTSIM = %lf");
        fprintf(fid,"%s \n","%lf SC[%ld].RotDOF %s");
        fprintf(fid,"%s \n","%lf SC[%ld].G[%ld].RotLocked[%ld] %s");
        fprintf(fid,"%s \n","%lf SC[%ld].G[%ld].TrnLocked[%ld] %s");
        fprintf(fid,"%s \n","%lf Impart Impulsive Delta-V of [%lf %lf %lf] m/s in Frame %c to Orb[%ld]");
        fprintf(fid,"%s \n","   %c can be N or L");
        fprintf(fid,"%s \n","%lf SC[%ld].LoopGain = %lf");
        fprintf(fid,"%s \n","%lf SC[%ld].LoopDelay = %lf");
        fprintf(fid,"%s \n","%lf SC[%ld].GainAndDelayActive = %s");
        fprintf(fid,"\n");
        fprintf(fid,"%s \n","# GUI-related commands");
        fprintf(fid,"%s \n","%lf POV.Host.SC %ld");
        fprintf(fid,"%s \n","%lf CaptureCam %s");
        fprintf(fid,"%s \n","%lf CamSnap %s");
        fprintf(fid,"%s \n","%lf MapSnap %s");
        fprintf(fid,"%s \n","%lf Banner = ""Banner in Quotes""");
        fprintf(fid,"%s \n","%lf GL Output Step = %lf");
        fprintf(fid,"%s \n","%lf POV CmdRange = %lf");
        fprintf(fid,"%s \n","%lf POV CmdSeq = %ld");
        fprintf(fid,"%s \n","%lf POV CmdAngle = [%lf %lf %lf] deg");
        fprintf(fid,"%s \n","%lf POV CmdPermute = [%lf %lf %lf; %lf %lf %lf; %lf %lf %lf]");
        fprintf(fid,"%s \n","%lf POV TimeToGo = %lf");
        fprintf(fid,"%s \n","%lf POV Frame = %c");
        fprintf(fid,"%s \n","%lf ShowHUD %s");
        fprintf(fid,"%s \n","%lf ShowWatermark %s");
        fprintf(fid,"%s \n","%lf ShowShadows %s");
        fprintf(fid,"%s \n","%lf ShowProxOps %s");
        fprintf(fid,"%s \n","%lf ShowFOV %s");
        fprintf(fid,"%s \n","%lf FOV[%ld].NearExists =  %s");
        fprintf(fid,"%s \n","%lf FOV[%ld].FarExists =  %s");
        fprintf(fid,"\n");
        fprintf(fid,"%s \n","# FSW-related commands");
        fprintf(fid,"%s \n","%lf SC[%ld] FswTag = %s");
        fprintf(fid,"%s \n","   # %s is PASSIVE_FSW, PROTOTYPE_FSW, etc.");
        fprintf(fid,"%s \n","%lf SC[%ld] qrn = [%lf %lf %lf %lf]");
        fprintf(fid,"%s \n","%lf SC[%ld] qrl = [%lf %lf %lf %lf]");
        fprintf(fid,"%s \n","%lf SC[%ld] Cmd Angles = [%lf %lf %lf] deg, Seq = %ld wrt %c Frame");
        fprintf(fid,"%s \n","   # %c is either N or L");
        fprintf(fid,"%s \n","%lf SC[%ld].G[%ld] Cmd Angles = [%lf %lf %lf] deg");
        fprintf(fid,"%s \n","#  In the following, the (first) %s is either ""Primary"" or ""Secondary""");
        fprintf(fid,"%s \n","%lf Point SC[%ld].B[%ld] %s Vector [%lf %lf %lf] at RA = %lf deg, Dec = %lf deg");
        fprintf(fid,"%s \n","%lf Point SC[%ld].B[%ld] %s Vector [%lf %lf %lf] at World[%ld] Lng = %lf deg, Lat = %lf deg, Alt = %lf km");
        fprintf(fid,"%s \n","%lf Point SC[%ld].B[%ld] %s Vector [%lf %lf %lf] at World[%ld]");
        fprintf(fid,"%s \n","%lf Point SC[%ld].B[%ld] %s Vector [%lf %lf %lf] at GroundStation[%ld]");
        fprintf(fid,"%s \n","%lf Point SC[%ld].B[%ld] %s Vector [%lf %lf %lf] at %s");
        fprintf(fid,"%s \n","   # Last %s is SUN, MOON, any planet, VELOCITY, or MAGFIELD");
        fprintf(fid,"%s \n","%lf Point SC[%ld].B[%ld] %s Vector [%lf %lf %lf] at SC[%ld]");
        fprintf(fid,"%s \n","%lf Point SC[%ld].B[%ld] %s Vector [%lf %lf %lf] at SC[%ld].B[%ld] point [%lf %lf %lf]");
        fprintf(fid,"%s \n","%lf Align SC[%ld].B[%ld] %s Vector [%lf %lf %lf] with %c-frame Vector [%lf %lf %lf]");
        fprintf(fid,"%s \n","   # %c-frame can be H, N, or L");
        fprintf(fid,"%s \n","%lf Align SC[%ld].B[%ld] %s Vector [%lf %lf %lf] with SC[%ld].B[%ld] vector [%lf %lf %lf]");
        fprintf(fid,"%s \n","%lf SC[%ld].Thr[%ld] %s");
        fprintf(fid,"%s \n","   %s is OFF or ON");
        fprintf(fid,"%s \n","Event Eclipse Entry SC[%ld] qrl = [%lf %lf %lf %lf]");
        fprintf(fid,"%s \n","Event Eclipse Exit SC[%ld] qrl = [%lf %lf %lf %lf]");
        fprintf(fid,"%s \n","Event Eclipse Entry SC[%ld] Cmd Angles = [%lf %lf %lf] deg, Seq = %ld wrt %c Frame");
        fprintf(fid,"%s \n","   # %c is either N or L");
        fprintf(fid,"%s \n","Event Eclipse Exit SC[%ld] Cmd Angles = [%lf %lf %lf] deg, Seq = %ld wrt %c Frame");
        fprintf(fid,"%s \n","   # %c is either N or L");
        fprintf(fid,"%s \n","%lf Set SC[%ld] RampCoastGlide wc = %lf Hz, amax = %lf, vmax = %lf");
        fprintf(fid,"%s \n","%lf Spin SC[%ld] about Primary Vector at %lf deg/sec");
    end
    
    fclose(fid);   
    
end