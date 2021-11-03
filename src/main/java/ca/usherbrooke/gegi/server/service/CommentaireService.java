package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.ArticleAuthor;
import ca.usherbrooke.gegi.server.business.Commentaire;
import ca.usherbrooke.gegi.server.business.Question;
import ca.usherbrooke.gegi.server.persistence.CommentaireMapper;
import ca.usherbrooke.gegi.server.persistence.QuestionMapper;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.PermitAll;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.SecurityContext;
import java.util.List;

@Path("/api")
public class CommentaireService {
    @Context
    SecurityContext securityContext;

    @Inject
    JsonWebToken jwt;

    @Inject
    CommentaireMapper commentaireMapper;

    @GET
    @Path("commentaire/{id_article}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Commentaire> getCommentaires(@PathParam("id_article") int id_article) {
        List<Commentaire> commentaires = commentaireMapper.selectByArticle(id_article);

        return commentaires;
    }

    @POST
    @Path("commentaireInsert")
    @PermitAll
    public void insert(Commentaire commentaire){
        commentaireMapper.insertCommentaire(commentaire);
    }

}
