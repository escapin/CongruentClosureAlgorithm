close all
clear all
clc
edgeRand=[50 180 421 448 997 1162 2151 2353 3809 4926 5935 8359 10455 10563 13207 22319];
timeRand_H=[0 10 20 30 60 40 90 80 140 250 130 420 220 320 360 920];
timeRand=[0 10 30 30 50 50 170 110 14840 8400 2690 40980 68960 78020 293820 997940];
figure
semilogy(edgeRand, timeRand, '-b', edgeRand, timeRand_H, '--r');
grid on
xlabel('number edges');
ylabel('time (log scale)');
hleg=legend('Nelson Oppen','NelsonOppen+Heur');
set(hleg,'Location','NorthWest');


edgeSodd=[36 131 195 391 471 1357 1955 2314 3080 6111 8450 11633 12422 15041 27466 31080];
timeSodd_H=[0 20 10 30 20 70 220 390 280 1590 2420 5440 7630 7660 19660 34350];
timeSodd=[20 10 20 60 30 80 1400 3050 540 21660 22060 153470 158840 124380 1331420 1184730];
figure
semilogy(edgeSodd, timeSodd, '-b', edgeSodd, timeSodd_H, '--r');
grid on
xlabel('number edges');
ylabel('time (log scale)');
hleg=legend('Nelson Oppen','NelsonOppen+Heur');
set(hleg,'Location','NorthWest');
