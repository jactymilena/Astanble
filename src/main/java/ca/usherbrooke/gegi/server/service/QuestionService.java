package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Question;
import ca.usherbrooke.gegi.server.persistence.QuestionMapper;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.PermitAll;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.SecurityContext;

@Path("/api")
public class QuestionService {
    @Context
    SecurityContext securityContext;

    @Inject
    JsonWebToken jwt;

    @Inject
    QuestionMapper questionMapper;

    @POST
    @Path("questionInsert")
    @PermitAll
    public void insert(Question question){
        questionMapper.insert(question);
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
