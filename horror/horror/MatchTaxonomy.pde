public static class MatchTaxonomy {/*
"mr-hyde";
 "giant";
 "michael-myers";
 "living-dead";
 "ghost";
 "dinosaur";
 "bigfoot";
 */
  public static String matchName(String matchString) {
   if (matchString=="Extraterrestrials")
      return "";
    if (matchString=="Predator")
       return "";
    if (matchString=="Living Dead")
      return "";
    if (matchString=="Mummy")
      return "mummy";
    if (matchString=="Zombies")
      return "zombie";
    if (matchString=="Frankenstein")
      return "frankenstein";
    if (matchString=="Humanoids")
      return "";
        if (matchString=="Witches and\nWizards")
        return "witch-wizards";
    if (matchString=="Swamp\nCreature")
      return "swamp";
    if (matchString=="The Invisible\nMan")
      return "invisible-man";
    if (matchString=="Freddy Krueger")
      return "freddy-krueger";
    if (matchString=="Jason")
      return "jason";
    if (matchString=="supernatural Forces")
      return "supernatural";
    if (matchString=="Demons")
      return "demon";
    if (matchString=="Possessed Objects")
      return "possessed";
    if (matchString=="Plants and\nAnimals")
      return "";
    if (matchString=="Snakes")
        return "snake";
    if (matchString=="Prehistoric\nCreatures")
      return "";
    if (matchString=="Aquatic\nCreatures")
        return "";
    if (matchString=="Sharks")
          return "shark";
    if (matchString=="Mutants")
      return "mutants";
    if (matchString=="Werewolves")
      return "";
    if (matchString=="Mutated Creatures")
        return "muted-creatures";
    if (matchString=="vampires")
      return "vampire";
    if (matchString=="Dracula")
      return "dracula";
    if (matchString=="Female Vampires")
      return "female_vampire";
    if (matchString=="Godzilla")
      return "godzilla"; 
    return "";
  }

}
