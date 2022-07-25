#Création du répertoire de travail ADLA

mkdir C:\Formation
Mkdir C:\Archive

# Création du raccourci du répertoire de travail

Function New-Shortcut{

param(
   [parameter(Mandatory=$true)][string]$ShortcutFullName,
   [parameter(Mandatory=$true)][string]$ShortcutTarget
)

$ShortcutObject = New-Object -comObject WScript.Shell
$Shortcut = $ShortcutObject.CreateShortcut($ShortcutFullName)
$Shortcut.TargetPath = $ShortcutTarget
$Shortcut.Save()

} # Function New-Shortcut

New-Shortcut -ShortcutFullName "C:\Users\AdminLocal\Desktop\Formation.lnk" -ShortcutTarget "C:\Formation"
New-Shortcut -ShortcutFullName "C:\Users\AdminLocal\Desktop\Archive.lnk" -ShortcutTarget "C:\Archive"

# Copie des fichiers de travail des ADLA
xcopy "\\serveur.cg44.fr\Donnees\Vol2\Doc\ddct\Archives\Public" "C:\Users\Comtpelocal\Desktop\Archive" /E

#Créer une tache planifié

$action = New-ScheduledTaskAction -Execute 'C:\Temp\Create-file.bat'
$trigger = New-ScheduledTaskTrigger -AtLogOn 
Register-ScheduledTask -Action $action -Trigger $trigger -TaskPath "Mes_taches" -TaskName "Create_file" -Description "Création du répertoire Formation après nettoyage"

