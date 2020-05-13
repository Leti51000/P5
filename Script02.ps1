#Script02
#Récupére la liste des membres d'un groupe AD

$nameofgroup = Read-Host "Merci de Rentrer le Nom du groupe AD"

#Demande le nom du groupe pour lequel on veux la liste, résultat dans un fichier créer automatiquement

Get-ADGroupMember -Identity $nameofgroup | Select-Object -Property name | out-file "c:\Scripts\Resultats_$nameofgroup.txt"

#Texte de réponse à la demande

Write-Host "Le fichier Resultats_$nameofgroup.txt à bien été créer"