#Récupére la liste des groupes dont un utilisateur est membre

$nom = Read-Host "Merci de Rentrer le login de l'utilisateur"

Start-Transcript -Path c:\Scripts\Resultats_$nom.txt

Write-Host "Voici la liste des groupes dont l'utilisateur $nom fait parti"

Get-ADPrincipalGroupMembership -Identity $nom 

Stop-Transcript
