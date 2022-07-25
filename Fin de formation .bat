@Echo off
Echo ===================================================
Echo Merci d'avoir utiliser la machine de formation
Echo ===================================================

Echo "Suppresion des donnees en cours"

Del /f /q C:\Users\Administrateur\Documents\*  

Echo "Extinction de la machine"

shutdown -s -t 5

