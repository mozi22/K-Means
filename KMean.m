function [ centroids] = KMean( dataset , K )
%UNTITLED Summary of this function goes here
% Detailed explanation goes here

% Exercise 7.1
% 3 data points.

% loop parent.
% compare value with all centroids and assign it to the closest one.
% calculate mean for all k's.
firstTime = 1;
centroids = 0;
a=1;
colors = rand(K,3);
    while 1==1

        [centroids,Stop] = UpdateCentroids(dataset,firstTime,K,centroids);
         if Stop == 1
             break;
         end
        [dataset,distortion] = Assignment(dataset,centroids,K,colors,a);
        firstTime = 0;
        g(a,:) = [a distortion];
        a = a+1;
    end

    g
    figure(2);
    hold on;
    plot(g(:,1),g(:,2),'b--o');
    xlabel('Iterations (i)') % x-axis label
    ylabel('Distortion (J)') % y-axis label
    title('Distortion Measure')
end

