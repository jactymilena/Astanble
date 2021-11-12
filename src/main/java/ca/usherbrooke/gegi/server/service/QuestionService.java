package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Question;
import ca.usherbrooke.gegi.server.persistence.QuestionMapper;
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
public class QuestionService {
    @Context
    SecurityContext securityContext;

    @Inject
    JsonWebToken jwt;

    @Inject
    QuestionMapper questionMapper;

    @GET
    @Path("questionByID/{id_question}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Question> selectByID(@Param("id_question") int id_question){
        return questionMapper.selectByID(id_question);
    }

    @GET
    @Path("questionType/{type}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Question> selectByType(@Param("type") int type){
        List<Question> question = questionMapper.selectByType(type);

        return question;
    }

    @GET
    @Path("TypeQuestion/{question}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public int selectByTypeQuestion(@Param("question") int question){
        Question type = questionMapper.selectByTypeQuestion(question);
        int id_type = type.getId_type();
        return id_type;
    }

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
