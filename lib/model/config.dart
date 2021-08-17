/*
   * Config
   *
   * type = URL , config1 = main 주소를 나타낸다.
   * type = ADV,  config1 = 이미지, config2 = 이미지 클릭시 보여줄 화면 URL
   * type = VER,  config1 = min version, config2 = latest version
   *
   */
class Config {
  final String type, config1,config2;

  Config({
    this.type,
    this.config1,
    this.config2});

  Map toJson() => {
    'type': type,
    'config1': config1,
    'config2': config2,
  };

  factory Config.fromJson(Map<String, dynamic> parsedJson){
    return Config(
        type:parsedJson['type'],
        config1:parsedJson['config1'],
        config2:parsedJson['config2']
    );
  }
}

List<Config> configs;
String rootURL; //main root url

