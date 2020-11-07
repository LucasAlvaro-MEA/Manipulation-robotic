function VrepSetJointTargetPosition(vrep, clientID, handles, joint_positions)
%
%
%
%
%
%
%
%
%

if length(handles) ~= length(joint_positions)
    disp('handles and joint position must have the same dimension');
    return;
end

% Pause the communication thread
vrep.simxPauseCommunication(clientID, 1);

for i=1:length(handles),
    vrep.simxSetJointTargetPosition(clientID, handles(i), joint_positions(i), vrep.simx_opmode_oneshot);
end

% Resume the communication thread to update all values at the same time
vrep.simxPauseCommunication(clientID, 0);