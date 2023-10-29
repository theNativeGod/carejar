import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:carejar/models/category.dart';
import 'package:carejar/views/utils/export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(this.id, {super.key});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color(0xff38adb5),
            Theme.of(context).colorScheme.primary,
          ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                    child: BabylonJSViewer(src: 'assets/doctor_mario.glb'),
                  ),
                  Positioned(
                    left: 8,
                    child: SafeArea(
                      child: InkWell(
                        onTap: () => pop(context),
                        child: const Icon(Icons.keyboard_arrow_left),
                      ),
                    ),
                  ),
                ],
              ),
              const Space(),
              Text('Data fetched from Firebase',
                  style: Theme.of(context).textTheme.headlineMedium),
              const Space(),
              StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('categories')
                      .doc(id)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Category cat = Category.fromJson(
                          snapshot.data!.data() as Map<String, dynamic>);
                      return Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  const Color(0xff38adb5),
                                  Theme.of(context).colorScheme.primary,
                                ]),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(-1, -1),
                                    blurRadius: .5,
                                    spreadRadius: 1,
                                    color: Colors.white12,
                                  ),
                                  BoxShadow(
                                    offset: Offset(1, 1),
                                    blurRadius: .5,
                                    spreadRadius: 1,
                                    color: Colors.black12,
                                  )
                                ],
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Category id: ${cat.id}'),
                                  Text('Category name: ${cat.name}'),
                                  Text(
                                      'Category Description: ${cat.description}'),
                                ],
                              ),
                            ),
                            const Space(),
                            Card(
                              color: const Color(0xff63d09d),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                width: double.infinity,
                                // padding: EdgeInsets.all(8),
                                child: Column(children: [
                                  Text(
                                    cat.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                  const Space(),
                                  Text(
                                    textAlign: TextAlign.center,
                                    cat.description,
                                  )
                                ]),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              const Space(),
              Text(
                'Doctors available',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Space(),
              Center(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (ctx, i) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width - 16,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0xff38adb5),
                          Theme.of(context).colorScheme.primary,
                        ]),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-1, -1),
                            blurRadius: .5,
                            spreadRadius: 1,
                            color: Colors.white12,
                          ),
                          BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: .5,
                            spreadRadius: 1,
                            color: Colors.black12,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Text('Demo Name'),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Appointment: 10:00 AM'),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (ctx, i) => const SizedBox(
                    height: 16,
                  ),
                  itemCount: 5,
                ),
              ),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
