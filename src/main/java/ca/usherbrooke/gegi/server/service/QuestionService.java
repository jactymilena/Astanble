package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Question;
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
public class QuestionService {
    @Context
    SecurityContext securityContext;

    @Inject
    JsonWebToken jwt;

    @Inject
    QuestionMapper questionMapper;

    @Inject
    ReponseMapper reponseMapper;

    @GET
    @Path("question/{id_question}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public Question getQuestion(@PathParam("id_question") int id_question){
        Question question = questionMapper.selectByID(id_question);
        question.setReponses(reponseMapper.selectByQuestion(question.getId_question()));
        return question;
    }

    @GET
    @Path("questionByID/{id_question}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public Question selectByID(@Param("id_question") int id_question){
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

    @POST
    @Path("question/reponses/insert")
    @PermitAll
    public void insertQuestionReponses(Question question){
        questionMapper.insert(question);
        question.getReponses().forEach(reponse -> {
            reponse.setId_question(question.getId_question());
            reponseMapper.insert(reponse);
        });
    }

    @POST
    @Path("question/insert/all")
    @PermitAll
    public void insertQuestionsReponses(List<Question> questions){
        questions.forEach(question -> {
            questionMapper.insert(question);
            question.getReponses().forEach(reponse -> {
                reponse.setId_question(question.getId_question());
                reponseMapper.insert(reponse);
            });
        });
    }

    @PUT
    @Path("question/update")
    @PermitAll
    public void update(Question question){
        questionMapper.update(question);
    }

    @PUT
    @Path("question/reponses/update")
    @PermitAll
    public void updateQuestionReponses(Question question){
        Question dbQuestion = getQuestion(question.getId_question());
        questionMapper.update(question);

        // suppressions des reponses qui n'existe plus
        dbQuestion.getReponses().forEach(reponse -> {
            boolean reponse_exists = question.getReponses().stream().anyMatch(r -> r.getId_reponse() == reponse.getId_reponse());
            if(!reponse_exists) {
                reponseMapper.delete(reponse.getId_reponse());
            }
        });

        // update or insert responses which exists
        question.getReponses().forEach(reponse -> {
            boolean reponse_exists = dbQuestion.getReponses().stream().anyMatch(r -> r.getId_reponse() == reponse.getId_reponse());
            if(!reponse_exists) {
                // insert new question
                reponse.setId_question(question.getId_question());
                reponseMapper.insert(reponse);
            } else {
                // update question
                reponse.setId_question(question.getId_question());
                reponseMapper.update(reponse);
            }
        });
    }



    @DELETE
    @Path("question/delete/{id_question}")
    @PermitAll
    public void delete(@PathParam("id_question") int id_question){
        questionMapper.delete(id_question);
    }
}
