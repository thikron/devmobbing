@ECHO OFF
:parse
IF "%~1"=="" GOTO end
IF "%~1"=="start" GOTO start
IF "%~1"=="go" GOTO go
IF "%~1"=="next" GOTO next
IF "%~1"=="clear" GOTO clear
SHIFT
GOTO parse

:start
ECHO Starte Session..
IF "%~2"=="" (git checkout develop) else (git checkout "%~2")
ECHO Räume Session auf
git checkout develop
git branch -D feature/mob-session
git pull
git checkout -b feature/mob-session
git push -u origin feature/mob-session
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
git checkout feature/mob-session
git pull
GOTO end

:clear
ECHO Räume Session auf
git checkout develop
git branch -D feature/mob-session
git pull
GOTO end

:branchfehlt
ECHO Fehler: Gebe eine commit Message in "" ein!
GOTO end

:end

