# Get Usager
Utilisé pour envoyer un usager.

**URL**: `api/usager`

**METHOD**: `GET`

**Authentification required**: `Yes`

**General constraint**


**Data constraint**
```json
{
  "cip" : "{identifiant de l'usager} : string"
}
```

## Succes response
**Content structure**
```json
{
  "context" : "api/usager",
    "usager" : {
      "cip" : "{identifiant de l'usager} : string",
      "nom_usager" : "{nom de l'usager} : string",
      "prenom_usager" : "{prenom de l'usager} : string",
      "courriel1" : "{adresse courriel de l'usager} : string",
      "courriel2" : "{adresse courriel de l'usager} : string",
      "id_statut" : "{identifiant du statut de l'usager} : number",
      "nom_statut" : "{nom du statut de l'usager} : string",
      "thematiques" : [
        {
          "id_thematique" : "{identifiant de la thematique} : number",
          "nom_thematique" : "{nom de la thematique} : string"
        }, ...
      ]
    }
}
```

## Error response

