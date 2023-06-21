import 'package:flutter/material.dart';

const int MAX_SIZE = 1000;
const int MAX_ANIMATION_SPEED = 2000;

enum SortingType {
  BUBBLE_SORT,
  INSERTION_SORT,
  SELECTION_SORT,
  MERGE_SORT,
  QUICK_SORT,
}

// final ShapeBorder SHAPE = RoundedRectangleBorder(
//   borderRadius: BorderRadius.circular(10.0),
// );

final OutlinedBorder? SHAPE = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10.0),
);

