package com.sg.superhero;

import Dao.SuperHeroDao;
import Model.Location;
import Model.Sighting;
import Model.Superhero;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
//@RequestMapping({"/hello"})
public class MainController {

    SuperHeroDao dao;

    @Inject
    public MainController(SuperHeroDao dao) {
        this.dao = dao;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String displayhome() {

        return "index";

    }

    @RequestMapping(value = "/displaySuperhero", method = RequestMethod.GET)
    public String displaySuperhero(Model model) {

        List<Superhero> SuperheroList = dao.getAllSuperhero();

        // Put the List of Superhero on the Model
        model.addAttribute("SuperheroList", SuperheroList);

        // Return the logical name of our View component
        return "superhero";
    }

    @RequestMapping(value = "/displaySighting", method = RequestMethod.GET)
    public String displaySighting(Model model) {
        List<Superhero> SuperheroList = dao.getAllSuperhero();
        List<Location> LocationList = dao.getAllLocation();
        List<Sighting> SightingList = dao.getAllSighting();
        model.addAttribute("SuperheroList", SuperheroList);
        model.addAttribute("LocationList", LocationList);
        model.addAttribute("SightingList", SightingList);
        return "Sighting";

    }

    @RequestMapping(value = "/displayOrganization", method = RequestMethod.GET)
    public String displayOrganization() {
        return "organization";
    }

    @RequestMapping(value = "/displayLocation", method = RequestMethod.GET)
    public String displayLocation(Model model) {
        List<Location> LocationList = dao.getAllLocation();
        model.addAttribute("LocationList", LocationList);
        return "Location";
    }

    @RequestMapping(value = "/displaySearchPage", method = RequestMethod.GET)
    public String displaySearchPage() {
        return "search";
    }

    @RequestMapping(value = "/createSuperhero", method = RequestMethod.POST)
    public String createSuperhero(HttpServletRequest request) {
        // grab the incoming values from the form and create a new Contact
        // object
        Superhero superhero = new Superhero();

        superhero.setFirstName(request.getParameter("firstName"));
        superhero.setLastName(request.getParameter("lastName"));
        superhero.setSuperPower(request.getParameter("superpower"));
        superhero.setDescription(request.getParameter("Description"));
        dao.addSuperhero(superhero);

        // we don't want to forward to a View component - we want to
        // redirect to the endpoint that displays the Superhero Page
        // so it can display the new Superhero in the table.
        return "redirect:displaySuperhero";
    }

    @RequestMapping(value = "/displaySuperHeroDetails", method = RequestMethod.GET)
    public String displaySuperheroDetails(HttpServletRequest request, Model model) {
        String superheroIdParameter = request.getParameter("superheroId");
        int superheroId = Integer.parseInt(superheroIdParameter);

        Superhero superhero = dao.getSuperheroById(superheroId);

        model.addAttribute("superhero", superhero);

        return "superHeroDetails";
    }

    @RequestMapping(value = "/deleteSuperhero", method = RequestMethod.GET)
    public String deleteSuperhero(HttpServletRequest request) {

        String superheroIdParameter = request.getParameter("superheroId");
        int superheroId = Integer.parseInt(superheroIdParameter);

        dao.deleteSuperhero(superheroId);

        return "redirect:displaySuperhero";

    }

    @RequestMapping(value = "/displayEditSuperheroForm", method = RequestMethod.GET)
    public String displayEditSuperheroForm(HttpServletRequest request, Model model) {
        String superheroIdParameter = request.getParameter("superheroId");
        int superheroId = Integer.parseInt(superheroIdParameter);
        Superhero superhero = dao.getSuperheroById(superheroId);
        model.addAttribute("superhero", superhero);
        return "editSuperheroForm";
    }

    @RequestMapping(value = "/editSuperhero", method = RequestMethod.POST)
    public String editContact(@ModelAttribute("superhero") Superhero superhero) {
        dao.updateSuperhero(superhero);

        return "redirect:displaySuperhero";
    }

    @RequestMapping(value = "/createLocation", method = RequestMethod.POST)
    public String createLocation(HttpServletRequest request) {
        // grab the incoming values from the form and create a new Contact
        // object
        Location location = new Location();
        location.setLocationName(request.getParameter("locationName"));
        location.setLocationDescription(request.getParameter("LocationDescription"));
        location.setLocationAddress(request.getParameter("locationAddress"));
        location.setLongitude(request.getParameter("longitude"));
        location.setLatitude(request.getParameter("latitude"));
        dao.addLocation(location);

        // we don't want to forward to a View component - we want to
        // redirect to the endpoint that displays the Superhero Page
        // so it can display the new Superhero in the table.
        return "redirect:displayLocation";
    }

    @RequestMapping(value = "/displayLocationDetails", method = RequestMethod.GET)
    public String displayLocationDetails(HttpServletRequest request, Model model) {
        String locationIdParameter = request.getParameter("locationId");
        int locationId = Integer.parseInt(locationIdParameter);
        Location location = dao.getLocationById(locationId);
        model.addAttribute("location", location);
        return "locationDetails";

    }

    @RequestMapping(value = "/deleteLocation", method = RequestMethod.GET)
    public String deleteLocation(HttpServletRequest request) {
        String locationIdParameter = request.getParameter("locationId");
        int locationId = Integer.parseInt(locationIdParameter);
        dao.deleteLocation(locationId);

        return "redirect:displayLocation";

    }

    @RequestMapping(value = "/displayEditLocationForm", method = RequestMethod.GET)
    public String displayEditLocationForm(HttpServletRequest request, Model model) {
        String locationIdParameter = request.getParameter("locationId");
        int locationId = Integer.parseInt(locationIdParameter);
        Location location = dao.getLocationById(locationId);
        model.addAttribute("location", location);
        return "editLocationForm";
    }

    @RequestMapping(value = "/editLocation", method = RequestMethod.POST)
    public String editLocation(@ModelAttribute("location") Location location) {
        dao.updateLocation(location);

        return "redirect:displayLocation";
    }

    @RequestMapping(value = "/createSighting", method = RequestMethod.POST)
    public String createSighting(HttpServletRequest request) {
        Sighting sighting = new Sighting();
        int locationId = Integer.parseInt(request.getParameter("locationId"));
        sighting.setLocationId(locationId);

        int superHeroId = Integer.parseInt(request.getParameter("superheroId"));
        sighting.setSuperheroId(superHeroId);
        //LocalDate localdate=LocalDate.parse(request.getParameter("sightingDate"));
        LocalDate localdate = LocalDate.parse(request.getParameter("sightingDate"), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        sighting.setSightingDate(localdate);
        dao.addSighting(sighting);
        return "redirect:displaySighting";
    }

    @RequestMapping(value = "/deleteSighting", method = RequestMethod.GET)
    public String deleteSighting(HttpServletRequest request) {
        String sightingIdParameter = request.getParameter("sightingId");
        int sightingId = Integer.parseInt(sightingIdParameter);
        dao.deleteSighting(sightingId);

        return "redirect:displaySighting";

    }

    @RequestMapping(value = "/displayEditSightingForm", method = RequestMethod.GET)
    public String displayEditSightingForm(HttpServletRequest request, Model model) {
        String sightingIdParameter = request.getParameter("sightingId");
        int sightingId = Integer.parseInt(sightingIdParameter);
        Sighting sighting = dao.getSightingById(sightingId);
        model.addAttribute("sighting", sighting);

        return "editSightingForm";
    }

    @RequestMapping(value = "/editSighting", method = RequestMethod.POST)
    public String editSighting( @ModelAttribute("sighting") Sighting sighting) {
        dao.updateSighting(sighting);

        return "redirect:displaySighting";
    }


       
}
