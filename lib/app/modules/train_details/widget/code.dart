class Tuple {
  final int first;
  final String second;
  final String third;

  Tuple(this.first, this.second, this.third);

  @override
  String toString() => '$second to $third';
}

void main() {
  List<String> FT = [
    "Narsingdi",
    "Brahmanbaria",
  ];

  List<String> route = [
    "Dhaka",
    "Biman_Bandar",
    "Narsingdi",
    "Bhairab_Bazar",
    "Brahmanbaria",
    "Akhaura",
    "Quasba",
    "Cumilla",
    "Laksam",
    "Feni",
    "Chattogram",
    "Cox's_Bazar",
  ];
  List<Tuple> tuples = [];
  for (int i = route.indexOf(FT[0]); i > -1; i--) {
    for (int j = route.indexOf(FT[1]); j < route.length; j++) {
      Tuple temp = Tuple((j - i).abs(), route[i], route[j]);
      tuples.add(temp);
    }
  }
  tuples.sort((a, b) => a.first.compareTo(b.first));
  tuples.forEach((tuple) => print(tuple));
}
