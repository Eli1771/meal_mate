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
    buttons.innerHTML += `<div>
      <label for="select-all-${meal}">All</label>
      <input type="checkbox" class="select-all" id="select-all-${meal}">
      </div>`;
  }
}

//                        -------LOAD EVENT LISTENERS-------



function loadEventListeners() {
  let generatePlanButton = document.querySelector('#oven button');
  generatePlanButton.addEventListener('click', generatePlan);

  let selectAllMealsButton = document.querySelector('#select-all-meals');
  selectAllMealsButton.addEventListener('click', selectAllMeals);

  let selectAllOfOneMealButtons = document.querySelectorAll('.select-all');
  for (let i = 0; i < selectAllOfOneMealButtons.length; i++) {
    selectAllOfOneMealButtons[i].addEventListener('click', selectAllOfOneMeal);
  }
}



//                        -------ALL OTHER PROCESSES---------




function generatePlan() {
  console.log('I\'m generating!');
  //first grab buttons from array of days
  let requiredMeals = getMealDays();
  //need some way to convert boolean values into required Date objects for each meal
  //currently no async to determine count of recipes or categories of recipes:
  //the 'which' var is calculated based on the dev knowing how much is available
  let which = Math.ceil(Math.random() * 3);
  let recipe = getRecipe(which);
}

function getMealDays() {
  //results array represents seven days of 3 meals
  let r = [[],[],[],[],[],[],[]];

  let buttonMap = document.querySelectorAll('#meal-buttons-map input.meal-button-checkbox');
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

function getRecipe(id) {
  let url = `${RECIPES_URL}/${id}`;
  fetch(url).then(resp => resp.json()).then(json => console.log(json));

}

const getCount = async () => {
  return await fetch(RECIPES_URL).then(resp => resp.json()).then(json => json.count);
}

function selectAllMeals() {
  let buttons = document.querySelectorAll('#meal-buttons-map input.meal-button-checkbox');
  let status = this.checked;
  for (let i = 0; i < buttons.length; i++) {
    buttons[i].checked = status;
  }
}

function selectAllOfOneMeal() {
  let status = this.checked;
  let start = this.parentElement.previousElementSibling.previousElementSibling;
  for (let i = 0; i < 7; i++) {
    start.checked = status;
    start = start.previousElementSibling.previousElementSibling;
  }
}
