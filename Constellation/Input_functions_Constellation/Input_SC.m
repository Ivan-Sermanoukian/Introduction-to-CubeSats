function [spacecraft] = Input_SC(folder,number_spacecraft)    

    option = 1;
    
    % Name dependant on TLE
    if(option == 1)
        [sat_id] = TLE_to_42(folder);
        sat_id = strrep(sat_id,' ','');
        
        source = strcat(pwd,filesep,"Templates",filesep,"SC_Cubesat1U.txt");
        destiny = strcat(folder);
        copyfile(source, destiny, 'f')
        % Read txt into cell A
            sat_name = 'SC_Cubesat1U.txt';
            directory = strcat(folder,filesep,sat_name);
            fid = fopen(directory,'r');
            
            i = 1;
            tline = fgetl(fid);
            A{i} = tline;
            while ischar(tline)
                i = i+1;
                tline = fgetl(fid);
                A{i} = tline;
            end
            fclose(fid);
        
        for on_off = 1:1:str2double(number_spacecraft)  
            
            % Change cell A
            A{3} = sprintf('%s',strcat('"',sat_id(on_off),'"',"                      !  Label"));
            % Write cell A into txt
            local_name = strcat(folder,filesep,sat_id(on_off),".txt");
            fid = fopen(local_name, 'w');
            for i = 1:numel(A)
                if A{i+1} == -1
                    fprintf(fid,'%s', A{i});
                    break
                else
                    fprintf(fid,'%s\n', A{i});
                end
            end
            
            spacecraft(on_off,1) = "TRUE";
            spacecraft(on_off,2) = (on_off - 1);
            spacecraft(on_off,3) = strcat(sat_id(on_off),".txt"); 
            
        end
        
    end
    

    
    % Same file
    if(option == 2)
        for on_off = 1:1:str2double(number_spacecraft)     
            spacecraft(on_off,1) = "TRUE";
            spacecraft(on_off,2) = (on_off - 1);
            spacecraft(on_off,3) = "SC_Cubesat1U.txt";
        end

        source = strcat(pwd,filesep,"Templates",filesep,"SC_Cubesat1U.txt");
        destiny = strcat(folder);
        copyfile(source, destiny, 'f')
    end
end