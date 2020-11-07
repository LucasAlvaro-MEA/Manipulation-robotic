function [all_ok, listObjects]=VrepGetHandles(vrep, clientID, listObjects)


    all_ok = true;
    for i=1:length(listObjects),    
        objectName=listObjects(i).name; 
        [error, handle] = vrep.simxGetObjectHandle(clientID, objectName, vrep.simx_opmode_oneshot_wait);
        all_ok = all_ok & (error == vrep.simx_return_ok);
        listObjects(i).handle=handle;
    end