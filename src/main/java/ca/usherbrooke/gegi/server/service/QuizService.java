package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.*;
import ca.usherbrooke.gegi.server.persistence.QuestionMapper;
import ca.usherbrooke.gegi.server.persistence.QuizMapper;
import ca.usherbrooke.gegi.server.persistence.ReponseMapper;
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
    public List<Quiz> getQuizByID(@PathParam("id") int id) {
        List<Quiz> quiz = quizMapper.selectByID(id);

        return quiz;
    }

    @GET
    @Path("quizByAuthor/{auteur}")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Quiz> getQuizByAuthor(@PathParam("auteur") String auteur) {
        List<Quiz> quiz = quizMapper.selectByAuthor(auteur);

        return quiz;
    }

    @POST
    @Path("quizInsert")
    @PermitAll
    public void insert(Quiz quiz){
        quizMapper.insert(quiz);
    }

    @PUT
    @Path("quiz/update")
    @PermitAll
    public void update(Quiz quiz){
        Quiz dbQuiz =  quizMapper.selectByID(quiz.getId_quiz()).get(0);

        if(quiz.getNom_quiz() == null)
            quiz.setNom_quiz(dbQuiz.getNom_quiz());

        quizMapper.update(quiz);
    }

    @DELETE
    @Path("quiz/delete/{id_quiz}")
    @PermitAll
    public void delete(@PathParam("id_quiz") int id_quiz){
        quizMapper.delete(id_quiz);
    }

}
