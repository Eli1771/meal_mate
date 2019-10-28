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
        `<input type="checkbox" class="meal-button-checkbox" id="checkbox-${customId}">
        <label for="checkbox-${customId}"></label>`;
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

function generatePlan() {
  console.log('I\'m generating!');
}
