@ECHO OFF
:parse
IF "%~1"=="" GOTO end
IF "%~1"=="start" GOTO start
IF "%~1"=="go" GOTO go
IF "%~1"=="next" GOTO next
IF "%~1"=="stop" GOTO stop
IF "%~1"=="clear" GOTO clear
SHIFT
GOTO parse

:start
ECHO Starte Session..

IF "%~2"=="" (git checkout master) else (git checkout "%~2")
git pull
git checkout -b features/mob-session
git push -u origin features/mob-session
ECHO ..Session begonnen
GOTO end

:next
ECHO next
git add --all
git commit -m"wip"
git push
GOTO end

:go
ECHO Übernehme das Steuer
git fetch
git checkout "features/mob-session"
git pull
GOTO end

:stop
ECHO Beende Session..
IF "%~2"=="" GOTO branchfehlt
GOTO squashmaster

:clear
ECHO Räume Session auf
git checkout master
git branch -D features/mob-session
git pull
GOTO end

:squashmaster
git checkout master
git pull
git merge --squash features/mob-session
git commit -m"%~2"
git push
ECHO ..Session beendet
GOTO end

:branchfehlt
ECHO Fehler: Gebe eine commit Message in "" ein!
GOTO end

:end

