# Get Article
Utilisé pour envoyer un article.

**URL**: `api/article`

**METHOD**: `GET`

**Authentification required**: `Yes`

**General constraint**

On liste toutes les informations de l'article.

**Data constraint**
```json
{
  "id_article" : "{identifiant de l'article} : number"
}
```

## Succes response 
**Content structure**
```json
{
  "context" : "api/article",
    "article" : {
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
      ],
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

