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
import java.util.List;

/**
 *
 * @author Kelsey
 */
public interface SuperHeroDao {
    public void addOrganization(Organization organization);
    public void deleteOrganization(int organizationId);

    public void updateOrganization(Organization organization);

    public Organization getOrganizationById(int id);

    public List<Organization> getAllOrganization();

    public void addSuperhero(Superhero superHero);

    public void deleteSuperhero(int SuperheroId);

    public void updateSuperhero(Superhero superhero);

    public Superhero getSuperheroById(int id);

    public Organization getSuperheroByOrganizationId(int OrganizationId);

    public List<Superhero> getSuperheroByLocationId(int LocationId);

    public List<Superhero> getAllSuperhero();

    public void addLocation(Location location);

    public void deleteLocation(int LocationId);

    public void updateLocation(Location location);

    public Location getLocationById(int id);

    public List<Location> getAllLocation();
    
    public void addSighting(Sighting sighting);

    public void deleteSighting(int SightingId);

    public void updateSighting(Sighting sighting);

    public Sighting getSightingById(int id);

    public List<Sighting> getAllSighting();
}

    
    

