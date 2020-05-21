#Script04

#Sauvegarde automatisée des fichiers client sur C:\SAV
#Exclus les dossiers Images, Musiques et vidéos

Try{
$excludes = "Mes images","Mes vidéos","Ma musique"
Get-ChildItem $Env:USERPROFILE\Documents -Directory | 
    Where-Object{$_.Name -notin $excludes} | 
    Copy-Item -Destination \\SERVADACME\SAV\$env:USERNAME -Recurse -Force
}
#Si erreur dans la sauvegarde, affichage d'un message
Catch{
Write-Host "Erreur de sauvegarde"

exit 1
}

Write-Host "Sauvegarde effectuée avec succés"


#Si sauvegarde faite, l'ordinateur s'eteindra

#Stop-computer -ComputerName localhost

exit 0

