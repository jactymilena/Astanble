# Post Usager
Utilisé pour créer un usager.

**URL**: `api/usager`

**METHOD**: `POST`

**Authentification required**: `Yes`

**General constraint**

On liste toutes les informations de l'usager.

**Data constraint**
```json
{
  "cip" : "{identifiant de l'usager} : string",
  "nom_usager" : "{nom de l'usager} : string",
  "prenom_usager" : "{prenom de l'usager} : string",
  "courriel1" : "{adresse courriel de l'usager} : string",
  "courriel2" : "{adresse courriel de l'usager} : string",
  "id_statut" : "{identifiant du statut de l'usager} : number",
  "thematiques" : [
    {
      "id_thematique" : "{identifiant de la thematique} : number"
    }, ...
  ]
}
```

## Succes response
**Content structure**
```json
nothing
```

## Error response

