/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.time.LocalDate;
import java.util.Objects;

/**
 *
 * @author Kelsey
 */
public class Sighting {

    private int sightingId;
    private int superheroId;
    private int locationId;
    private LocalDate sightingDate;
    
    public int getSuperheroId() {
        return superheroId;
    }

    public void setSuperheroId(int superheroId) {
        this.superheroId = superheroId;
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public int getSightingId() {
        return sightingId;
    }

    public void setSightingId(int sightingId) {
        this.sightingId = sightingId;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 97 * hash + this.sightingId;
        hash = 97 * hash + this.superheroId;
        hash = 97 * hash + this.locationId;
        hash = 97 * hash + Objects.hashCode(this.sightingDate);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Sighting other = (Sighting) obj;
        if (this.sightingId != other.sightingId) {
            return false;
        }
        if (this.superheroId != other.superheroId) {
            return false;
        }
        if (this.locationId != other.locationId) {
            return false;
        }
        if (!Objects.equals(this.sightingDate, other.sightingDate)) {
            return false;
        }
        return true;
    }

    /**
     * @return the sightingDate
     */
    public LocalDate getSightingDate() {
        return sightingDate;
    }

    /**
     * @param sightingDate the sightingDate to set
     */
    public void setSightingDate(LocalDate sightingDate) {
        this.sightingDate = sightingDate;
    }

}
