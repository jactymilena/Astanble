package ca.usherbrooke.gegi.server.business.log;

import ca.usherbrooke.gegi.server.business.log.Log;

import java.sql.Time;

public class QuizUserLog extends Log {
    private int id_quiz;
    private int id_question;

    public QuizUserLog(String CIP, int id_quiz, int id_question, int id_type, int id_field) {
        super(CIP, id_type, id_field);
        this.id_quiz = id_quiz;
        this.id_question = id_question;
    }

    public int getId_quiz() {
        return id_quiz;
    }

    public void setId_quiz(int id_quiz) {
        this.id_quiz = id_quiz;
    }

    public int getId_question() {
        return id_question;
    }

    public void setId_question(int id_question) {
        this.id_question = id_question;
    }
}
