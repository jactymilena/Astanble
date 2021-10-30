package ca.usherbrooke.gegi.server.business.log;

import java.sql.Time;
import java.sql.Timestamp;

public class Log {
    protected String cip;
    protected Timestamp action_timestamp;
    protected int id_type;
    protected int id_field;

    public Log(String CIP, int id_type, int id_field) {
        this.cip = CIP;
        this.action_timestamp = action_timestamp;
        this.id_type = id_type;
        this.id_field = id_field;
    }

    public String getCip() {
        return cip;
    }

    public void setCip(String cip) {
        this.cip = cip;
    }

    public Timestamp getAction_timestamp() {
        return action_timestamp;
    }

    public void setAction_timestamp(Timestamp action_timestamp) {
        this.action_timestamp = action_timestamp;
    }

    public int getId_type() {
        return id_type;
    }

    public void setId_type(int id_type) {
        this.id_type = id_type;
    }

    public int getId_field() {
        return id_field;
    }

    public void setId_field(int id_field) {
        this.id_field = id_field;
    }
}
