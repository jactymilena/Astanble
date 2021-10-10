package server.business;

public class Wiki {

    private String id_article;
    private String nom_article;
    private String description_robot_article;
    private String description_article;
    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getId_article() {
        return id_article;
    }

    public void setId_article(String id_article) {
        this.id_article = id_article;
    }

    public String getNom_article() {
        return nom_article;
    }

    public void setNom_article(String nom_article) {
        this.nom_article = nom_article;
    }

    public String getDescription_robot_article() {
        return description_robot_article;
    }

    public void setDescription_robot_article(String description_robot_article) {
        this.description_robot_article = description_robot_article;
    }

    public String getDescription_article() {
        return description_article;
    }

    public void setDescription_article(String description_article) {
        this.description_article = description_article;
    }

    @Override
    public String toString() {
        return getNom_article() + " " + getId_article() + " " + getDescription_article() + " " + getDescription_robot_article();
    }
}
