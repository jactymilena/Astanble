package ca.usherbrooke.gegi.server.business;

import java.util.List;

public class Quiz {
    private int id_quiz;
    private String nom_quiz;
    private String description_quiz;
    private List<Question> questions;

    public int getId_quiz() {
        return id_quiz;
    }

    public void setId_quiz(int id_quiz) {
        this.id_quiz = id_quiz;
    }

    public String getNom_quiz() {
        return nom_quiz;
    }

    public void setNom_quiz(String nom_quiz) {
        this.nom_quiz = nom_quiz;
    }

    public String getDescription_quiz() {
        return description_quiz;
    }

    public void setDescription_quiz(String description_quiz) {
        this.description_quiz = description_quiz;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }
}
