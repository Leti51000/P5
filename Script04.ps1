#Sauvegarde automatisé des fichiers client sur C:SAV

#Copier le dossier document de mon user client et le coller dans le dossier du serveur dans C:/SAV à son nom

Try{
Copy-Item -Path $Env:USERPROFILE\Documents -Destination \\SERVADACME\SAV\$env:USERNAME -Recurse
}
Catch{
Write-Host "Erreur de sauvegarde"

exit 1
}
Write-Host "Sauvegarde effectuée avec succés"

#Si sauvegarde faite, l'ordinateur s'eteint

Stop-computer -ComputerName localhost

exit 0
