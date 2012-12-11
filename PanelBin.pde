class PanelBin implements Comparable {
  
  String suspect;
  ArrayList<Panel> panelList = new ArrayList();
  
  int compareTo(Object o) {
    int r = panelList.size() - ((PanelBin) o).panelList.size();
    return(r);
  }
  
}
