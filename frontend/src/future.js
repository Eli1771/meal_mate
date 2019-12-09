// INSERT INTO RENDER DAY PLAN BELOW
// ``mealContainer.appendChild(ingredientsList);``
//    To render star containers into day plan field

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
//    Generates stars

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





// MULTIPLE TEMPORARY FUNCTIONS. INSERT ANYWHERE. WILL NEED
// MINOR REFACTORING TO WORK WITH CLASSES
//    Used to make a plan for the current day. For testing the
//    render-day-plan functions

function makeTemporaryMeal() {
  let objData = {
    start_date: 'Fake Date'
  }
  let configObj = makeConfigObj(objData);
  fetch(`${BASE_URL}/week_plans`, configObj)
    .then(resp => resp.json()).then(json => mameTemporaryDp(json));
}

function mameTemporaryDp(wpData) {
  let wpId = wpData.id

  const d = new Date();
  const day = d.getDay();
  const date = moment().format('MMM DD');

  let objData = {
    day_id: day,
    date: date,
    week_plan_id: wpId
  };
  //make the configuration object w/ object data
  let configObj = makeConfigObj(objData);
  //actual fetch posts to populate db
  fetch(`${BASE_URL}/day_plans`, configObj)
    .then(resp => resp.json()).then(json => associateTempMeal(json));
}

function associateTempMeal(dpData) {
  let rand3 = function() {
    return randomInRange(3);
  }
  let objData = {
    recipe_id: rand3(),
    day_plan_id: dpData.id
  }
  let configObj = makeConfigObj(objData);
  fetch(`${BASE_URL}/recipe_plans`, configObj)
    .then(resp => resp.json()).then(json => console.log(json));
}




// INSERT ANYWHERE. NEEDS REFACTORING
//    To delete future plans

async function discardPlans() {
  if (confirm('Discard your current plan?')) {
    this.innerHTML = 'Resetting...';
    console.log('Deleting all future plans...');

    let d = new Date;
    let dateString = moment().add(7 - d.getDay(), 'days').format('MMM DD');
    let dateSlug = slugDate(dateString);
    fetch(`http://localhost:3000/week_plans/${dateSlug}`, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      }
    })
      .then(resp => resp.json()).then(json => console.log(json));

    closeOven();
  }
}



// INSERT INTO LOAD EVENT LISTENERS ANYWHERE
//    Adds listener to start-over button on open oven door and
//    listener to radio buttons to select plan type

let ovenDialButtons = document.querySelectorAll('#oven-dials label');
for (let j = 0; j < ovenDialButtons.length; j++) {
  ovenDialButtons[j].addEventListener('click', displayPlanType);
}

let startOverButton = document.querySelector('#oven button#oven-door-opened');
startOverButton.addEventListener('click', discardPlans);
