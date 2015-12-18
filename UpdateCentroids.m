function [ centroids,Stop ] = UpdateCentroids( dataset , firstTime, K , oldcentroids)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% we're taking centroids as param to compare the values of previous i.e the
% one passed to this function and the new one which we will be creating in
% the else condition. If the values does not change we will return 0 in the
% stop variable otherwise 1. If stop == 0. It means we will break out from
% the main loop.

Stop = 0;
StopVote = 0;
% if firstTime = 1 we'll select K centroids randomly otherwise we will find
% means of classes to determine new centroids.
centroids = zeros(K,K);
if firstTime==1
    s = randperm(size(dataset,1));
    centroids = dataset(s(1:K),:);
else
    %find mean for all classes using their euc distances.
    for i=1:K

        % Step 1 = find rows with the class label
        % Step 2 = find mean of X,Y values.
        % Step 3 = create new centroid
        
        % get all rows with class value 'i'
        classMatrix = dataset(dataset(:,5)==i,:);
        
        X = mean(classMatrix(:,1));
        Y = mean(classMatrix(:,2));

        centroids(i,1) = X;
        centroids(i,2) = Y;
        centroids(i,3) = i;
    end
    
    for i=1:K
        for j=1:size(oldcentroids(:,1),1)
            if oldcentroids(j,1) == centroids(i,1) && oldcentroids(j,1) == centroids(i,1)
             StopVote = StopVote + 1;    
            end
        end
    end
    
    if StopVote == K
        % centroids are not changing. Stop Now !!!.
        Stop = 1;
    else
        % don't stop.
        Stop = 0;
    end
end
    centroids;

end

