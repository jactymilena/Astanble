package ca.usherbrooke.gegi.server.business;

import java.util.List;

public class ArticleQuestion extends Article {
    private List<Question> questions;

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }
}
