import 'dart:math';
import 'dart:io';

void main() {
  // Generiere 10.000 Zufallszahlen
  List<int> numbers = List.generate(10000, (_) => Random().nextInt(10000));

  // SortALgos
  List<int> bubbleSortList = List.from(numbers);
  List<int> mergeSortList = List.from(numbers);
  List<int> quickSortList = List.from(numbers);

  print(quickSortList);
  // Bubble Sort
  Stopwatch stopwatch = Stopwatch()..start();
  bubbleSort(bubbleSortList);
  stopwatch.stop();
  print('Bubble Sort Dauer: ${stopwatch.elapsedMilliseconds} ms');

  // Merge Sort
  stopwatch.reset();
  stopwatch.start();
  mergeSort(mergeSortList);
  stopwatch.stop();
  print('Merge Sort Dauer: ${stopwatch.elapsedMilliseconds} ms');

  // Quick Sort
  stopwatch.reset();
  stopwatch.start();
  quickSort(quickSortList, 0, quickSortList.length - 1);
  stopwatch.stop();
  print('Quick Sort Dauer: ${stopwatch.elapsedMilliseconds} ms');
}

void bubbleSort(List<int> list) {
  int n = list.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        // Tauschen
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
}

void mergeSort(List<int> list) {
  if (list.length <= 1) return;

  int mid = list.length ~/ 2;
  List<int> left = list.sublist(0, mid);
  List<int> right = list.sublist(mid);

  mergeSort(left);
  mergeSort(right);

  merge(list, left, right);
}

void merge(List<int> list, List<int> left, List<int> right) {
  int i = 0, j = 0, k = 0;

  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      list[k++] = left[i++];
    } else {
      list[k++] = right[j++];
    }
  }

  while (i < left.length) {
    list[k++] = left[i++];
  }

  while (j < right.length) {
    list[k++] = right[j++];
  }
}

void quickSort(List<int> list, int low, int high) {
  if (low < high) {
    int pi = partition(list, low, high);
    quickSort(list, low, pi - 1);
    quickSort(list, pi + 1, high);
  }
}

int partition(List<int> list, int low, int high) {
  int pivot = list[high];
  int i = low - 1;

  for (int j = low; j < high; j++) {
    if (list[j] < pivot) {
      i++;
      int temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
  }

  int temp = list[i + 1];
  list[i + 1] = list[high];
  list[high] = temp;

  return i + 1;
}
