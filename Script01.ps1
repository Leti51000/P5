#Script01

#Création d'un nouvel utilisateur et de son dossier partagé à son nom


#Mise en place d'une obligation d'avoir un Nom de minimum 4 caractères
Do{
$nom = Read-Host "Merci de rentrer le prénom de l'Utilisateur à Créer`nLa longueur du prénom doit être au minimum de 4 caractères"
}
While(-Not($nom.length -match '([4-9]|[1][0-9])'))


#Mise en place d'une obligation d'avoir un Prénom de minimum 4 caractères
Do{
$prenom = Read-Host "Merci de rentrer le nom de l'Utilisateur à Créer`nLa longueur du nom doit être au minimum de 4 caractères"
}
While(-Not($prenom.length -match '([4-9]|[1][0-9])'))


#Création du login
$login = Read-Host "Merci de Rentrer le login de l'Utilisateur à Créer"


#Mise en place d'une obligation de mot de passe complexe d'au minimum 7 caractères
$mdp = Read-Host "{{ MDP complexe }}`n`nLe mot de passe doit contenir:  
`n`nAu moins une lettre majuscule [A-Z]`nAu moins une lettre minuscule [a-z]`nAu moins un chiffre [0-9]`n
La longueur du mot de passe doit être de 7 à 25 caractères.`n`n`nEntrer votre mot de passe"


#Si le mdp ne respecte pas l'obligation, il y a un message d'erreur  
if (-Not(($mdp -cmatch '[a-z]') -and ($mdp -cmatch '[A-Z]') -and ($mdp -match '\d') -and ($mdp.length -match '^([7-9]|[1][0-9]|[2][0-5])$'))) 
{ 
    Write-Host "`Mot de passe invalide"   
    exit 1
} 


#Création de l'utilisateur, du mail et du mot de passe si toutes les valeurs sont bonnes
Try{
New-ADUser -Name $prenom -Surname $nom -SamAccountName $login -UserPrincipalName $login@acme.fr -AccountPassword (ConvertTo-SecureString -AsPlainText $mdp -Force) -PasswordNeverExpires $true -CannotChangePassword $true -Enabled $true
}

Catch{
Write-Host "La création de l'utilisateur n'a pas été effectué"
exit 1
}



#Création du dossier de l'utilisateur dans PARTAGE DES DOSSIERS
New-Item -Path "C:\PARTAGE DES DOSSIERS\$login" -ItemType Directory


#Création du partage de ce dossier en Fullaccess
New-SmbShare -Name $login -Path "C:\PARTAGE DES DOSSIERS\$login" -FullAccess Administrateur


#Si tout c'est bien passé, il y a un message de confirmation
Write-Host "La création de l'utilisateur et de son dossier partagé a bien été effectué"