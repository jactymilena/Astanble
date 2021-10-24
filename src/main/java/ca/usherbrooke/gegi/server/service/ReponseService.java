package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Reponse;
import ca.usherbrooke.gegi.server.persistence.ReponseMapper;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.PermitAll;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.SecurityContext;

@Path("/api")
public class ReponseService {
    @Context
    SecurityContext securityContext;

    @Inject
    JsonWebToken jwt;

    @Inject
    ReponseMapper reponseMapper;

    @POST
    @Path("reponse")
    @PermitAll
    public void insert(Reponse reponse){
        reponseMapper.insert(reponse);
    }

    @PUT
    @Path("reponse/update")
    @PermitAll
    public void update(Reponse reponse){
//        Question dbQuestion =  questionMapper.selectByID(question.getId_question()).get(0);

//        if(question.getNum_question() == 0)
//            question.setId_question(dbQuestion.getId_question());

        reponseMapper.update(reponse);
    }

    @DELETE
    @Path("reponse/delete/{id_reponse}")
    @PermitAll
    public void delete(@PathParam("id_reponse") int id_reponse){
        reponseMapper.delete(id_reponse);
    }
}
