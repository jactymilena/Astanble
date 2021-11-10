package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.*;
import ca.usherbrooke.gegi.server.persistence.QuestionMapper;
import ca.usherbrooke.gegi.server.persistence.QuizMapper;
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
public class QuizService {
    @Context
    SecurityContext securityContext;

    @Inject
    JsonWebToken jwt;

    @Inject
    QuizMapper quizMapper;

    @Inject
    QuestionMapper questionMapper;

    @Inject
    ReponseMapper reponseMapper;

    @Inject
    QuestionService questionService;

    public List<QuizAuthor> setListAuthors(List<QuizAuthor> quiz) {
        for (QuizAuthor q : quiz) {
            int id_quiz = q.getId_quiz();
            q.setAuthors(quizMapper.selectAuthorByQuiz(id_quiz));
        }

        return quiz;

    }

    @GET
    @Path("quiz")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Quiz> getQuiz() {
        List<Quiz> quiz = quizMapper.select();
        for (Quiz q : quiz) {
            int id_quiz = q.getId_quiz();
            List<Question> questions = questionMapper.selectByQuiz(id_quiz);
            for (Question question : questions) {
                question.setReponses(reponseMapper.selectByQuestion(question.getId_question()));
            }
            q.setQuestions(questions);
        }
        return quiz;
    }

    @GET
    @Path("quiz/{id_quiz}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public Quiz getQuiz(@PathParam("id_quiz") int id_quiz) {
        Quiz quiz = quizMapper.selectByID(id_quiz);
        List<Question> questions = questionMapper.selectByQuiz(quiz.getId_quiz());
        for (Question question : questions) {
            question.setReponses(reponseMapper.selectByQuestion(question.getId_question()));
        }
        quiz.setQuestions(questions);
        return quiz;
    }

    @GET
    @Path("quizByName/{name}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Quiz> getQuizByName(@PathParam("name") String name) {
        List<Quiz> quiz = quizMapper.selectByName(name);

        return quiz;
    }

    @GET
    @Path("quizByID/{id}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public Quiz getQuizByID(@PathParam("id") int id) {
        Quiz q = quizMapper.selectByID(id);

        List<Question> questions = questionMapper.selectByQuiz(id);
        for (Question question : questions) {
            question.setReponses(reponseMapper.selectByQuestion(question.getId_question()));
        }
        q.setQuestions(questions);

        return q;
    }

    @GET
    @Path("quizByAuthor/{auteur}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<QuizAuthor> getQuizByAuthor(@PathParam("auteur") String auteur) {
        List<QuizAuthor> quiz = quizMapper.selectByAuthor(auteur);
        setListAuthors(quiz);

        return quiz;
    }

    @POST
    @Path("quizInsert")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public int insert(Quiz quiz){
        String user_cip = securityContext.getUserPrincipal().getName();
        int row_affected = quizMapper.insert(quiz);
        int id_quiz = quiz.getId_quiz();
        if(row_affected != 0)
            quizMapper.insertCollabQuiz(user_cip, id_quiz, 1);
        return id_quiz;
    }

    @POST
    @Path("quiz/update")
    @PermitAll
    public void update(Quiz quiz){
        Quiz dbQuiz = getQuiz(quiz.getId_quiz());

        if(quiz.getNom_quiz() == null)
            quiz.setNom_quiz(dbQuiz.getNom_quiz());
        if(quiz.getDescription_quiz() == null)
            quiz.setDescription_quiz(dbQuiz.getDescription_quiz());

        quizMapper.update(quiz);

        // suppression des questions qui ne sont plus présent dans le quiz
        dbQuiz.getQuestions().forEach(question -> {
            boolean question_exists = quiz.getQuestions().stream().anyMatch(q -> q.getId_question() == question.getId_question());
            if(!question_exists) {
                questionMapper.delete(question.getId_question());
            }
        });

        // update des questions qui sont présent ou bien les ajoutes
        quiz.getQuestions().forEach(question -> {
            boolean question_exists = dbQuiz.getQuestions().stream().anyMatch(q -> q.getId_question() == question.getId_question());
            if(!question_exists) {
                questionMapper.insert(question);
                question.getReponses().forEach(reponse -> {
                    reponse.setId_question(question.getId_question());
                    reponseMapper.insert(reponse);
                });
            } else {
                questionService.updateQuestionReponses(question);
            }
        });
    }

    @DELETE
    @Path("quiz/delete/{id_quiz}")
    @PermitAll
    public void deleteQuiz(@PathParam("id_quiz") int id_quiz){
        quizMapper.delete(id_quiz);
    }

}
