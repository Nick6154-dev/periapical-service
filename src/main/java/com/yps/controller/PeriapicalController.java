package com.yps.controller;

import com.yps.service.PeriapicalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import java.io.ByteArrayInputStream;
import java.io.IOException;

@RestController
public class PeriapicalController {

    @Autowired
    private PeriapicalService service;

    @PostMapping("/predict")
    public Integer predict(@RequestBody byte[] imageData) throws IOException {
        return service.predictDiagnostic(ImageIO.read(new ByteArrayInputStream(imageData)));
    }

}
