import java.util.Collections;

ArrayList<Panel> panelList = new ArrayList();
ArrayList<PanelBin> binList = new ArrayList();
HashMap<String, PanelBin> binHash = new HashMap(); 


void setup() {
  size(1200, 754);
  smooth(4);

  loadPanels();
}



void draw() {
}



void loadPanels() {
  String[] rows = loadStrings("multipleStops.csv");
  for (int i =1; i< rows.length; i++) {
    Panel p = new Panel();
    
  }
}

