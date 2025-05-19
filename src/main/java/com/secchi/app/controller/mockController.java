package com.secchi.app.controller;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class mockController {


    @GetMapping("/mock")
    public ResponseEntity<String> getMockData() {
        String mockData = "This is mock data";
        return ResponseEntity.ok(mockData);
    }

    @PostMapping("/mock")
    public ResponseEntity<String> postMockData(@RequestBody String data) {
        return ResponseEntity.ok("Received: " + data);
    }

}