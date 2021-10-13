# Get Articles selon thematique
Utilisé pour envoyer les articles selon une thematique.

**URL**: `api/thematique`

**METHOD**: `GET`

**Authentification required**: `Yes`

**General constraint**

On liste toutes les articles associés à une thématique.

**Data constraint**
```json
{
  "id_thematique" : "{identifiant de la thematique} : number"
}
```

## Succes response 
**Content structure**
```json
{
  "context" : "api/thematique",
    "articles" : 
      [
        {
          "id_article" : "{identifiant de l'article} : number",
          "nom_article" : "{nom de l'article} : string",
          "description_article" : "{description de l'article} : string",
          "content" : "{contenu de l'article} : string",
          "references" : [
            {
              "id_reference" : "{identifiant de la reference} : number",
              "nom_reference" : "{nom de la reference} : string",
              "lien" : "{lien de la reference} : string"
            }, ...
          ]
        }, ...
      ]
    
}
```

## Error response

