function [ta, tf]=CalculeTrapeze(robot,qi,qf,duree)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Argument en ligne
%
%1ligne et colonne suivante: robot(1)= angle limite, robot(2) vit limite, robot(3) accl limit
%Qi 1Colonnes
%Qf 1Colonnes
%duree un temps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

timin=robot(3)/robot(4);
tvmin=(abs((qf-qi))-robot(4)*timin*timin)/robot(3);
tfmin=2*timin+tvmin;
if duree/2<=timin
    ta=timin;
    tf=tfmin;
else
    ta=duree/2+timin;
    tf=duree;
end
