package com.example.demo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/welcome/v1")
public class WelcomeController {
    private static int counter = 0;

    @GetMapping
    public ResponseEntity<String> getHomePage() {
        counter++;
        return ResponseEntity.ok("Welcome controller called! " + counter);
    }
}
