package com.gregzho.singlepageapp;

import java.io.IOException;
import java.io.InputStream;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class FirebaseInit implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		String firebaseKeyPath = "/WEB-INF/firebaseAccountKey.json";
		
		try (InputStream firebaseAccount = context.getResourceAsStream(firebaseKeyPath)) {

			FirebaseOptions options = FirebaseOptions.builder()
					  .setCredentials(GoogleCredentials.fromStream(firebaseAccount))
					  .setDatabaseUrl("https://opencamslive-default-rtdb.firebaseio.com")
					  .build();
			
			if (FirebaseApp.getApps().isEmpty()) {
				FirebaseApp.initializeApp(options);
				System.out.println("[OUTP] Successfully Firebase Admin SDK has initialized");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("[OUTP] Failed to initialzie Firebase Admin SDK " + e.getMessage());
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		//Clean up resources if needed
		if (!FirebaseApp.getApps().isEmpty()) {
			FirebaseApp.getInstance().delete();
		}
	}
}
