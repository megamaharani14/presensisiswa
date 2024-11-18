import 'package:flutter/material.dart';
import 'package:presensisiswa/provider/attendance_provider.dart';



class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);
    final students = attendanceProvider.students;

    return Scaffold(
      appBar: AppBar(title: const Text('Pencatatan Kehadiran')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (contex, index) {
          final student = students[index];
          return ListTile(
            title: Text(student.name),
            trailing: Checkbox(
              value: student.isPresent,
              onChanged: (value) {
                student.isPresent = value ?? false;
                attendanceProvider.notifyListeners();
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: students.isEmpty
              ? null
              : () {
                  attendanceProvider.saveAttendance();
                },
          child: const Text('Simpan Kehadiran'),
        ),
      ),
    );
  }
}
