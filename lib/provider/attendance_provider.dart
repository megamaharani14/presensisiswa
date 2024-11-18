import 'package:flutter/material.dart';
import '../models/catatan_kehadiran.dart';


class AttendanceProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _students = [
    {'name': 'Ali', 'isPresent': false},
    {'name': 'Budi', 'isPresent': false},
    {'name': 'Citra', 'isPresent': false},
    {'name': 'Mega', 'isPresent': false},
    {'name': 'Shinta', 'isPresent': false},
    
  ];

  final List<CatatanKehadiran> _attendanceHistory = [];

  final List<Map<String, dynamic>> _history = [];

  List<Map<String, dynamic>> get students => _students;

  List<Map<String, dynamic>> get history => _history;

  void replaceAttendance(int index) {
    _students[index]['isPresent'] = !_students[index]['isPresent'];
    notifyListeners();
  }
    void saveAttendance() {
    int present =
        _students.where((student) => student['isPresent'] == true).length;
    int absent = _students.length - present;

    _history.insert(0, {
      'waktu': DateTime.now(),
      'hadir': present,
      'tidak hadir': absent,
    });

    for (var student in _students) {
      student['isPrsent'] = false;
    }
    notifyListeners();
  }
}
