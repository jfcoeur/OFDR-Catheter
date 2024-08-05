function [err, xyz_min, k_min, alpha_min] = refmin(moy, Merr, k, alpha, xyze, r)

k_min = [];
alpha_min = [];
xyz_min = [];

[~,I] = min(moy,[],2);

for i = 1:size(Merr,3)

    % Errors
    err(:,:,i,r) = Merr(:,:,i,I(i));
    
    % k & alpha
    k_min(i,:) = k(i,:,I(i));
    alpha_min(i,:) = alpha(i,:,I(i));
    
    % 3D coordinates
    xyz = xyze(i,:,:,I(i));
    xyz_min(i,:,:) = reshape(xyz, [3,size(xyz,3)]);   

end % i = 1:size(Merr,3)

end % function refmin
