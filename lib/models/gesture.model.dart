
import 'dart:math';

class Gesture {
  List<Point> trajectory = <Point>[];
  DateTime start;
  late DateTime end;

  Gesture({required Point startPoint, required this.start}){
    trajectory.add(startPoint);
  }

  void addPoint(Point newPoint) => trajectory.add(newPoint);

  void addEndTime(DateTime finalTime) => end = finalTime;

}
