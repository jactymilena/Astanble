package ca.usherbrooke.gegi.server.business.log;

import ca.usherbrooke.gegi.server.business.log.Log;

import java.sql.Time;

public class UserLog extends Log {
    private String context_user_cip;

    public UserLog(String CIP, String context_user_cip, int id_type, int id_field) {
        super(CIP, id_type, id_field);
        this.context_user_cip = context_user_cip;
    }

    public String getContext_user_cip() {
        return context_user_cip;
    }

    public void setContext_user_cip(String context_user_cip) {
        this.context_user_cip = context_user_cip;
    }
}
