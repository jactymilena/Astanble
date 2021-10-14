package ca.usherbrooke.gegi.server.service;

import ca.usherbrooke.gegi.server.business.Article;
import ca.usherbrooke.gegi.server.business.Thematique;
import ca.usherbrooke.gegi.server.business.Wiki;
import ca.usherbrooke.gegi.server.persistence.ThematiqueMapper;
import org.apache.ibatis.annotations.Param;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.PermitAll;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import java.util.List;


@Path("/api")
public class ThematiqueService {

    @Context
    SecurityContext securityContext;

    @Inject
    JsonWebToken jwt;

    @Inject
    ThematiqueMapper thematiqueMapper;

    @GET
    @Path("thematique")
    @PermitAll
    @Produces(MediaType.APPLICATION_JSON)
    public List<Thematique> getThematique() {
        List<Thematique> thematiques = thematiqueMapper.select();
        return thematiques;
    }
}
