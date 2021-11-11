package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.ArticleAuthor;
import ca.usherbrooke.gegi.server.business.Commentaire;
import ca.usherbrooke.gegi.server.business.Question;
import ca.usherbrooke.gegi.server.business.ReponseCommentaire;
import ca.usherbrooke.gegi.server.persistence.CommentaireMapper;
import ca.usherbrooke.gegi.server.persistence.QuestionMapper;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.PermitAll;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.SecurityContext;
import java.text.SimpleDateFormat;
import java.util.Date;
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

        for(Commentaire com : commentaires) {
            com.setAuteur(commentaireMapper.selectAuthorOfCommentaire(com.getCip()));
            List<ReponseCommentaire> reponses = commentaireMapper.selectReponseByCommentaire(com.getId_commentaire());
            for(ReponseCommentaire res : reponses) {
                res.setAuteur(commentaireMapper.selectAuthorOfCommentaire(res.getCip()));
            }
            com.setReponses(reponses);
        }

        return commentaires;
    }

    @POST
    @Path("commentaireInsert")
    @PermitAll
    public void insert(Commentaire commentaire){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        commentaire.setDate_commentaire(formatter.format(date));
        commentaireMapper.insertCommentaire(commentaire);
    }

    @POST
    @Path("commentaireReponseInsert")
    @PermitAll
    public void insertReponse(ReponseCommentaire commentaire){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        commentaire.setDate_commentaire(formatter.format(date));
        commentaireMapper.insertReponseCommentaire(commentaire);
    }

    @DELETE
    @Path("delete/commentaire/{id_commentaire}")
    @PermitAll
    public void deleteCommentaire(@PathParam("id_commentaire") int id_commentaire) {
        commentaireMapper.delete(id_commentaire);
    }
}
