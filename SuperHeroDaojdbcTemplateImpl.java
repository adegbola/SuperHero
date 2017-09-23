/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Location;
import Model.Organization;
import Model.Sighting;
import Model.Superhero;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Kelsey
 */
public class SuperHeroDaojdbcTemplateImpl implements SuperHeroDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String SQL_INSERT_SUPERHERO
            = "insert into superhero" + "(FirstName, LastName, description, superpower)" + " values(?,?,?,?)";
    private static final String SQL_DELETE_SUPERHERO
            = "delete from superhero where SuperHeroID = ?";
    private static final String SQL_UPDATE_SUPERHERO
            = "update superhero set FirstName = ?, LastName = ?, description = ?, "
            + "SuperPower = ?  where SuperHeroID =  ?";
    private static final String SQL_SELECT_SUPERHERO
            = "select * from superhero where SuperHeroID= ?";
    private static final String SQL_SELECT_ALL_SUPERHERO
            = "select * from superhero";
    private static final String SQL_SELECT_SUPERHERO_BY_LOCATION_ID
            = "select sh.SuperHeroID, sh.FirstName, sh.LastName,  "
            + "sh.description, su.superpowers from superheros sh "
            + "join location_superhero ls on sh.SuperHeroID = ls.SuperHeroID where "
            + "ls.locationid = ?";

    //Organization
    private static final String SQL_INSERT_ORGANIZATION
            = "insert into organization "
            + "(OrganizationName, OrganizationDescription, Phone, Email) "
            + "values (?, ?, ?, ?)";

    private static final String SQL_INSERT_ORGANIZATION_SUPERHERO
            = "insert into OrganizationSuperHero(OrganizationID, SuperHeroID) values(?, ?)";

    private static final String SQL_DELETE_ORGANIZATION
            = "delete from organization where OrganizationID = ?";

    private static final String SQL_DELETE_SUPERHERO_ORGANIZATION
            = "delete from superheroorganization where OrganizationID = ?";

    private static final String SQL_UPDATE_ORGANIZATION
            = "update organization set OrganizationName = ?, organizationDescription = ?, "
            + "phone = ?, email = ? "
            + "where OrganizationID = ?";

    private static final String SQL_SELECT_ORGANIZATION
            = "select * from organization where OrganizationID = ?";

    private static final String SQL_SELECT_ORGANIZATION_SUPERHERO_SUPERHERO_ID_BY_ORGANIZATION_ID
            = "select SuperHeroID from superheroorganization where OrganizationID = ?";

    private static final String SQL_SELECT_ALL_ORGANIZATIONS
            = "select * from organization";


    //Sighting
    private static final String SQL_INSERT_SIGHTING
            = "insert into sighting(DateDatetime, SuperHeroID, LocationID) values(?,?,?)";
    private static final String SQL_DELETE_SIGHTING
            = "delete from sighting where SightingID = ?";
    private static final String SQL_UPDATE_SIGHTING
            = "update sighting set DateDatetime= ?, SuperHeroID=?, LocationID=?"
            + "  where SightingID =  ?";
    private static final String SQL_SELECT_SIGHTING
            = "select * from sighting where SightingID = ?";


    private static final String SQL_SELECT_ALL_SIGHTING
            = "select * from sighting";
    private static final String SQL_DELETE_FROM_SIGHTING_BY_SUPERHERO
            = "delete from sighting where SuperheroId =?";

    //Location
    private static final String SQL_INSERT_Location
            = "insert into location(LocationName, LocationDescription, LocationAddress, longitude, latitude) "
            + "values(?,?,?, ?,?)";
    private static final String SQL_DELETE_Location
            = "delete from location where LocationID = ?";
    private static final String SQL_UPDATE_Location
            = "update location set LocationName= ?, LocationDescription=?, LocationAddress = ?, "
            + "longitude = ?, latitude = ?"
            + "  where LocationID =  ?";
    private static final String SQL_SELECT_Location
            = "select * from location where LocationID = ?";

    private static final String SQL_SELECT_LOCATION_ID_BY_SUPERHERO_ID
            = "select loc.LocationID, loc.LocationName, loc.LocationDescription, loc.LocationAddress, "
            + "loc.longitude, loc.latitude from location loc "
            + "join superhero on loc.LocationID = superhero.LocationID where "
            + "superhero.SuperHeroID = ?";

    private static final String SQL_SELECT_SIGHTATIONS_BY_SUPERHERO_ID
            = "select loc.LocationID, loc.LocationName, loc.LocationDescription, loc.LocationAddress, "
            + "loc.longitude, loc.latitude from sighting s "
            + "join location loc on s.LocationId = loc.sighting where "
            + "s.SuperHeroID = ?";

    private static final String SQL_SELECT_ALL_SIGHTING_BY_DATE
            = "select s.*,sh.*,loc.* from sighting s join location loc on s.LocationId= loc.LocationId join superhero sh on sh.SuperHeroId=s.SuperHeroId   where Date= ? ";
    private static final String SQL_SELECT_ALL_ORGANIZATION_MEMBERS
            = "select sh.* from superheroorganization so join superhero sh on so.SuperHeroId= sh.SuperHeroId where so.OrganizationID="
            + "? ";

    private static final String SQL_SELECT_ALL_ORGANIZATION_OF_A_MEMBER
            = "select sh.* from superheroorganization so join superhero sh on so.SuperHeroId= sh.SuperHeroId where so.SuperHeroId="
            + "? ";

    private static final String SQL_SELECT_ALL_Location
            = "select * from location";
    private static final String SQL_DELETE_FROM_ORGANIZATION_BY_SUPERHERO
            = "delete from superheroorganization where SuperheroId =?";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addOrganization(Organization organization) {

        String sql = "insert into organization "
                + "(OrganizationName, OrganizationDescription, Phone, Email) "
                + "values (?, ?, ?, ?)";

        jdbcTemplate.update(sql,
                organization.getOrganizationName(),
                organization.getOrganizationDescription(),
                organization.getPhone(),
                organization.getEmail());

        int organizationId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);
        organization.setOrganizationId(organizationId);

        organization.getMembers().forEach((superhero) -> {
            String sup = "insert into superheroorganization "
                    + "(SuperheroID, OrganizationID) "
                    + "values (?, ?)";

            jdbcTemplate.update(sup, superhero.getSuperheroId(), organizationId);
        });
    }

    @Override
    public void deleteOrganization(int organizationId) {
        jdbcTemplate.update("delete from superheroorganization where OrganizationID =?", organizationId);
        jdbcTemplate.update(SQL_DELETE_ORGANIZATION, organizationId);
    }

    @Override
    public void updateOrganization(Organization organization) {
        jdbcTemplate.update(SQL_UPDATE_ORGANIZATION,
                organization.getOrganizationName(),
                organization.getOrganizationDescription(),
                organization.getPhone(),
                organization.getEmail(),
                organization.getOrganizationId());

    }

    @Override
    public Organization getOrganizationById(int id) {

        try {
            Organization org = jdbcTemplate.queryForObject(SQL_SELECT_ORGANIZATION,
                    new OrganizationMapper(), id);
            return org;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<Organization> getAllOrganization() {
        return jdbcTemplate.query(SQL_SELECT_ALL_ORGANIZATIONS, new OrganizationMapper());

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addSuperhero(Superhero superHero) {
        jdbcTemplate.update(SQL_INSERT_SUPERHERO,
                superHero.getFirstName(),
                superHero.getLastName(),
                superHero.getDescription(),
                superHero.getSuperPower());
        int superheroId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);
        superHero.setSuperheroId(superheroId);

    }

    @Override
    public void deleteSuperhero(int SuperheroId) {
        jdbcTemplate.update(SQL_DELETE_FROM_ORGANIZATION_BY_SUPERHERO, SuperheroId);
        jdbcTemplate.update(SQL_DELETE_FROM_SIGHTING_BY_SUPERHERO, SuperheroId);
        jdbcTemplate.update(SQL_DELETE_SUPERHERO, SuperheroId);
    }

    @Override
    public void updateSuperhero(Superhero superhero) {
        jdbcTemplate.update(SQL_UPDATE_SUPERHERO,
                superhero.getFirstName(),
                superhero.getLastName(),
                superhero.getDescription(),
                superhero.getSuperPower(),
                superhero.getSuperheroId());
    }

    @Override
    public Superhero getSuperheroById(int id) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_SUPERHERO,
                    new SuperheroMapper(),
                    id);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public Organization getSuperheroByOrganizationId(int OrganizationId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_ORGANIZATION_SUPERHERO_SUPERHERO_ID_BY_ORGANIZATION_ID, new OrganizationMapper(), OrganizationId);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<Superhero> getSuperheroByLocationId(int LocationId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Superhero> getAllSuperhero() {
        return jdbcTemplate.query(SQL_SELECT_ALL_SUPERHERO, new SuperheroMapper());

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addLocation(Location location) {

        jdbcTemplate.update(SQL_INSERT_Location,
                location.getLocationName(),
                location.getLocationDescription(),
                location.getLocationAddress(),
                location.getLongitude(),
                location.getLatitude());
        int locationId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);
        location.setLocationId(locationId);

    }

    @Override
    public void deleteLocation(int LocationId) {
        jdbcTemplate.update(SQL_DELETE_Location, LocationId);
    }

    @Override
    public void updateLocation(Location location) {
        jdbcTemplate.update(SQL_UPDATE_Location,
                location.getLocationName(),
                location.getLocationDescription(),
                location.getLocationAddress(),
                location.getLongitude(),
                location.getLatitude(),
                location.getLocationId());
    }

    @Override
    public Location getLocationById(int id) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_Location,
                    new LocationMapper(),
                    id);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<Location> getAllLocation() {
        return jdbcTemplate.query(SQL_SELECT_ALL_Location, new LocationMapper());
    }

    @Override
    public void addSighting(Sighting sighting) {
        
        jdbcTemplate.update(SQL_INSERT_SIGHTING, java.sql.Date.valueOf(sighting.getSightingDate()),
                sighting.getSuperheroId(), sighting.getLocationId());

        int sightingId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);
        sighting.setSightingId(sightingId);
    }

    @Override
    public void deleteSighting(int SightingId) {
        jdbcTemplate.update(SQL_DELETE_FROM_ORGANIZATION_BY_SUPERHERO, SightingId);
        jdbcTemplate.update(SQL_DELETE_FROM_SIGHTING_BY_SUPERHERO, SightingId);
        jdbcTemplate.update(SQL_DELETE_SIGHTING, SightingId);
    }

    @Override
    public void updateSighting(Sighting sighting) {
        jdbcTemplate.update(SQL_UPDATE_SIGHTING,
               java.sql.Date.valueOf(sighting.getSightingDate()),
                sighting.getSuperheroId(),
                sighting.getLocationId(),
                sighting.getSightingId());
    }

    @Override
    public List<Sighting> getAllSighting() {
        return jdbcTemplate.query(SQL_SELECT_ALL_SIGHTING, new SightingMapper());
    }

    @Override
    public Sighting getSightingById(int id) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_SIGHTING, new SightingMapper(), id);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    private static final class SuperheroMapper implements RowMapper<Superhero> {

        @Override
        public Superhero mapRow(ResultSet rs, int i) throws SQLException {
            Superhero sh = new Superhero();
            sh.setFirstName(rs.getString("FirstName"));
            sh.setLastName(rs.getString("LastName"));
            sh.setDescription(rs.getString("description"));
            sh.setSuperPower(rs.getString("superpower"));
            sh.setSuperheroId(rs.getInt("SuperHeroID"));
            return sh;
        }

    }

    private final class OrganizationMapper implements RowMapper<Organization> {

        @Override
        public Organization mapRow(ResultSet rs, int i) throws SQLException {
            Organization org = new Organization();
            org.setOrganizationName(rs.getString("OrganizationName"));
            org.setOrganizationDescription(rs.getString("OrganizationDescription"));
            org.setPhone(rs.getString("Phone"));
            org.setEmail(rs.getString("Email"));
            int id = rs.getInt("OrganizationID");
            org.setOrganizationId(id);
            List<Superhero> members = getMemebersByOrganization(id);
            org.setMembers(members);
            return org;
        }

        private List<Superhero> getMemebersByOrganization(int id) {
            return jdbcTemplate.query(SQL_SELECT_ALL_ORGANIZATION_MEMBERS, new SuperheroMapper(), id);
        }

    }

    private static final class LocationMapper implements RowMapper<Location> {

        @Override
        public Location mapRow(ResultSet rs, int i) throws SQLException {
            Location loc = new Location();
            loc.setLocationName(rs.getString("LocationName"));
            loc.setLocationDescription(rs.getString("LocationDescription"));
            loc.setLocationAddress(rs.getString("LocationAddress"));
            loc.setLongitude(rs.getString("longitude"));
            loc.setLatitude(rs.getString("latitude"));

            loc.setLocationId(rs.getInt("LocationID"));
            return loc;
        }

    }

    private static final class SightingMapper implements RowMapper<Sighting> {

        @Override
        public Sighting mapRow(ResultSet rs, int i) throws SQLException {
            Sighting sight = new Sighting();

            sight.setSightingDate(rs.getDate("DateDatetime").toLocalDate());
            sight.setSuperheroId(rs.getInt("superheroId"));
            sight.setLocationId(rs.getInt("locationId"));
            sight.setSightingId(rs.getInt("SightingID"));

            return sight;
        }

    }

    
}
