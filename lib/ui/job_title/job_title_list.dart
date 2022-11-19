import 'package:flutter/material.dart';
import 'package:latihan_drift/local/database/app_db.dart';
import 'package:latihan_drift/local/entity/job_title_entity.dart';
import 'package:latihan_drift/ui/job_title/job_title_cu.dart';

class JobTitleList extends StatefulWidget {
  const JobTitleList({Key? key}) : super(key: key);

  @override
  State<JobTitleList> createState() => _JobTitleListState();
}

class _JobTitleListState extends State<JobTitleList> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List JobTitle'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => JobTitleCreateUpdate()));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<JobTitleData>>(
        future: _db.getJobTitles(),
        builder: (context, snapshot){
          final List<JobTitleData>? jobtiles = snapshot.data;
          if(snapshot.connectionState != ConnectionState.done){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(child: Text(snapshot.hasError.toString()),);
          }
          if(jobtiles != null){
            return ListView.builder(itemCount: jobtiles.length, itemBuilder: (context, index){
              final jobtitle = jobtiles[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ListTile(
                    title: Text(jobtitle.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(jobtitle.code),
                        Text(jobtitle.status)
                      ],
                    ),
                  ),
                ),
              );
            });
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
