// ignore_for_file: avoid_print

List<String> mergeTimetables(List<String> trainX, List<String> trainY) {
  // Step 1: Create an empty merged list
  final List<String> mergedList = [];

  // Step 2: Find and add common stations to mergedList
  final commonStations = trainX.toSet().intersection(trainY.toSet());
  for (var station in commonStations) {
    mergedList.add(station);
  }

  // Step 3: Loop through trainX and insert remaining stations
  for (var station in trainX) {
    if (!mergedList.contains(station)) {
      // Find the index where to insert
      int insertIndex =
          mergedList.isEmpty ? 0 : findInsertIndex(mergedList, trainX, station);
      mergedList.insert(insertIndex, station);
    }
  }

  // Step 4: Loop through trainY and insert remaining stations
  for (var station in trainY) {
    if (!mergedList.contains(station)) {
      // Find the index where to insert
      int insertIndex = findInsertIndex(mergedList, trainY, station);
      mergedList.insert(insertIndex, station);
    }
  }

  return mergedList;
}

// Helper function to find the correct insert index
int findInsertIndex(
    List<String> mergedList, List<String> originalList, String station) {
  // Find the index of the station in the original list
  int originalIndex = originalList.indexOf(station);

  // Look for previous stations that are already in mergedList
  for (int i = originalIndex - 1; i >= 0; i--) {
    String prevStation = originalList[i];
    int prevIndex = mergedList.indexOf(prevStation);
    if (prevIndex != -1) {
      return prevIndex + 1;
    }
  }

  // If no previous stations found, insert at the beginning
  return 0;
}

void main() {
  // Test Case 1: Basic scenario with some common and some unique stations
  testMergeTimetables(
    trainX: 'agbcde'.split(''),
    trainY: 'ghbef'.split(''),
    expectedOutput: ['a', 'g', 'h', 'b', 'c', 'd', 'e', 'f'],
  );

  // Test Case 2: Completely different lists
  testMergeTimetables(
    trainX: 'def'.split(''),
    trainY: 'abc'.split(''),
    expectedOutput: ['a', 'b', 'c', 'd', 'e', 'f'],
  );

  // Test Case 3: One list is a subset of another
  testMergeTimetables(
    trainX: 'abcde'.split(''),
    trainY: 'bcd'.split(''),
    expectedOutput: ['a', 'b', 'c', 'd', 'e'],
  );

  // Test Case 4: Completely identical lists
  testMergeTimetables(
    trainX: 'abcde'.split(''),
    trainY: 'abcde'.split(''),
    expectedOutput: ['a', 'b', 'c', 'd', 'e'],
  );

  // Test Case 5: Lists with some overlap but different orders
  testMergeTimetables(
    trainX: 'abcdef'.split(''),
    trainY: 'cdefgh'.split(''),
    expectedOutput: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'],
  );

  // Test Case 6: Empty lists
  testMergeTimetables(
    trainX: [],
    trainY: [],
    expectedOutput: [],
  );

  // Test Case 7: One empty list
  testMergeTimetables(
    trainX: 'abc'.split(''),
    trainY: [],
    expectedOutput: ['a', 'b', 'c'],
  );

  // Test Case 8: Complex scenario with multiple insertions
  testMergeTimetables(
    trainX: 'abcdefg'.split(''),
    trainY: 'bdfhijk'.split(''),
    expectedOutput: ['a', 'b', 'c', 'd', 'e', 'f', 'h', 'i', 'j', 'k', 'g'],
  );
}

// Test helper function
void testMergeTimetables(
    {required List<String> trainX,
    required List<String> trainY,
    required List<String> expectedOutput}) {
  List<String> mergedList = mergeTimetables(trainX, trainY);
  print('Train X: $trainX');
  print('Train Y: $trainY');
  print('Merged : $mergedList');
  print('Expected: $expectedOutput');
  print(
      'Test ${mergedList.toString() == expectedOutput.toString() ? 'PASSED' : 'FAILED'}');
  print('-------------------');
}
