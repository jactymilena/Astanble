package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Question;
import ca.usherbrooke.gegi.server.business.Reponse;
import ca.usherbrooke.gegi.server.business.ReponseUsager;
import ca.usherbrooke.gegi.server.business.ResultatQuiz;
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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    public ResultatQuiz insertUser(List<ReponseUsager> reponseUser){
        ResultatQuiz resultatQuiz = new ResultatQuiz();
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timestamp = formatter.format(date);
        reponseUser.forEach(reponseUsager -> {
            resultatQuiz.nombre_question++;
            reponseUsager.setDate_time_response(timestamp);
            Question question = questionService.getQuestion(reponseUsager.getId_question());

            boolean bonne_reponse;
            if(question.getId_type() == 1) {
                // Carte
                Reponse bonneReponse = question.getReponses().get(0);
                bonne_reponse = bonneReponse.getReponse_content().equals(reponseUsager.getReponse_usager());
                reponseUsager.setBonne_reponse(bonne_reponse);
            } else {
                Reponse bonneReponse = question.getReponses().stream().filter(r -> r.isBonne_mauvaise()).findFirst().get();
                bonne_reponse = reponseUsager.getReponse_usager().equals(bonneReponse.getReponse_content());
                reponseUsager.setBonne_reponse(bonne_reponse);
            }
            if(bonne_reponse)
                resultatQuiz.nombre_bonne_reponse++;

            reponseMapper.insertUser(reponseUsager);
        });

        return resultatQuiz;
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
