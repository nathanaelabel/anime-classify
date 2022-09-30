part of 'page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool pressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime Details'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.white30, Colors.pinkAccent])),
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Flexible(
            flex: 5,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                        'assets/images/classroomelitebackground.jpg',
                        fit: BoxFit.cover),
                  ),
                  Align(
                    alignment: const Alignment(0.9, -0.8),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          // pressed = !pressed;
                          if (!pressed) {
                            ScaffoldMessenger.of(this.context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "This anime has been removed from your favorite!"),
                              duration: Duration(milliseconds: 1500),
                            ));
                            pressed = !pressed;
                          } else {
                            ScaffoldMessenger.of(this.context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "This anime has been added to your favorite!"),
                              duration: Duration(milliseconds: 1500),
                            ));
                            pressed = !pressed;
                          }
                        });
                      },
                      icon: Icon(Icons.favorite,
                          size: 25,
                          color: (pressed == false)
                              ? Colors.redAccent
                              : Colors.grey),
                      label: const Text(''),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: Colors.white,
                          padding: const EdgeInsets.all(10),
                          minimumSize: const Size.fromRadius(25),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23))),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(1),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(40),
                          child: Image.asset(
                              'assets/images/classroomelitesquare1.jpg',
                              fit: BoxFit.cover),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(1),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(40),
                          child: Image.asset(
                              'assets/images/classroomelitesquare2.jpg',
                              fit: BoxFit.cover),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(1),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(40),
                          child: Image.asset(
                              'assets/images/classroomelitesquare3.jpg',
                              fit: BoxFit.cover),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(1),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(40),
                          child: Image.asset(
                              'assets/images/classroomelitesquare4.jpg',
                              fit: BoxFit.cover),
                        )),
                  ),
                ],
              )),
          Flexible(
            flex: 6,
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: const <Widget>[
                Center(
                    child: Text(
                  'Classroom of the Elite',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.7,
                      wordSpacing: 2.0),
                )),
                Center(
                    child: Text(
                  'Classroom of the Elite is a Japanese light novel series, written by Shōgo Kinugasa and illustrated by Shunsaku Tomose published from May 2015 to September 2019 under Media Factory MF Bunko J imprint. A sequel light novel series called Classroom of the Elite: Year 2 began publishing in January 2020. A manga adaptation by Yuyu Ichino began its serialization in Media Factory Monthly Comic Alive on January 27, 2016. A manga adaptation of the sequel light novel series illustrated by Shia Sasane began serialization in the same magazine on December 25, 2021. An anime television series adaptation by Lerche aired with the first season in 2017. A second season aired from July to September 2022, and a third season will premiere in 2023.\n In the distant future, the Japanese government has established the Tokyo Metropolitan Advanced Nurturing School, dedicated to instruct and foster the generation of people that will support the country in the future. The students are given a high degree of freedom in order to closely mimic real life. The story follows the perspective of Kiyotaka Ayanokōji, a quiet and unassuming boy, who is not good at making friends and would rather keep his distance, but possesses unrivaled intelligence. He is a student of Class-D, which is where the school dumps its inferior students. After meeting Suzune Horikita and Kikyō Kushida, two other students in his class, the situation begins to change and he starts to get involved in many affairs, and his thought of an ideal normal high school life begins to get scattered.\n Kiyotaka Ayanokouji is a student of Class D, where the school dumps its worst. There he meets the unsociable Suzune Horikita, who believes she was placed in Class D by mistake and desires to climb all the way to Class A, and the seemingly amicable class idol Kikyou Kushida, whose aim is to make as many friends as possible. While class membership is permanent, class rankings are not; students in lower ranked classes can rise in rankings if they score better than those in the top ones. Additionally, in Class D, there are no bars on what methods can be used to get ahead. In this cutthroat school, can they prevail against the odds and reach the top?',
                  // Mepet banget ya ini agak kurang enak dilihat.
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1.5,
                      letterSpacing: 0.5),
                )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
