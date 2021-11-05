package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Question;
import ca.usherbrooke.gegi.server.persistence.QuestionMapper;
import ca.usherbrooke.gegi.server.persistence.ReponseMapper;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.PermitAll;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.SecurityContext;
import java.util.List;

@Path("/api")
public class QuestionService {
    @Context
    SecurityContext securityContext;

    @Inject
    JsonWebToken jwt;

    @Inject
    QuestionMapper questionMapper;

    @Inject
    ReponseMapper reponseMapper;

    @POST
    @Path("questionInsert")
    @PermitAll
    public void insert(Question question){
        questionMapper.insert(question);
    }

    @POST
    @Path("question/insert/all")
    @PermitAll
    public void insert(List<Question> questions){
        questions.forEach(question -> {
            questionMapper.insert(question);
            question.getReponses().forEach(reponse -> {
                reponseMapper.insert(reponse);
            });
        });
    }

    @PUT
    @Path("question/update")
    @PermitAll
    public void update(Question question){
//        Question dbQuestion =  questionMapper.selectByID(question.getId_question()).get(0);

//        if(question.getNum_question() == 0)
//            question.setId_question(dbQuestion.getId_question());

        questionMapper.update(question);
    }

    @DELETE
    @Path("question/delete/{id_question}")
    @PermitAll
    public void delete(@PathParam("id_question") int id_question){
        questionMapper.delete(id_question);
    }
}
