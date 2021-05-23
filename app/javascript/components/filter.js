const filter = () => {
  const characters = document.querySelectorAll(".character-card");
  const elements = document.querySelectorAll(".element");

  elements.forEach(element => {
    element.addEventListener('click', () => {
      characters.forEach(character => {
        if (character.classList.contains(element.src)) {
          character.classList.remove("invisible");
        }
        else {
          character.classList.add("invisible");
        };
      });
    });
  });
};

export { filter };
