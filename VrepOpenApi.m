function [vrep, clientID]=VrepOpenApi()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
%clientID=vrep.simxStart('127.0.0.1',5555,true,true,5000,5); % Connect to the remote api server on port 5555 
clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5); % Connect to the remote api server on port 5555


