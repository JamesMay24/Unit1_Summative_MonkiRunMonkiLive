class Button {
  String label; 
  float x;      
  float y;      
  float w;      
  float h;      
  
            
  Button(String labelB, float yesnt, float yes, float widthB, float heightB) {
    label = labelB;
    x = 150;
    y = 300;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
    fill(218);
    stroke(140);
    rect(x, y, w, h, 100);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}
