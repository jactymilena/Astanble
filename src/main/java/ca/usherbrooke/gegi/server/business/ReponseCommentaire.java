package ca.usherbrooke.gegi.server.business;

public class ReponseCommentaire extends Commentaire{
    private int id_reponse_commentaire;

    public int getId_reponse_commentaire() {
        return id_reponse_commentaire;
    }

    public void setId_reponse_commentaire(int id_reponse_commentaire) {
        this.id_reponse_commentaire = id_reponse_commentaire;
    }
}
