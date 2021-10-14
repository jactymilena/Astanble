package ca.usherbrooke.gegi.server.business;

import java.util.List;

public class ArticleAuthor extends Article {
    private List<Usager> authors;

    public List<Usager> getAuthors() {
        return authors;
    }

    public void setAuthors(List<Usager> authors) {
        this.authors = authors;
    }
}
