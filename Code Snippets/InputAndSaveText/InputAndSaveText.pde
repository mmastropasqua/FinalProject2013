//A string is data made up of text characters
//Technically, strings in processing are objects and have methods
//You can look these up if you're curious
//Strings are surrounded by quotation marks
//Typing "" is a way of creating a blank string


//This variable will store what the user is currently typing
String typing = "";

//This variable will store saved text when user hits return/enter
String saved = "";

void setup() {
  size(400, 200);
}

void draw() {
  background(0);
  //Here we create text giving directions.  \n creates a new line
  //We also use the text function to dispay our two strings, typing and saved
  text("Type the text you want to see. \nHit return to save what you typed. ", 25, 40);
  text(typing, 25, 90);
  text(saved, 25, 130);
}

void keyPressed() {
  //Each time I press a key, check to see if the key is ENTER/RETURN
  //If it is, I assign the value of the typing variable to the saved variable and clear the typing variable
  if (key == ENTER || key == RETURN) {
    saved = typing;
    typing="";
  }
  //If I didn't pres enter, I add the key I pressed to the list of characters in the typing string
  else {
    typing = typing + key;
  }
}

