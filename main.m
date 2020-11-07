clc
clear all
close all
hold on

dt=0.01;


disp('Open Vrep Api............');
[vrep, clientID]=VrepOpenApi();

%%%%%%%%%%%%%%%%%%  POUR MODE SYNCHRO %%%%%%%%%%%%%%%%%%%%%
% configure le mode synchronous
vrep.simxSynchronous(clientID,true)

% Configure le pas de simulation à dt
% ATTENTION  pris en compte uniquement si dt=Custom sur VREP
vrep.simxSetFloatingParameter(clientID,vrep.sim_floatparam_simulation_time_step,dt,vrep.simx_opmode_oneshot)

% démarre la sumulation en mode oneshot_wait (un pas et attend)
vrep.simxStartSimulation(clientID,vrep.simx_opmode_oneshot_wait);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



disp('Retrieving all the joint handles.......');

%récupération des handles des articulations (joint1..joint6)
for idobj=1:6,
        objectName=strcat('joint',num2str(idobj));
        listObjects(idobj).name=objectName;
end
[all_ok, listObjects]=VrepGetHandles(vrep, clientID, listObjects);

if all_ok == false
       disp('An error occured while retrieving the object handles ==> stop simulation');
       return;
end



%-----------------
% Simulation
%-----------------

N=1000;
q=[0 0 0 0 0 0];


for i=1:N,
    % jjuste pour faire osciller une articulation...
    q(1)=0.2*sin(4*2*pi*i/N);

    %
    vrep.simxPauseCommunication(clientID, 1);
    %envoie une consigne
    vrep.simxSetJointTargetPosition(clientID, listObjects(1).handle , q(1), vrep.simx_opmode_oneshot);
    % on peut envoyer les autres ordres ici...

    % réactive VREP et applique toutes les consignes simultanément
    vrep.simxPauseCommunication(clientID, 0);

    %Active 1 pas de simulation :
    vrep.simxSynchronousTrigger(clientID);


    %lecture des position dans vrep
    [err, q(1)]=vrep.simxGetJointPosition(clientID, listObjects(1).handle, vrep.simx_opmode_oneshot_wait);

end


pause(2)
%Arrete le simulateur
vrep.simxStopSimulation(clientID,vrep.simx_opmode_oneshot_wait);
% Ferme la connexion réseau à VREP
vrep.simxFinish(-1);

vrep.delete();
