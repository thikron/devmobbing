# devmobbing
This tool is an approach to simplify the remote mob programming process. At the moment it is just a windows batch file which should be added to the environment path variable.

Following commands are available:

## start
Creates a new features/mob-session branch from the master branch

## go
Take the driver seat. Checkout the features/mob-session branch and pulls the fresh state

## next
Add all files and commit as wip to the features/mob-session branch

## stop
End the session and squash commit to the master branch. It takes a string parameter which represents the commit message for this session

## clear
Delete the local fetures/mob-session branch and switch to master and pull for an up to date branch
