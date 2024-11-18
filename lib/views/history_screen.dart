import 'package:flutter/material.dart';
import 'package:presensisiswa/provider/attendance_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';



class HistoryScreen extends StatelessWidget{
  const HistoryScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final attendanceHistory = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: attendanceHistory.history.length,
        itemBuilder: (context, index){
          final record = attendanceHistory.history[index];
          final date = DateFormat('dd MMM yyyy').format(record['waktu']);
          return ListTile(
            title: Text(date),
            subtitle: Text('Hadir: ${record['hadir']}, Tidak Hadir: ${record['tidak hadir']}',
            ),
          );
        },
      ),
    );
  }
}