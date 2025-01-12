import 'package:flutter/material.dart';
import 'package:flutter_drift/db/app_db.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Bz_fileData>>(
        future: _db.getBz_file(),
        builder: (context, snapshot) {
          final List<Bz_fileData>? files = snapshot.data;

          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (files != null) {
            return ListView.builder(
                itemCount: files.length,
                itemBuilder: (context, index) {
                  final file = files[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/edit_file',
                          arguments: file.id);
                    },
                    child: Card(
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.blue,
                          style: BorderStyle.solid,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(file.id.toString()),
                            Text(
                              file.filename.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              file.author.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              file.dateofCreate.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              file.fill.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return const Text('No data found!');
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add_file');
        },
        icon: Icon(
          Icons.add,
        ),
        label: Text('add file'),
      ),
    );
  }
}
