import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Hello Rafsan", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          const Text("Let's watch today", style: TextStyle(fontSize: 18, color: Colors.white70),)
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ClipOval(
                        child: Image.asset(
                          'images/profile.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover, // Ensures full coverage
                        ),
                      ),
                    )
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.white70,)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none
                    ),
                  ),
                  onTapOutside: (event){
                    FocusScope.of(context).unfocus();
                  },
                  onSubmitted: (event){},
                ),
                const SizedBox(height: 10),
                _heading("Category"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 5,
                    children: [
                      _categories("Action", context),
                      _categories("Anime", context),
                      _categories("Sci-fi", context),
                      _categories("Cartoon", context),
                      _categories("Hollywood", context),
                      _categories("Crime", context),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 150,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: PageController(viewportFraction: 0.9, initialPage: 1),
                    children: [
                      _posterImage("images/final.png"),
                      _posterImage("images/final.png"),
                      _posterImage("images/final.png"),
                      _posterImage("images/final.png"),
                    ],
                  ),
                ),
                _heading("Trending Movies"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _movieswithName("images/image_4.png", "Yes I Do", 120, 93),
                    _movieswithName("images/image_2.png", "Inside Out 2", 120, 93),
                    _movieswithName("images/image_3.png", "Babylon", 120, 93),
                  ],
                ),
                _heading("Continue Watching"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 5,
                    children: [
                      _movieswithName("images/image_9.jpg", "Wednesday | Season -1| Episode-3", 93, 161),
                      _movieswithName("images/image_10.png", "Emily in Paris | Season -1| Episode-1", 93, 161),
                    ],
                  ),
                ),
                _heading("Recommendation For You"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _movieswithName("images/image_5.png", "Double Love", 120, 93),
                    _movieswithName("images/image_6.png", "Sunita", 120, 93),
                    _movieswithName("images/image_8.png", "Polemon: detective Pikachu", 120, 93),
                  ],
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            boxShadow: [
            ],
            border: Border.all(color: Colors.black45, width: 2),
            borderRadius: BorderRadius.circular(30)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              backgroundColor: Colors.black,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              items: [
                _bnbButton(Icons.home),
                _bnbButton(Icons.tv),
                _bnbButton(Icons.download),
                _bnbButton(Icons.person),
              ],
            ),
          ),
        ),
      ),

    );
  }
  
  Widget _heading(String title){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        TextButton(
            onPressed: (){},
            child: Text("See More", style: TextStyle(fontSize: 18, color: Colors.white))
        )
      ],
    );
  }
  
  Widget _categories(String name, BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: const Color(0xFF1E1E2E),
      ),
      onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(name))
        );
      },
      child: Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
    );
  }

  Widget _posterImage(String path){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          path,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _movieswithName(String path, String name, double h, double w){
    return Column(
      spacing: 5,
      children: [
        Image(
          image: AssetImage(path),
          height: h,
          width: w,
          fit: BoxFit.cover,
        ),
        Text(name, style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)
      ],
    );
  }

  BottomNavigationBarItem _bnbButton(IconData icon){
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 30,),
      label: '',
    );
  }
}
