function [ dataset, distortion ] = Assignment( dataset,centroids, K ,colors,attempt)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% size/rows of centroid matrix == K
% attempt is how many times we updated our mean.

    for i=1:size(dataset(:,1),1)
        for j=1:size(centroids(:,1),1)           
            % add them in a matrix to calculate euc distance
            X = [dataset(i,1) dataset(i,2);centroids(j,1),centroids(j,2)];
            % calculating the euc dist b/w centroid and the point x_n and
            % adding it to the fourth column of centroids matrix.
            centroids(j,4) = pdist(X);

            % here j is representing the ID/class of K.Adding to the 5th
            % column of the centroids matrix.
            centroids(j,5) = j;
        end
        
        % get the row with min euc distance of centroid to that point.4th
        % column represents the euc distances calculated for that
        % particular point from all the centroids.
        minEuc   = centroids(:,4);
        minClass = centroids(:,5);

        %assign the class to the datapoint for being closest to that class.
        %By class I mean K or centroid.5th column represents the class/id
        %of the centroid.
        
        %row and column containing the min euclidean distance
        [r,c] = find(minEuc==min(min(minEuc)));
        dataset(i,4) = min(minEuc); % euc dist
        dataset(i,5) = minClass(r,1); % class
    end
    

    clf('reset');
    
    
    figure(1);
    hold on;
    distortion = 0;
    for i=1:K
        
        classpoints = dataset(dataset(:,5)==i,:);
        scatter(classpoints(:,1),classpoints(:,2),20,colors(i,:));
        scatter(centroids(i,1),centroids(i,2),50,'b+');
        
        % here 'i' is the loop iteration or class.
        % classpoints contains all the points with class value 'i'.
        x = [classpoints(:,1),classpoints(:,2)];

        % centroid number 'i'.
        y = [centroids(i,1),centroids(i,2)];
        
        % remove the row with value 0 since that is the euc distance of centroid to itself.
	% after removing that you can select the value with minimum distortion. 
        JFinder = pdist2(x,y);
        [r,c] = find(JFinder==min(min(JFinder)));
        JFinder(r,:) = [];
        distortion = distortion + min(JFinder);
        drawnow;
    end
    
    
end

