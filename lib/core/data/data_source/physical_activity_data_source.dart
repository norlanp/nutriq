import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';

class PhysicalActivityDataSource {
  List<PhysicalActivityEntity> getPhysicalActivityList() => [
        mapPhysicalActivityToEntity(
            "01015", "bicycling", "general", 7.5, [], "bicycling"),
        mapPhysicalActivityToEntity(
            "01009", "bicycling, mountain", "general", 8.5, [], "bicycling"),
        mapPhysicalActivityToEntity(
            "01070", "unicycling", "general", 5.0, [], "bicycling"),
        mapPhysicalActivityToEntity("02010", "bicycling, stationary", "general",
            7.5, [], "conditioningExercise"),
        mapPhysicalActivityToEntity(
            "02030",
            "calisthenics",
            "light or moderate effort, general (e.g., back exercises)",
            3.5,
            [],
            "conditioningExercise"),
        mapPhysicalActivityToEntity(
            "02050",
            "resistance training",
            "weight lifting, free weight, nautilus or universal",
            6.0,
            [],
            "conditioningExercise"),
        mapPhysicalActivityToEntity("02068", "rope skipping", "general", 12.3,
            [], "conditioningExercise"),
        mapPhysicalActivityToEntity(
            "02120",
            "water exercise",
            "water aerobics, water calisthenics",
            5.3,
            [],
            "conditioningExercise"),
        mapPhysicalActivityToEntity(
            "03015", "aerobic", "general", 7.3, [], "dancing"),
        mapPhysicalActivityToEntity(
            "12020", "jogging", "general", 7.0, [], "running"),
        mapPhysicalActivityToEntity(
            "12150", "running", "general", 8.0, [], "running"),
        mapPhysicalActivityToEntity(
            "15010", "archery", "non-hunting", 4.3, [], "sport"),
        mapPhysicalActivityToEntity("15030", "badminton",
            "social singles and doubles, general", 5.5, [], "sport"),
        mapPhysicalActivityToEntity(
            "15055", "basketball", "general", 6.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15080", "billiards", "general", 2.5, [], "sport"),
        mapPhysicalActivityToEntity(
            "15090", "bowling", "general", 3.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15100", "boxing", "in ring, general", 12.8, [], "sport"),
        mapPhysicalActivityToEntity(
            "15110", "boxing", "punching bag", 5.5, [], "sport"),
        mapPhysicalActivityToEntity(
            "15130", "broomball", "general", 7.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15135",
            "children's games",
            "(e.g., hopscotch, 4-square, dodgeball, playground apparatus, t-ball, tetherball, marbles, arcade games), moderate effort",
            5.8,
            [],
            "sport"),
        mapPhysicalActivityToEntity("15138", "cheerleading",
            "gymnastic moves, competitive", 6.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15150", "cricket", "batting, bowling, fielding", 4.8, [], "sport"),
        mapPhysicalActivityToEntity(
            "15160", "croquet", "general", 3.3, [], "sport"),
        mapPhysicalActivityToEntity(
            "15170", "curling", "general", 4.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15180", "darts", "wall or lawn", 2.5, [], "sport"),
        mapPhysicalActivityToEntity(
            "15192", "auto racing", "open wheel", 8.5, [], "sport"),
        mapPhysicalActivityToEntity(
            "15200", "fencing", "general", 6.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15230", "football", "touch, flag, general", 8.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15235", "football or baseball", "playing catch", 2.5, [], "sport"),
        mapPhysicalActivityToEntity(
            "15240", "frisbee playing", "general", 3.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15255", "golf", "general", 4.8, [], "sport"),
        mapPhysicalActivityToEntity(
            "15300", "gymnastics", "general", 3.8, [], "sport"),
        mapPhysicalActivityToEntity(
            "15310", "hacky sack", "general", 4.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15320", "handball", "general", 12.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15340", "hang gliding", "general", 3.5, [], "sport"),
        mapPhysicalActivityToEntity(
            "15350", "hockey, field", "general", 7.8, [], "sport"),
        mapPhysicalActivityToEntity(
            "15360", "ice hockey", "general", 8.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15370", "horseback riding", "general", 5.5, [], "sport"),
        mapPhysicalActivityToEntity(
            "15420", "jai alai", "general", 12.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15425",
            "martial arts",
            "different types, slower pace, novice performers, practice",
            5.3,
            [],
            "sport"),
        mapPhysicalActivityToEntity(
            "15430",
            "martial arts",
            "different types, moderate pace (e.g., judo, jujitsu, karate, kick boxing, tae kwan do, tai-bo, Muay Thai boxing)",
            10.3,
            [],
            "sport"),
        mapPhysicalActivityToEntity(
            "15440", "juggling", "general", 4.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15460", "lacrosse", "general", 8.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15465", "lawn bowling", "bocce ball, outdoor", 3.3, [], "sport"),
        mapPhysicalActivityToEntity(
            "15470",
            "moto-cross",
            "off-road motor sports, all-terrain vehicle, general",
            4.0,
            [],
            "sport"),
        mapPhysicalActivityToEntity(
            "15480", "orienteering", "general", 9.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15500", "paddleball", "casual, general", 6.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15510", "polo", "on horseback", 8.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15530", "racquetball", "general", 7.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15533", "climbing", "rock or mountain climbing", 8.0, [], "sport"),
        mapPhysicalActivityToEntity("15544", "rodeo sports",
            "general, moderate effort", 5.5, [], "sport"),
        mapPhysicalActivityToEntity(
            "15551",
            "rope jumping",
            "moderate pace, 100-120 skips/min, general, 2 foot skip, plain bounce",
            11.8,
            [],
            "sport"),
        mapPhysicalActivityToEntity(
            "15560", "rugby", "union, team, competitive", 8.3, [], "sport"),
        mapPhysicalActivityToEntity(
            "15562", "rugby", "touch, non-competitive", 6.3, [], "sport"),
        mapPhysicalActivityToEntity(
            "15570", "shuffleboard", "general", 3.0, [], "sport"),
        mapPhysicalActivityToEntity("15580", "skateboarding",
            "general, moderate effort", 5.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15590", "skating", "roller", 7.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15592",
            "rollerblading",
            "in-line skating, 14.4 km/h (9.0 mph), recreational pace",
            7.5,
            [],
            "sport"),
        mapPhysicalActivityToEntity("15600", "skydiving",
            "skydiving, base jumping, bungee jumping", 3.5, [], "sport"),
        mapPhysicalActivityToEntity(
            "15610", "soccer", "casual, general", 7.0, [], "sport"),
        mapPhysicalActivityToEntity("15620", "softball / baseball",
            "fast or slow pitch, general", 5.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15652", "squash", "general", 7.3, [], "sport"),
        mapPhysicalActivityToEntity("15660", "table tennis",
            "table tennis, ping pong", 4.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15670", "tai chi, qi gong", "general", 3.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15675", "tennis", "general", 7.3, [], "sport"),
        mapPhysicalActivityToEntity(
            "15700", "trampoline", "recreational", 3.5, [], "sport"),
        mapPhysicalActivityToEntity("15710", "volleyball",
            "non-competitive, 6 - 9 member team, general", 4.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15730", "wrestling", "general", 6.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15731", "wallyball", "general", 7.0, [], "sport"),
        mapPhysicalActivityToEntity("15732", "track and field",
            "(e.g. shot, discus, hammer throw)", 4.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "15733",
            "track and field",
            "(e.g. high jump, long jump, triple jump, javelin, pole vault)",
            6.0,
            [],
            "sport"),
        mapPhysicalActivityToEntity("15734", "track and field",
            "(e.g. steeplechase, hurdles)", 10.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "17010", "backpacking", "general", 7.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "17080", "hiking", "cross country", 6.0, [], "sport"),
        mapPhysicalActivityToEntity(
            "17160", "walking", "for pleasure", 3.5, [], "sport"),
        mapPhysicalActivityToEntity(
            "17165", "walking the dog", "general", 3.0, [], "sport"),
        mapPhysicalActivityToEntity("18070", "canoeing",
            "rowing, for pleasure, general", 3.5, [], "waterActivities"),
        mapPhysicalActivityToEntity("18090", "diving",
            "springboard or platform", 3.0, [], "waterActivities"),
        mapPhysicalActivityToEntity(
            "18100", "kayaking", "moderate effort", 5.0, [], "waterActivities"),
        mapPhysicalActivityToEntity(
            "18110", "paddle boat", "general", 4.0, [], "waterActivities"),
        mapPhysicalActivityToEntity(
            "18120",
            "sailing",
            "boat and board sailing, windsurfing, ice sailing, general",
            3.0,
            [],
            "waterActivities"),
        mapPhysicalActivityToEntity("18150", "water skiing",
            "water or wakeboarding", 6.0, [], "waterActivities"),
        mapPhysicalActivityToEntity("18200", "diving",
            "skindiving, scuba diving, general", 7.0, [], "waterActivities"),
        mapPhysicalActivityToEntity(
            "18210", "snorkeling", "general", 5.0, [], "waterActivities"),
        mapPhysicalActivityToEntity("18220", "surfing",
            "body or board, general", 3.0, [], "waterActivities"),
        mapPhysicalActivityToEntity(
            "18225", "paddle boarding", "standing", 6.0, [], "waterActivities"),
        mapPhysicalActivityToEntity(
            "18350",
            "swimming",
            "treading water, moderate effort, general",
            3.5,
            [],
            "waterActivities"),
        mapPhysicalActivityToEntity("18355", "water aerobics",
            "water aerobics, water calisthenics", 5.5, [], "waterActivities"),
        mapPhysicalActivityToEntity(
            "18360", "water polo", "general", 10.0, [], "waterActivities"),
        mapPhysicalActivityToEntity(
            "19030", "ice skating", "general", 7.0, [], "winterActivities"),
        mapPhysicalActivityToEntity(
            "19075", "skiing", "general", 7.0, [], "winterActivities"),
        mapPhysicalActivityToEntity("19252", "snow shoveling",
            "by hand, moderate effort", 5.3, [], "winterActivities"),
      ];
}
