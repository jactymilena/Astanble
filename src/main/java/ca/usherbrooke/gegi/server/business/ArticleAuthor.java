package ca.usherbrooke.gegi.server.business;

import java.util.List;

public class ArticleAuthor extends Article {
    private List<Usager> authors;
    private List<Thematique> thematiques;

    public List<Usager> getAuthors() {
        return authors;
    }

    public void setAuthors(List<Usager> authors) {
        this.authors = authors;
    }

    public List<Thematique> getThematiques() {
        return thematiques;
    }

    public void setThematiques(List<Thematique> thematiques) {
        this.thematiques = thematiques;
    }
}
