package ca.usherbrooke.gegi.server.business;

import java.util.List;

public class Commentaire {
    private int id_commentaire;
    private String commentaire_content;
    private int id_article;
    private String cip;
    private String date_commentaire;
    private Usager auteur;
    private List<ReponseCommentaire> reponses;

    public String getDate_commentaire() {
        return date_commentaire;
    }

    public void setDate_commentaire(String date_commentaire) {
        this.date_commentaire = date_commentaire;
    }

    public String getCip() {
        return cip;
    }

    public void setCip(String cip) {
        this.cip = cip;
    }

    public int getId_commentaire() {
        return id_commentaire;
    }

    public void setId_commentaire(int id_commentaire) {
        this.id_commentaire = id_commentaire;
    }

    public String getCommentaire_content() {
        return commentaire_content;
    }

    public void setCommentaire_content(String commentaire_content) {
        this.commentaire_content = commentaire_content;
    }

    public Usager getAuteur() {
        return auteur;
    }

    public void setAuteur(Usager auteur) {
        this.auteur = auteur;
    }

    public int getId_article() {
        return id_article;
    }

    public void setId_article(int id_article) {
        this.id_article = id_article;
    }

    public List<ReponseCommentaire> getReponses() {
        return reponses;
    }

    public void setReponses(List<ReponseCommentaire> reponses) {
        this.reponses = reponses;
    }
}
