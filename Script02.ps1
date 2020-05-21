#Script02

#Récupére la liste des membres d'un groupe AD


#Demande le nom du groupe pour lequel on veux la liste

Try{
$nameofgroup = Read-Host "Merci de Rentrer le Nom du groupe AD"
Get-ADGroupMember -Identity $nameofgroup | Select-Object -Property Name | Out-Null
}
#Si la demande est fausse, il y a un message d'erreur
Catch{
Write-Host "Le groupe n'existe pas"

exit 1
}

#Résultat dans un fichier créer automatiquement

Get-ADGroupMember -Identity $nameofgroup | Select-Object -Property Name | Out-File -FilePath e:\Resultats_$nameofgroup.txt
Get-Content -Path e:\Resultats_$nameofgroup.txt


#Texte de réponse à la demande

Write-Host "Le fichier Resultats_$nameofgroup.txt à bien été créer"

