class Cast{
  List<Actor> actors = new List();
  Cast.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null)return;
    jsonList.forEach((item) {
      final actor = Actor.fromJsonMap(item);
      actors.add(actor);
    });
  }
}


class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.character,
    this.castId,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json){
    character   = json['character'];
    castId      = json['cast_id'];
    creditId    = json['credit_id'];
    gender      = json['gender'];
    id          = json['id'];
    name        = json['name'];
    order       = json['order'];
    profilePath = json['profile_path'];
  }

  getCastPhoto(){
    if(profilePath == null){
      return 'https://blog.stylingandroid.com/wp-content/themes/lontano-pro/images/no-image-slide.png';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }


}

enum Department { PRODUCTION, SOUND, EDITING, ART, CREW, DIRECTING, COSTUME_MAKE_UP, WRITING, CAMERA, VISUAL_EFFECTS, LIGHTING }
