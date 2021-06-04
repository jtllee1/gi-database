const filter = () => {
  const characters = document.querySelectorAll(".character-card");
  const elements = document.querySelectorAll(".element");
  const rarities = document.querySelectorAll(".rarity-tag");

  elements.forEach(element => {
    element.addEventListener('click', () => {
      const selectedRarity = document.querySelector(".selected-r");

      if (!element.classList.contains("selected")) {
        elements.forEach(element => {
          element.classList.remove("selected");
        });
      };

      element.classList.toggle("selected");

      if (selectedRarity) {
        if (element.classList.contains("selected")) {
          characters.forEach(character => {
            if (character.classList.contains(element.src) && character.classList.contains(selectedRarity.classList[0])) {
              character.classList.remove("invisible");
            }
            else {
              character.classList.add("invisible");
            };
          });
        }
        else {
          characters.forEach(character => {
            if (character.classList.contains(selectedRarity.classList[0])) {
              character.classList.remove("invisible");
            };
          });
        };
      }
      else {
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
      };
    });
  });

  rarities.forEach(rarity => {
    rarity.addEventListener('click', () => {
      const selectedElement = document.querySelector(".selected");

      if (!rarity.classList.contains("selected-r")) {
        rarities.forEach(rarity => {
          rarity.classList.remove("selected-r");
        });
      };

      rarity.classList.toggle("selected-r")

      characters.forEach(character => {
        if (selectedElement) {
          if (rarity.classList.contains("selected-r")) {
            if (character.classList.contains(rarity.classList[0]) && character.classList.contains(selectedElement.src)) {
              character.classList.remove("invisible");
            }
            else {
              character.classList.add("invisible");
            };
          }
          else {
            characters.forEach(character => {
              if (character.classList.contains(selectedElement.src)) {
                character.classList.remove("invisible");
              };
            });
          };
        }
        else {
          if (rarity.classList.contains("selected-r")) {
            if (character.classList.contains(rarity.classList[0])) {
              character.classList.remove("invisible");
            }
            else {
              character.classList.add("invisible");
            };
          }
          else {
            characters.forEach(character => {
              character.classList.remove("invisible");
            });
          };
        };
      });
    });
  });
};

export { filter };
