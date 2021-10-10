package server.service;

import server.business.Wiki;
import server.persistence.WikiMapper;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.RolesAllowed;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import java.util.List;


@Path("/api")
public class WikiService {

    @Context
    SecurityContext securityContext;

    @Inject
    JsonWebToken jwt;

    @Inject
    WikiMapper wikiMapper;

    @GET
    @Path("/wiki")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Wiki> getWiki() {
        List<Wiki> wikis = wikiMapper.select();
        return wikis;
    }

}
