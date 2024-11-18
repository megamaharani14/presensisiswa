import 'package:flutter/material.dart';
import 'package:presensisiswa/provider/attendance_provider.dart';

class HistoryScreen extends StatelessWidget{
  const HistoryScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final attendanceHistory = Provider.of<AttendanceProvider>(context).attendanceHistory;

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: attendanceHistory.length,
        itemBuilder: (context, index){
          final record = attendanceHistory[index];
          return ListTile(
            title: Text('${record.date.toLocal()}'),
            subtitle: Text(
              'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}'),
            
          );
          
        },
      ),
    );
  }
}