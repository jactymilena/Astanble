package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Roles;
import ca.usherbrooke.gegi.server.business.Trimester;
import ca.usherbrooke.gegi.server.persistence.TrimesterMapper;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.RolesAllowed;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import java.util.List;


@Path("")
public class TrimesterService {

    @Context
    SecurityContext securityContext;

    @Inject
    JsonWebToken jwt;

    @Inject
    TrimesterMapper trimesterMapper;

    @GET
    @Path("trimester")
    @RolesAllowed({Roles.STUDENT})
    @Produces(MediaType.APPLICATION_JSON)
    public List<Trimester> getTrimestre() {
         List<Trimester> trimesters = trimesterMapper.select();
        return trimesters;
    }


    @PUT
    @Path("insert_trimester")
    @RolesAllowed({Roles.TEACHER})
    public void insertTrimester(Trimester trimester) {
                trimesterMapper.insertTrimester(trimester);
            }
}
