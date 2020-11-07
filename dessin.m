function[origine1] = dessin(mat)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Argument en ligne
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

X0 = [1 0 0 0];
Y0 = [0 1 0 0];
Z0 = [0 0 1 0];
figure(1)
hold on

origine1=mat(:,end); %dernière colonne
origine1=origine1(1:3)
%origineN
%prsmt01=line([origine1(1) 0 0],[0 origine1(2) 0],[0 0 origine1(3)]);
%plot3(origine1',origineN,'k-');
hold on

X1=mat*([X0])';
Y1=mat*([Y0])';
Z1=mat*([Z0])';

quiver3(origine1(1),origine1(2),origine1(3),X1(1),X1(2),X1(3),'r');
hold on
quiver3(origine1(1),origine1(2),origine1(3),Y1(1),Y1(2),Y1(3),'g');
hold on
quiver3(origine1(1),origine1(2),origine1(3),Z1(1),Z1(2),Z1(3),'b');
hold on




