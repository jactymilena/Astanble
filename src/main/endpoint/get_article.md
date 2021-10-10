# Get Article
Utilisé pour envoyer un article.

**URL**: `...`

**METHOD**: `GET`

**Authentification required**: `Yes`

**General constraint**
On liste toutes les informations de l'article.

**Data constraint**
```json
nothing
```

## Succes response 
**Content structure**
```json
{
  "context" : "api/article",
    "article" : {
      "id_article" : "{identifiant de l'article} : number",
      "nom_article" : "{nom de l'article} : string",
      ...
    }
}
```

## Error response

