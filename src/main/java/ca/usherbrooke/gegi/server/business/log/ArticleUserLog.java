package ca.usherbrooke.gegi.server.business.log;

import java.sql.Time;

public class ArticleUserLog extends Log {
    private int id_article;

    public ArticleUserLog(String CIP, int id_article, int id_type, int id_field) {
        super(CIP, id_type, id_field);
        this.id_article = id_article;
    }

    public int getId_article() {
        return id_article;
    }

    public void setId_article(int id_article) {
        this.id_article = id_article;
    }
}
