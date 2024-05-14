enum Vocation {
  helldiver(
    title: "Hell Diver",
    description: "In the depths of an unforgiving universe, the Helldiver is a formidable and relentless force. Designed as a versatile combat spacecraft, the Helldiver excels in both offensive and defensive capabilities, making it an indispensable asset in any high-stakes interstellar conflict.",
    weapon: "Democratic weapon of destruction (gun)",
    ability: "Hell diving",
    image: "helldiver.jpg"
  ),
  corporate(
    title: "Corporate Enforcer",
    description: "Meet the corporate enforcer: the only guy who can audit your expense reports and break your kneecaps with the same spreadsheet.",
    weapon: "Paper Jammer",
    ability: "Audit your income",
    image: "corporate_enforcer.jpg"
  ),
  cowboy(
    title: "Cowboy Mien Tay",
    description: "Meet the Vietnamese cowboy: riding through the rice paddies on his trusty water buffalo, he's got a lasso in one hand and a bowl of pho in the other.",
    weapon: "Chop Stick and Lasso",
    ability: "Rev a Honda Wave with suppressor of",
    image: "cowboy.jpg"
  ),
  police(
    title: "Secret Polices",
    description: "Meet the secret police: they're the only folks who can make you disappear faster than last year's tax records.",
    weapon: "SECRET",
    ability: "Silence approach",
    image: "secret_police.jpg"
  );

  const Vocation({
    required this.title,
    required this.description,
    required this.image,
    required this.weapon,
    required this.ability,
  });

  final String title;
  final String description;
  final String image;
  final String weapon;
  final String ability;
}

