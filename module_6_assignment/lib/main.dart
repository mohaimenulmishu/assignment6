import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  final List<String> imageUrls = [
    'https://placekitten.com/200/200',
    'https://placekitten.com/200/200',
    'https://placekitten.com/200/200',
    'https://placekitten.com/200/200',
    'https://placekitten.com/200/200',
    'https://placekitten.com/200/200',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Photo Gallery'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to our Photo Gallery!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search for photos',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.8, // Adjust as needed
                ),
                itemCount: imageUrls.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Image ${index + 1} Clicked!'),
                              SizedBox(height: 8.0),
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Photos Uploaded Successfully!'),
                                    ),
                                  );
                                },
                                child: Text('Upload Photos'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          Image.network(
                            imageUrls[index],
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Photo ${index + 1}'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16.0),
              ListTile(
                leading: Image.network(
                  'https://placekitten.com/200/200',
                  height: 48,
                  width: 48,
                ),
                title: Text('Photo 1'),
                subtitle: Text('Description for photo 1 '),
              ),
              ListTile(
                leading: Image.network(
                  'https://placekitten.com/200/200',
                  height: 48,
                  width: 48,
                ),
                title: Text(' Photo 2'),
                subtitle: Text('Description for photo 2'),
              ),
              ListTile(
                leading: Image.network(
                  'https://placekitten.com/200/200',
                  height: 48,
                  width: 48,
                ),
                title: Text(' Photo 3'),
                subtitle: Text('Description for photo 3'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Photos Uploaded Successfully!'),
                    ),
                  );
                },
                child: Text('Upload Photos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
