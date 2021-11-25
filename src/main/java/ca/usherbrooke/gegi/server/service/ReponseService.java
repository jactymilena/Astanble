package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Question;
import ca.usherbrooke.gegi.server.business.Reponse;
import ca.usherbrooke.gegi.server.business.ReponseUsager;
import ca.usherbrooke.gegi.server.persistence.QuestionMapper;
import ca.usherbrooke.gegi.server.persistence.ReponseMapper;
import org.apache.ibatis.annotations.Param;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.PermitAll;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.SecurityContext;
import java.util.List;

@Path("/api")
public class ReponseService {
    @Context
    SecurityContext securityContext;

    @Inject
    JsonWebToken jwt;

    @Inject
    ReponseMapper reponseMapper;

    @Inject
    QuestionService questionService;


    @GET
    @Path("reponse/{id_question}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Reponse> getByQuestion(@Param("id_question") int  id_question){
        return reponseMapper.selectByQuestion(id_question);
    }

    @POST
    @Path("reponse")
    @PermitAll
    public void insert(Reponse reponse){
        reponseMapper.insert(reponse);
    }

    @POST
    @Path("reponse/insert")
    @PermitAll
    public void insertUser(List<ReponseUsager> reponseUser){
        String timestamp = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new java.util.Date()).toString();
        reponseUser.forEach(reponseUsager -> {
            reponseUsager.setDate_time_response(timestamp);
            Question question = questionService.getQuestion(reponseUsager.getId_question());

            if(question.getId_type() == 1) {
                // Carte
                Reponse bonneReponse = question.getReponses().get(0);

                reponseUsager.setBonne_reponse(bonneReponse.getReponse_content().equals(reponseUsager.getReponse_usager()));
            }

            reponseMapper.insertUser(reponseUsager);
        });
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
