function [space_environment_models,F_10_7,Ap,magnetic_field,IGRF_degree,IGRF_order, ...
          Earth_model_N,Earth_model_M,Mars_model_N,Mars_model_M,Luna_model_N,Luna_model_M, ...
          Ephemerides] = Environment_models()
    
% Environment Models
space_environment_models = "USER"; % solar radio 10.7 cm flux 
    if (space_environment_models == "USER")
        F_10_7 = "230.0";
        Ap = "100.0";
    else
        F_10_7 = "0.0";
        Ap = "0.0";
    end

% Magnetic model
magnetic_field = "IGRF"; % (NONE,DIPOLE,IGRF)
IGRF_degree    = "8";    % IGRF Degree and Order (<=10)");
IGRF_order     = "8";

% Earth Gravity Model N and M (<=18)");
Earth_model_N = "8";
Earth_model_M = "8";

% Mars Gravity Model N and M (<=18)");
Mars_model_N = "2";
Mars_model_M = "0";

% Luna Gravity Model N and M (<=18)");
Luna_model_N = "2";
Luna_model_M = "0";

% Solar System
Ephemerides = "DE430"; %  (MEAN or DE430)

end