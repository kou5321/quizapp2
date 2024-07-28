package com.bfs.logindemo.controller;

import com.bfs.logindemo.domain.User;
import com.bfs.logindemo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegistrationController {

    private final UserService userService;

    @Autowired
    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String getRegister() {
        return "register";
    }

    @PostMapping("/register")
    public String postRegister(@RequestParam String email,
                               @RequestParam String firstname,
                               @RequestParam String lastname,
                               @RequestParam String password,
                               Model model) {
        User newUser = new User();
        newUser.setEmail(email);
        newUser.setFirstname(firstname);
        newUser.setLastname(lastname);
        newUser.setPassword(password);
        newUser.set_active(true);
        newUser.set_admin(false);

        boolean isRegistered = userService.createNewUser(newUser);

        if (isRegistered) {
            return "redirect:/login";
        } else {
            model.addAttribute("error", "Registration failed. Email might already be in use.");
            return "register";
        }
    }
}
