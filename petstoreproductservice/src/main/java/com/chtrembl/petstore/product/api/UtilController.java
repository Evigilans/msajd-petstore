package com.chtrembl.petstore.product.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@RestController
public class UtilController {
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
}
