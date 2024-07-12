function [xyz] = 3Dcoord(x, k, alpha)

lx = x(2)-x(1);

% Initialization
xyz = [0;0;0];
Mrot = eye(3);    

% Recovering shape
for s = 1:length(x)

    xyz_temp = [1/k(s)*(1-cos(lx*k(s)))*sind(alpha(s)); 1/k(s)*(1-cos(lx*k(s)))*cosd(alpha(s)); 1/k(s)*sin(lx*k(s))];
    xyz(:,s+1) = xyz(:,s) + Mrot*xyz_temp;
    Mrot = rotz(-alpha(s))*rotx(-180/pi*lx*k(s))*rotz(alpha(s))*Mrot;

end % s = 1:length(x)

xyz = 1000*xyz; % Coordinates in mm

end % function 3Dcoord
