package ca.usherbrooke.gegi.server.business;

import java.sql.Time;

public class ArticleUserLog extends Log {
    private int id_article;

    public ArticleUserLog(String CIP, Time action_timestamp, int id_type, int id_field) {
        super(CIP, action_timestamp, id_type, id_field);
    }

    public int getId_article() {
        return id_article;
    }

    public void setId_article(int id_article) {
        this.id_article = id_article;
    }
}
