function Input_IPC(folder)
    
    % File structure
    name = "Inp_IPC";
    name_txt = strcat(name,".txt");
    directory = strcat(folder,filesep,name_txt);
    
    fid = fopen(directory,'w');
    
    fprintf(fid,"%s \n","<<<<<<<<<<<<<<< 42: InterProcess Comm Configuration File >>>>>>>>>>>>>>>>");
    fprintf(fid,"%s \n","0                                       ! Number of Sockets");
    fprintf(fid,"%s \n","**********************************  IPC 0   *****************************");
    fprintf(fid,"%s \n","OFF                                     ! IPC Mode (OFF,TX,RX,TXRX,ACS,WRITEFILE,READFILE)");
    fprintf(fid,"%s \n","0                                       ! AC.ID for ACS mode");
    fprintf(fid,"%s \n","""State00.42""                            ! File name for WRITE or READ");
    fprintf(fid,"%s \n","CLIENT                                  ! Socket Role (SERVER,CLIENT,GMSEC_CLIENT)");
    fprintf(fid,"%s \n","localhost     10001                     ! Server Host Name, Port ");
    fprintf(fid,"%s \n","TRUE                                    ! Allow Blocking (i.e. wait on RX)");
    fprintf(fid,"%s \n","TRUE                                    ! Echo to stdout");
    fprintf(fid,"%s \n","3                                       ! Number of TX prefixes");
    fprintf(fid,"%s \n","""SC""                                    ! Prefix 0");
    fprintf(fid,"%s \n","""Orb""                                   ! Prefix 1");
    fprintf(fid,"%s \n","""World""                                 ! Prefix 2");
    fprintf(fid,"%s \n","**********************************  IPC 1   *****************************");
    fprintf(fid,"%s \n","OFF                                     ! IPC Mode (OFF,TX,RX,TXRX,ACS,WRITEFILE,READFILE)");
    fprintf(fid,"%s \n","0                                       ! AC.ID for ACS mode");
    fprintf(fid,"%s \n","""State01.42""                            ! File name for WRITE or READ");
    fprintf(fid,"%s \n","CLIENT                                  ! Socket Role (SERVER,CLIENT,GMSEC_CLIENT)");
    fprintf(fid,"%s \n","localhost     10002                     ! Server Host Name, Port ");
    fprintf(fid,"%s \n","TRUE                                    ! Allow Blocking (i.e. wait on RX)");
    fprintf(fid,"%s \n","FALSE                                   ! Echo to stdout");
    fprintf(fid,"%s \n","1                                       ! Number of TX prefixes");
    fprintf(fid,"%s \n","""SC[0].AC""                              ! Prefix 0");
    fprintf(fid,"%s \n","**********************************  IPC 2   *****************************");
    fprintf(fid,"%s \n","OFF                                     ! IPC Mode (OFF,TX,RX,TXRX,ACS,WRITEFILE,READFILE)");
    fprintf(fid,"%s \n","1                                       ! AC.ID for ACS mode");
    fprintf(fid,"%s \n","""State02.42""                            ! File name for WRITE or READ");
    fprintf(fid,"%s \n","CLIENT                                  ! Socket Role (SERVER,CLIENT,GMSEC_CLIENT)");
    fprintf(fid,"%s \n","localhost     10003                     ! Server Host Name, Port ");
    fprintf(fid,"%s \n","TRUE                                    ! Allow Blocking (i.e. wait on RX)");
    fprintf(fid,"%s \n","FALSE                                   ! Echo to stdout");
    fprintf(fid,"%s \n","1                                       ! Number of TX prefixes");
    fprintf(fid,"%s \n","""SC[1].AC""                              ! Prefix 0");
    fprintf(fid,"%s \n","**********************************  IPC 3   *****************************");
    fprintf(fid,"%s \n","OFF                                     ! IPC Mode (OFF,TX,RX,TXRX,ACS,WRITEFILE,READFILE)");
    fprintf(fid,"%s \n","0                                       ! AC.ID for ACS mode");
    fprintf(fid,"%s \n","""State03.42""                            ! File name for WRITE or READ");
    fprintf(fid,"%s \n","CLIENT                                  ! Socket Role (SERVER,CLIENT,GMSEC_CLIENT)");
    fprintf(fid,"%s \n","localhost     10004                     ! Server Host Name, Port ");
    fprintf(fid,"%s \n","TRUE                                    ! Allow Blocking (i.e. wait on RX)");
    fprintf(fid,"%s \n","FALSE                                   ! Echo to stdout");
    fprintf(fid,"%s \n","1                                       ! Number of TX prefixes");
    fprintf(fid,"%s \n","""SC[0].Tach[0]""                         ! Prefix 0");
    
    fclose(fid);
end