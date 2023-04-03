
import 'dart:math';

class RandomGenerator {
  static List<int> generateRandomDate({required int range}) {
    List<int> result = [];

    for(int i = 0; i < range; i++){
      int randomMinMax = 1 + Random().nextInt(32 - 1);
      result.add(randomMinMax);
    }
    return result;
  }
}
