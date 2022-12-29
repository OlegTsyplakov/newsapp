class Settings {}

enum APIChoice {
  all(""),
  top("top"),
  article("article");

  const APIChoice(this.value);
  final String value;
}
