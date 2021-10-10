# Get Thematique
Utilisé pour envoyer une thématique.

**URL**: `...`

**METHOD**: `GET`

**Authentification required**: `Yes`

**General constraint**
On liste toutes les informations de la thématique.

**Data constraint**
```json
nothing
```

## Succes response 
**Content structure**
```json
{
  "context" : "api/thematique",
    "article" : {
      "id_thematique" : "{identifiant de la thématique} : number",
      "nom_thematique" : "{nom de la thématique} : string",
      ...
    }
}
```

## Error response

