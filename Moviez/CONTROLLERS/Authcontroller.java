package in.react.tktbooking;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("sid")
public class Authcontroller {
    
    @GetMapping("/")
    public String openHome() {
        return "index"; 
    }
    
    @GetMapping("/signup")
    public String openSignup() {
        return "signup";
    }
    
    @PostMapping("/signupdata")
    public String handleSignup(@ModelAttribute Signupdto dto, Model model) {
        try {
            int sid = Authdao.insertSignup(dto);
            model.addAttribute("sid", sid);
            return "redirect:/profile";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "signup";
        }
    }
    
    @GetMapping("/signin")
    public String openSignin() {
        return "signin";
    }
    
    @PostMapping("/signindata")
    public String handleSignin(@ModelAttribute Signindto dto, Model model) {
        try {
            int sid = Authdao.loginUser(dto);
            model.addAttribute("sid", sid);
            return "redirect:/profile";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "signin";
        }
    }
    
    @GetMapping("/profile")
    public String openProfile(@ModelAttribute("sid") Integer sid, Model model) {
        if (sid == null) {
            return "redirect:/signin";
        }
        try {
            Signupdto user = Authdao.getUserBySid(sid);
            if (user != null) {
                model.addAttribute("user", user);
            } else {
                model.addAttribute("error", "User not found");
            }
        } catch (Exception e) {
            model.addAttribute("error", "Error loading profile: " + e.getMessage());
        }
        return "profile";
    }
    
}
