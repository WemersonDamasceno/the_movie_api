String formatteTextSize(String name, int quantity) {
  if (name.length > quantity) {
    return name.substring(0, quantity) + "...";
  }
  return name;
}
