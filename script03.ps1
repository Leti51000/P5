#Script03

#Récupére la liste des groupes dont un utilisateur est membre

#Demande le nom de l'utilisateur pour lequel on veux la liste des groupes

Try{
$nom = Read-Host "Merci de Rentrer le login de l'utilisateur"
Get-ADPrincipalGroupMembership -Identity $nom | Select-Object -Property Name | Out-Null
}
#Si la demande est fausse, il y a un message d'erreur
Catch{

Write-Host "L'utilisateur n'existe pas"
Out-Null
exit 1
}

#Résultat dans un fichier créer automatiquement

Get-ADPrincipalGroupMembership -Identity $nom | Select-Object -Property Name | Out-File -FilePath e:\Resultats_$nom.txt
Get-Content -Path e:\Resultats_$nom.txt

#Texte de réponse à la demande

Write-Host "Le fichier Resultats_$nom.txt à bien été créer"










