import 'package:flutter/material.dart';

class Slivers1 extends StatelessWidget {
  const Slivers1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 230,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Travel App", style: TextStyle(color: Colors.white)),
              background: Image.network(
                "https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=800&auto=format&fit=crop",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(child: Text("Popular Destinations")),
          SliverToBoxAdapter(
            child: Container(color: Colors.blue.shade100, height: 60,
             alignment: Alignment.center, child: Text("Explore Beautiful Places")),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 3,
              (context, index) {
                List<String> names = ["Bali, Indonesia", "Paris, France", "Swiss Alps"];
                List<String> images = [
                  "https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=500&auto=format&fit=crop",
                  "https://images.unsplash.com/photo-1499856871958-5b9627545d1a?w=500&auto=format&fit=crop",
                  "https://images.unsplash.com/photo-1521292270410-a8c4d716d518?w=500&auto=format&fit=crop",
                ];
                return ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(images[index])),
                  title: Text(names[index]),
                  subtitle: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(" 4.8 (2.5k views)"),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 6,
              (context, index) {
                return Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                  child: Image.network("https://images.unsplash.com/photo-1523906834658-6e24ef2386f9?w=500&auto=format&fit=crop", fit: BoxFit.cover),
                );
              },
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          )
        ],
      ),
    );
  }
}