package in.react.tktbooking;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Maincontroller {
	
	@GetMapping("/movies")
    public String openMovies() {
        return "movies";
    }
    
    @GetMapping("/customercare")
    public String openSupport() {
        return "customercare";
    }
    
    @GetMapping("/orders")
    public String openOrder() {
        return "orders";
    }
    
    @GetMapping("/theatres")
    public String openBooking() {
        return "theatres";
    }
    
    @GetMapping("/seats")
    public String openSeats() {
        return "seats";
    }
    
    @GetMapping("/payments")
    public String openPayment() {
        return "payments";
    }
}
