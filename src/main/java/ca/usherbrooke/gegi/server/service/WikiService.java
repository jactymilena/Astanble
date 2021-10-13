package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Article;
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

    @GET
    @Path("wiki")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Wiki> getWiki() {
        List<Wiki> wikis = wikiMapper.select();
        return wikis;
    }

    @GET
    @Path("wikiByName/{article}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Wiki> getWikiByName(@PathParam("article") String article) {
        List<Wiki> wikis = wikiMapper.selectByName(article);
        return wikis;
    }

//    @GET
//    @Path("wikiByAuthor/{auteur}")
//    @PermitAll
//    @Produces(MediaType.APPLICATION_JSON)
//    public List<Wiki> getwikiByAuthor(@PathParam("auteur") String auteur) {
//        List<Wiki> wikis = wikiMapper.selectByAuthor(auteur);
//        return wikis;
//    }

    @GET
    @Path("wikiByThematique/{id_thematique}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Wiki> getwikiByThematique(@PathParam("id_thematique") Integer id_thematique) {
        List<Wiki> wikis = wikiMapper.selectByThematique(id_thematique);
        return wikis;
    }

    @GET
    @Path("wikiByIdArticle/{id_article}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Wiki> getwikiByIdArticle(@PathParam("id_article") Integer id_article) {
        List<Wiki> wikis = wikiMapper.selectById(id_article);
        return wikis;
    }

    @POST
    @Path("wikiInsert")
    @PermitAll
    public void insertArticle(Article article){
        System.out.println(article.getNom_article());
        wikiMapper.insert(article);
    }

    @PUT
    @Path("wiki/update")
    @PermitAll
    public void updateArticle(Article article){
        wikiMapper.update(article);
    }

    @DELETE
    @Path("wiki/delete/{id_article}")
    @PermitAll
    public void deleteArticle(@PathParam("id_article") int id_article){
        wikiMapper.delete(id_article);
    }
}
