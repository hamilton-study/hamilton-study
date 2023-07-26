// 전역클래스
class TestPublic{
  String data = "public";


  void getData(){
    print(_TestPrivate().data);
  }

  String gata(){

    return "qwe";
  }

}

// 지역클래스
class _TestPrivate{
  String data = "private";

}

