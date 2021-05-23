const filter = () => {
  const characters = document.querySelectorAll(".character-card");
  const elements = document.querySelectorAll(".element");

  elements.forEach(element => {
    element.addEventListener('click', () => {
      element.classList.toggle("selected");

      if (element.classList.contains("selected")) {
        characters.forEach(character => {
          if (character.classList.contains(element.src)) {
            character.classList.remove("invisible");
          }
          else {
            character.classList.add("invisible");
          };
        });
      }
      else {
        characters.forEach(character => {
          character.classList.remove("invisible");
        });
      };
    });
  });
};

export { filter };
