% Set up python path
% function setUpPyPath
pathToAQ = fileparts(which('net.py'));
if count(py.sys.path,pathToAQ) == 0
    insert(py.sys.path,int32(0),pathToAQ);
end