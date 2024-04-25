import 'package:flutter/material.dart';

mixin ItemMovieMixin {
  formatterVoteAverage(voteAverage) {
    return int.parse((voteAverage * 10).toStringAsFixed(0));
  }

  selectColorPercentIndicator(int voteAverage) {
    if (voteAverage >= 70) {
      return Colors.green;
    } else if (voteAverage < 70 && voteAverage > 50) {
      return Colors.yellow;
    } else if (voteAverage < 50 && voteAverage > 20) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
