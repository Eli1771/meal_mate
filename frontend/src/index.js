const BASE_URL = "http://localhost:3000";
const RECIPES_URL = `${BASE_URL}/recipes`;

$(document).ready(function() {
  generateMealButtons();
  //fetchCurrentPlan(); <-grabs, if any, the current meal plan and displays todays plan
  loadEventListeners();
});



//                        --------LOAD PAGE ELEMENTS-------



function generateMealButtons() {
  let meals = ['Br', 'Lu', 'Di'];
  let buttons = document.querySelector('#meal-buttons-map');

  for (let i = 0; i < meals.length; i++) {
	let meal =  meals[i];
    buttons.innerHTML += `<div>${meal}</div>`;
    for (let j = 0; j < 7; j++) {
      let customId = `checkbox-${i}-${j}`;
      buttons.innerHTML +=
        `<input type="checkbox" class="meal-button-checkbox" id="${customId}">
        <label for="${customId}"></label>`;
        //above are 2 nested divs to be used to display a retro button with some depth
    }
  }
}

//                        -------LOAD EVENT LISTENERS-------



function loadEventListeners() {
  console.log('hello world');
  let generatePlanButton = document.querySelector('#oven button');
  generatePlanButton.addEventListener('click', generatePlan);
}



//                        -------ALL OTHER PROCESSES---------




function generatePlan() {
  console.log('I\'m generating!');
  //first grab buttons from array of days
  let requiredMeals = getMealDays();
  //need some way to convert boolean values into required Date objects for each meal
  getRecipe();
}

function getMealDays() {
  //results array represents seven days of 3 meals
  let r = [[],[],[],[],[],[],[]];

  let buttonMap = document.querySelectorAll('#meal-buttons-map input');
  //for each of the 7 days
  for (let day = 0; day < 7; day++) {
    //for each of the 3 meals
    for (let meal = 0; meal < 3; meal++) {
      let position = day + (meal * 7);
      r[day].push(buttonMap[position].checked);
    }
  }

  return r;
}

function getRecipe(meal) {
  fetch(RECIPES_URL).then(resp => resp.json()).then(json => console.log(json));
}
