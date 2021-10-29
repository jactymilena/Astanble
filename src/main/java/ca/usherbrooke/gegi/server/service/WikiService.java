package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Article;
import ca.usherbrooke.gegi.server.business.ArticleAuthor;
import ca.usherbrooke.gegi.server.business.Usager;
import ca.usherbrooke.gegi.server.persistence.WikiMapper;
import org.eclipse.microprofile.jwt.JsonWebToken;
import io.quarkus.security.identity.SecurityIdentity;

import javax.annotation.security.PermitAll;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import java.util.List;


@Path("/api")
public class WikiService {

    @Context
    SecurityContext securityContext;

    @Inject
    SecurityIdentity identity;

    @Inject
    JsonWebToken jwt;

    @Inject
    WikiMapper wikiMapper;


    public List<ArticleAuthor> setListAuthors(List<ArticleAuthor> wikis) {
        for (ArticleAuthor a : wikis) {
            String id_article = a.getId_article();
            a.setAuthors(wikiMapper.selectAuthorOfArticle(id_article));
        }

        return wikis;
    }

    @GET
    @Path("wiki")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<ArticleAuthor> getWiki() {
        List<ArticleAuthor> wikis = wikiMapper.select();
        setListAuthors(wikis);

        return wikis;
    }

    @GET
    @Path("wikiByName/{article}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Article> getWikiByName(@PathParam("article") String article) {
        return wikiMapper.selectByName(article);
    }

    @GET
    @Path("wikiByAuthor/{auteur}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Article> getwikiByAuthor(@PathParam("auteur") String auteur) {
        return wikiMapper.selectByAuthor(auteur);
    }

    @GET
    @Path("wikiByThematique/{id_thematique}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<ArticleAuthor> getwikiByThematique(@PathParam("id_thematique") Integer id_thematique) {
        List<ArticleAuthor> wikis = wikiMapper.selectByThematique(id_thematique);
        setListAuthors(wikis);

        return wikis;
    }

    @GET
    @Path("wikiByIdArticle/{id_article}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public ArticleAuthor getwikiByIdArticle(@PathParam("id_article") String id_article) {
        return wikiMapper.selectById(id_article);
    }

    @GET
    @Path("wiki/searchByName/{nom_article}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<ArticleAuthor> getArticleSearchByName(@PathParam("nom_article") String nom_article) {
        List<ArticleAuthor> wikis = wikiMapper.selectSearchByName(nom_article);
        setListAuthors(wikis);

        return wikis;
    }

    @GET
    @Path("wiki/searchByAuthor/{prenom_usager}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<ArticleAuthor> getArticleSearchByAuthor(@PathParam("prenom_usager") String prenom_usager) {
        List<ArticleAuthor> wikis = wikiMapper.selectSearchByAuthor(prenom_usager);
        setListAuthors(wikis);

        return wikis;
    }

    @GET
    @Path("wiki/searchByDescription/{description_article}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<ArticleAuthor> getArticleSearchByDescription(@PathParam("description_article") String description_article) {
        List<ArticleAuthor> wikis = wikiMapper.selectSearchByDescription(description_article);
        setListAuthors(wikis);
        return wikis;
    }

    @POST
    @Path("wikiInsert")
    @PermitAll
    public void insertArticle(Article article){
        System.out.println("New article: " + article.getNom_article());
        String user_cip = securityContext.getUserPrincipal().getName();

        // TODO: Pas encore testé je ne sais pas si renvoit bien le ID
        int id_article = wikiMapper.insert(article);
//        if(id_article != null)
//            wikiMapper.insertArticleCollab(user_cip, id_article, 1);
    }

    @PUT
    @Path("wiki/update")
    @PermitAll
    public void updateArticle(Article article){
        String user_cip = securityContext.getUserPrincipal().getName();
        String id_article = article.getId_article();
        int id_article_int = Integer.parseInt(id_article);

        ArticleAuthor dbArticle =  wikiMapper.selectById(article.getId_article());
        dbArticle.setAuthors(wikiMapper.selectAllCollabOfArticle(id_article));

        List<Usager> authors = dbArticle.getAuthors();
        Usager user = authors.stream().filter(usager -> usager.getCip() == user_cip).findFirst().orElse(null);
        if(user == null) {
            wikiMapper.insertArticleCollab(user_cip, id_article_int, 3);
        }

        if(article.getNom_article() == null)
            article.setNom_article(dbArticle.getNom_article());
        if(article.getDescription_article() == null)
            article.setDescription_article(dbArticle.getDescription_article());
        if(article.getDescription_robot_article() == null)
            article.setDescription_robot_article(dbArticle.getDescription_robot_article());

        wikiMapper.update(article);
    }

    @DELETE
    @Path("wiki/delete/{id_article}")
    @PermitAll
    public void deleteArticle(@PathParam("id_article") int id_article){
        wikiMapper.delete(id_article);
    }
}
