import "dart:io";
import "package:flutter/material.dart";
import "package:share_plus/share_plus.dart";
import "package:tictactoe/mycolors.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> storage = List.filled(9, "");
  String x = "X", o = "O";
  String state = "Game is Running";
  int cnt = 0, winStat = 0;

  void check() {
    if (storage[0] == x && storage[3] == x && storage[6] == x) {
      storage = List.filled(9, "");
      storage[0] = storage[3] = storage[6] = x;
      state = "X is Winner";
      winStat = 1;
    } else if (storage[1] == x && storage[4] == x && storage[7] == x) {
      storage = List.filled(9, "");
      storage[1] = storage[4] = storage[7] = x;
      state = "X is Winner";
      winStat = 1;
    } else if (storage[2] == x && storage[5] == x && storage[8] == x) {
      storage = List.filled(9, "");
      storage[2] = storage[5] = storage[8] = x;
      state = "X is Winner";
      winStat = 1;
    } else if (storage[0] == x && storage[1] == x && storage[2] == x) {
      storage = List.filled(9, "");
      storage[0] = storage[1] = storage[2] = x;
      state = "X is Winner";
      winStat = 1;
    } else if (storage[3] == x && storage[4] == x && storage[5] == x) {
      storage = List.filled(9, "");
      storage[3] = storage[4] = storage[5] = x;
      state = "X is Winner";
      winStat = 1;
    } else if (storage[6] == x && storage[7] == x && storage[8] == x) {
      storage = List.filled(9, "");
      storage[6] = storage[7] = storage[8] = x;
      state = "X is Winner";
      winStat = 1;
    } else if (storage[0] == x && storage[4] == x && storage[8] == x) {
      storage = List.filled(9, "");
      storage[0] = storage[4] = storage[8] = x;
      state = "X is Winner";
      winStat = 1;
    } else if (storage[2] == x && storage[4] == x && storage[6] == x) {
      storage = List.filled(9, "");
      storage[2] = storage[4] = storage[6] = x;
      state = "X is Winner";
      winStat = 1;
    } else if (storage[0] == o && storage[3] == o && storage[6] == o) {
      storage = List.filled(9, "");
      storage[0] = storage[3] = storage[6] = o;
      state = "O is Winner";
      winStat = 1;
    } else if (storage[1] == o && storage[4] == o && storage[7] == o) {
      storage = List.filled(9, "");
      storage[1] = storage[4] = storage[7] = o;
      state = "O is Winner";
      winStat = 1;
    } else if (storage[2] == o && storage[5] == o && storage[8] == o) {
      storage = List.filled(9, "");
      storage[2] = storage[5] = storage[8] = o;
      state = "O is Winner";
      winStat = 1;
    } else if (storage[0] == o && storage[1] == o && storage[2] == o) {
      storage = List.filled(9, "");
      storage[0] = storage[1] = storage[2] = o;
      state = "O is Winner";
      winStat = 1;
    } else if (storage[3] == o && storage[4] == o && storage[5] == o) {
      storage = List.filled(9, "");
      storage[3] = storage[4] = storage[5] = o;
      state = "O is Winner";
      winStat = 1;
    } else if (storage[6] == o && storage[7] == o && storage[8] == o) {
      storage = List.filled(9, "");
      storage[6] = storage[7] = storage[8] = o;
      state = "O is Winner";
      winStat = 1;
    } else if (storage[0] == o && storage[4] == o && storage[8] == o) {
      storage = List.filled(9, "");
      storage[0] = storage[4] = storage[8] = o;
      state = "O is Winner";
      winStat = 1;
    } else if (storage[2] == o && storage[4] == o && storage[6] == o) {
      storage = List.filled(9, "");
      storage[2] = storage[4] = storage[6] = o;
      state = "O is Winner";
      winStat = 1;
    } else if (cnt == 9) {
      state = "Game is Tie";
    }
  }

  void boxEmpty() {
    storage = List.filled(9, "");
    cnt = 0;
    state = "Game is Running";
    winStat = 0;
  }

  Widget box(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          if (storage[index] == "" && winStat == 0) {
            if (cnt % 2 == 0) {
              storage[index] = x;
            } else {
              storage[index] = o;
            }
            cnt++;
          }
          setState(() {
            check();
          });
        },
        child: Container(
            height: (MediaQuery.of(context).size.width * 27.33) / 100,
            width: (MediaQuery.of(context).size.width * 27.33) / 100,
            decoration: BoxDecoration(
              color: MyColors.greenAccent,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF112128),
                  offset: Offset(0, 10),
                  // blurRadius: 10.0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(storage[index],
                style: TextStyle(
                    color: storage[index] == x ? MyColors.x : MyColors.y,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w600))),
      ),
    );
  }

  Future<bool> goBack() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyColors.green,
          title: const Text("Exit an App?"),
          titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontFamily: "Manrope",
              fontWeight: FontWeight.bold),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("NO")),
            TextButton(onPressed: () => exit(0), child: const Text("YES")),
          ],
        );
      },
    );

    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: goBack,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.green,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "img/logo.png",
                      height: 65.0,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13.0,
                        vertical: 17.5,
                      ),
                      decoration: BoxDecoration(
                        color: MyColors.greenAccent,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFF0E202B),
                            offset: Offset(0, 10),
                            // blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Text(
                        state,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: "Manrope",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          boxEmpty();
                          setState(() {});
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.5, vertical: 15.5),
                            decoration: BoxDecoration(
                              color: MyColors.grey,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF6D8897),
                                  offset: Offset(0, 10),
                                  // blurRadius: 10,
                                ),
                              ],
                            ),
                            child: const Icon(Icons.refresh_outlined,
                                color: Colors.black, size: 25.0))),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [box(0), box(1), box(2)],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [box(3), box(4), box(5)],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [box(6), box(7), box(8)],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await Share.share(
                          "Hi I have downloaded TicTacToe app.\nit is best app for playing Game.\nyou should also try.\n\nhttps://play.google.com/store/apps/details?id=com.ghj.TicTacToe.tictactoe",
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shadowColor: Colors.red,
                          minimumSize: Size.zero,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                          ))),
                      child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                            size: 25.0,
                          )))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
