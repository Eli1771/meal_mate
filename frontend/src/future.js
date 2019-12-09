// INSERT INTO RENDER DAY PLAN BELOW
//  ``mealContainer.appendChild(ingredientsList);``
// To render star containers into day plan field

//5. create ratings container
let ratingsContainer = document.createElement('div');
ratingsContainer.classList.add('ratings-container');
mealContainer.appendChild(ratingsContainer);
//6. create ratings zones (no stars)
for (let k = 0; k < ratingTitles.length; k++) {
  let ratingZone = document.createElement('div');
  ratingZone.classList.add('rating');
  ratingsContainer.appendChild(ratingZone);
  let ratingHeader = document.createElement('p');
  ratingHeader.innerText = ratingTitles[k];
  ratingZone.appendChild(ratingHeader);
  let stars = document.createElement('div');
  stars.classList.add('stars');
  ratingZone.appendChild(stars);
}

// INSERT ANYWHERE
// BE SURE TO CALL THIS FUNCTION TOWARDS THE END OF RENDER DAY PLAN

function generateStars() {
  console.log('generating stars...');
  let meals = document.querySelectorAll('.single-meal');
  let mealNames = document.querySelectorAll('#all-meals h5.meal-name');
  let ratingTitles = ['cost', 'complexity', 'nutrition', 'taste'];
  let img = '<img src="./images/star-symbol.png" class="star">';
  let closingLabel = '</label>'

  for (let i = 0; i < meals.length; i++) {
    let meal = meals[i];
    let mealName = mealNames[i].innerHTML.toLowerCase();
    let ratingContainers = meal.querySelectorAll('.stars');
    console.log('all rating containers:');
    console.log(ratingContainers);
    let id = mealName;

    for (let j = 0; j < ratingContainers.length; j++) {
      let container = ratingContainers[j];
      id += `-${ratingTitles[j]}`;
      let name = `${id}-container`;

      for (let k = 4; k >= 0; k--) {
        id += `-${k}`;
        let input = `<input type="radio" id="${id}" name="${name}">`;
        let openingLabel = `<label for="${id}" class="star">`;
        container.innerHTML += (input + openingLabel + img + closingLabel);
        id = `${mealName}-${ratingTitles[j]}`;
      }
      id = mealName;
    }
  }
}
