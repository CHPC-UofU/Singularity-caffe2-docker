-- -*- lua -*-
-- Written by MC on 3/6/2018
help(
[[
Caffe2 0.8.1 container running Ubuntu 16.04.
Defines the following commands:
 - "python" - which includes Caffe2 and all its depenencies

]])

load("singularity")
local CPATH="/uufs/chpc.utah.edu/sys/installdir/caffe2/0.8.1-singularity"

-- singularity environment variables to bind the paths and set shell
setenv("SINGULARITY_BINDPATH","/scratch,/uufs/chpc.utah.edu")
setenv("SINGULARITY_SHELL","/bin/bash")
-- shell function to provide "alias" to the seqlink commands, as plain aliases don't get exported to bash non-interactive shells by default
set_shell_function("python",'singularity run --nv ' .. CPATH .. '/ubuntu_caffe2_gpu.simg "$@"',"singularity run --nv " .. CPATH .. "/ubuntu_caffe2_gpu.simg $*")
-- to export the shell function to a subshell
if (myShellName() == "bash") then
 execute{cmd="export -f python",modeA={"load"}}
end

whatis("Name        : Caffe")
whatis("Version     : 1.0.0")
whatis("Category    : Deep learning framework")
whatis("URL         : http://http://caffe.berkeleyvision.org")
