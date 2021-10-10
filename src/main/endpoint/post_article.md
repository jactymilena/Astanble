# Post Article
Utilisé pour créer un article.

**URL**: `api/article`

**METHOD**: `POST`

**Authentification required**: `Yes`

**General constraint**


**Data constraint**
```json
{
    "id_article" : "{identifiant de l'article} : number",
    "nom_article" : "{nom de l'article} : string",
    "description_article" : "{description de l'article} : string",
    "content" : "{contenu de l'article} : string",
    "references" : [
        {
            "id_reference" : "{identifiant de la reference} : number",
        }, ...
    ],
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

