package com.chtrembl.petstoreapp.controller;

import java.util.*;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.chtrembl.petstoreapp.model.User;

/**
 * REST controller to facilitate REST calls such as session keep alives
 * (progressive web apps)
 */
@RestController
public class RestAPIController {

    @Autowired
    private User sessionUser;

    @GetMapping("/api/contactus")
    public String contactus() {

        this.sessionUser.getTelemetryClient().trackEvent(
                String.format("PetStoreApp user %s requesting Contact Us", this.sessionUser.getName()),
                this.sessionUser.getCustomEventProperties(), null);

        return "Please contact Azure PetStore at 401-555-5555. Thank you. Demo 6/13";
    }

    @GetMapping("/api/sessionid")
    public String sessionid() {

        return this.sessionUser.getSessionId();
    }

    @GetMapping("/api/cpu-load")
    public String cpuLoad() {
        long start = System.nanoTime();

        for (int i = 0; i < 500; i++) {
            List<Integer> numbers = new Random()
                    .ints(50000, -10000000, 10000000)
                    .boxed()
                    .collect(Collectors.toList());
            Collections.shuffle(numbers);
            Collections.sort(numbers);
        }

        long elapsed = (System.nanoTime() - start) / 1000000;
        return String.valueOf(elapsed);
    }

    @GetMapping(value = "/introspectionSimulation", produces = MediaType.APPLICATION_JSON_VALUE)
    public String introspectionSimulation(Model model, HttpServletRequest request,
                                          @RequestParam(name = "sessionIdToIntrospect") Optional<String> sessionIdToIntrospect) {
        boolean active = (sessionIdToIntrospect != null && sessionIdToIntrospect.isPresent()
                && sessionIdToIntrospect.get() != null
                && sessionIdToIntrospect.get().equals(request.getHeader("session-id")));

        return "{\n" +
                "  \"active\": " + active + ",\n" +
                "  \"scope\": \"read write email\",\n" +
                "  \"client_id\": \"" + request.getHeader("session-id") + "\",\n" +
                "  \"username\": \"" + request.getHeader("session-id") + "\",\n" +
                "  \"exp\": 1911221039\n" +
                "}";
    }
}
