import { initializeApp } from "https://www.gstatic.com/firebasejs/11.6.1/firebase-app.js";
import { getAuth, signInWithEmailAndPassword, createUserWithEmailAndPassword, signOut } from "https://www.gstatic.com/firebasejs/11.6.1/firebase-auth.js";

// Your own firebaseConfig from firebase.google.com
const firebaseConfig = {
  apiKey: 
  authDomain: 
  databaseURL: 
  projectId: 
  storageBucket: 
  messagingSenderId:
  appId: 
  measurementId: 
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);

const appContainer = document.getElementById("app-container");
const homeLink = document.getElementById("home-link");
const aboutLink = document.getElementById("about-link");
const signInLink = document.getElementById("signin-link");
const signUpLink = document.getElementById("signup-link");
const profileLink = document.getElementById("profile-link");
const signOutLink = document.getElementById("signout-link");
const userEmail = document.getElementById("user-email");
const userUid = document.getElementById("user-uid");
const Context_Path = "";

auth.onAuthStateChanged(user => {
	if (user) {
		console.log("User sgined in: ", user.uid);
		signInLink.style.display = "none";
		signUpLink.style.display = "none";
		profileLink.style.display = "block";
		signOutLink.style.display = "block";
		
		if (window.location.hash === "#signin" || window.location.hash === "#signup") {
			navigateTo("profile");
		}
		else {
			routeChange();
		}
	}
	else {
		console.log("User signed out");
		signInLink.style.display = "block";
		signUpLink.style.display = "block";
		profileLink.style.display = "none";
		signOutLink.style.display = "none";
		
		if (window.location.hash === "#profile") {
			navigateTo("signin");
		}
		else {
			routeChange();
		}
	}
});

function navigateTo(page) {
	window.location.hash = page;
}

function routeChange() {
	const hash = window.location.hash.substring(1) || "signin";
	const currentUser = auth.currentUser;
	
	if (hash === "profile && !currentUser") {
		console.log("Not authenticated to redirect to signin");
		navigateTo("signin")
		return;
	}
	
	if ((hash === "signin" || hash === "signup") && currentUser) {
		console.log("Authenticated to redirect to profile");
		navigateTo("profile");
		return;
	}
	
	loadPage(hash);
}

// Initial Route
window.addEventListener("DOMContentLoaded", routeChange);

// Hash Changes
window.addEventListener("hashchange", routeChange);

// Route page by AJAX
async function loadPage(page) {
	appContainer.innerHTML = "Still Loading...";
	const url = `${Context_Path}/auth/${page}`;
	
	try {
		const headers = {};
		const currentUser = auth.currentUser;
	
		if (currentUser && (page === "profile")) {
			const idToken = await currentUser.getIdToken(true);
			headers["Authorization"] = `Bearer ${idToken}`;
			console.log("Able to send token for ", page);			
		}
		else {
			console.log("Not sending token for ", page);
		}
		
		const response = await fetch(url, {
			method: "GET",
			headers: headers
		});
		
		if (response.ok) {
			const html = await response.text();
			appContainer.innerHTML = html;
			signFormListener();
		}
		else if (response.status === 401 || response.status === 403) {
			console.error("Access denied by server for ", page);
			appContainer.innerHTML = '<h4 style="color: red;">Access denied. Please sign in</h4>';
			navigateTo("signin");
		}
		else {
			console.error("Failed response to load the page: ", response.status, response.statusText);
			appContainer.innerHTML = `<h4 style="color: red;">Failed to load the page (${response.status}), Please sign in</h4>`;
		}
			
	}
	catch (error) {
		console.error("Failed network to load the page: " ,error);
		appContainer.innerHTML = '<h4 style="color: red;">Failed network to load the page</h4>';
	}
	
}

// Handle Sign In to Firebase
async function handleSignIn(email, password) {
	const errorElement = document.getElementById("signin-error");
	errorElement.textContent = "";
	
	await signInWithEmailAndPassword(auth, email, password)
	.then((userCredential) => {
	      const user = userCredential.user;
	      console.log("Successfully signed in:", user);
    })
    .catch((error) => {
      const errorCode = error.code;
      const errorMessage = error.message;
      console.error("Failed to sign in :", errorCode, errorMessage);
	  errorElement.textContent = errorCode + ": " + errorMessage;
    });
}

// Handle Sign Up to Firebase
async function handleSignUp(email, password) {
	const errorElement = document.getElementById("signup-error");
	errorElement.textContent = "";
	
	await createUserWithEmailAndPassword(auth, email, password)
	.then((userCredential) => {
	      const user = userCredential.user;
	      console.log("Successfully signed up:", user);
    })
    .catch((error) => {
      const errorCode = error.code;
      const errorMessage = error.message;
      console.error("Failed to sign up :", errorCode, errorMessage);
	  errorElement.textContent = errorCode + ": " + errorMessage;
    });
}

// Handle Sign Out from Firebase
async function handleSignOut() {
	try {
		await signOut(auth);
		navigateTo("signin");
		console.log("Successfully signed out");
	}
	catch (error) {
		console.log("Failed to sign out: ", error);
	}
}


// Setup signInForm and signUpForm
function signFormListener() {
	const signInForm = document.getElementById("signin-form");
	if (signInForm) {
		signInForm.addEventListener("submit", (e) => {
			e.preventDefault();
			const email = document.getElementById("signin-email").value;
			const password = document.getElementById('signin-password').value;
			handleSignIn(email, password);
		});
	}
	
	const signUpForm = document.getElementById("signup-form");
	if (signUpForm) {
		signUpForm.addEventListener("submit", (e) => {
			e.preventDefault();
			const email = document.getElementById("signup-email").value;
			const password = document.getElementById('signup-password').value;
			handleSignUp(email, password);
		});
	}
	
}

signOutLink.addEventListener("click", handleSignOut);

// Initialize to attached the default view has form
signFormListener();