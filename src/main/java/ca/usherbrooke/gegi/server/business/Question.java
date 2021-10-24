package ca.usherbrooke.gegi.server.business;

import java.util.List;

public class Question {
    private int id_question;
    private int num_question;
    private String question_content;
    private int id_quiz;
    private String cip;
    private int id_type;
    private List<Reponse> reponses;
    private List<ReponseUsager> reponses_usagers;

    public int getId_question() {
        return id_question;
    }

    public void setId_question(int id_question) {
        this.id_question = id_question;
    }

    public int getNum_question() {
        return num_question;
    }

    public void setNum_question(int num_question) {
        this.num_question = num_question;
    }

    public String getQuestion_content() {
        return question_content;
    }

    public void setQuestion_content(String question_content) {
        this.question_content = question_content;
    }

    public int getId_quiz() {
        return id_quiz;
    }

    public void setId_quiz(int id_quiz) {
        this.id_quiz = id_quiz;
    }

    public String getCip() {
        return cip;
    }

    public void setCip(String cip) {
        this.cip = cip;
    }

    public int getId_type() {
        return id_type;
    }

    public void setId_type(int id_type) {
        this.id_type = id_type;
    }

    public List<Reponse> getReponses() {
        return reponses;
    }

    public void setReponses(List<Reponse> reponses) {
        this.reponses = reponses;
    }

    public List<ReponseUsager> getReponses_usagers() {
        return reponses_usagers;
    }

    public void setReponses_usagers(List<ReponseUsager> reponses_usagers) {
        this.reponses_usagers = reponses_usagers;
    }
}
