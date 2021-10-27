package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Article;
import ca.usherbrooke.gegi.server.business.ArticleAuthor;
import ca.usherbrooke.gegi.server.business.Wiki;
import ca.usherbrooke.gegi.server.persistence.WikiMapper;
import org.apache.ibatis.annotations.Param;
import org.eclipse.microprofile.jwt.JsonWebToken;

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
    public List<Article> getwikiByIdArticle(@PathParam("id_article") String id_article) {
        return wikiMapper.selectById(id_article);
    }

    @GET
    @Path("wiki/searchByName/{nom_article}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<ArticleAuthor> getArticleSearch(@PathParam("nom_article") String nom_article) {
        List<ArticleAuthor> wikis = wikiMapper.selectSearchArticle(nom_article);
        setListAuthors(wikis);

        return wikis;
    }

    @POST
    @Path("wikiInsert")
    @PermitAll
    public void insertArticle(Article article){
        wikiMapper.insert(article);
    }

    @PUT
    @Path("wiki/update")
    @PermitAll
    public void updateArticle(Article article){
        Article dbArticle =  wikiMapper.selectById(article.getId_article()).get(0);

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
