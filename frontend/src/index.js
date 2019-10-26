const BASE_URL = "http://localhost:3000";
const RECIPES_URL = `${BASE_URL}/recipes`;

$(document).ready(function() {
  generateMealButtons();
});



function generateMealButtons() {
  let meals = ['Br', 'Lu', 'Di'];
  let buttons = document.querySelector('#meal-buttons-map');

  for (let i = 0; i < meals.length; i++) {
	let meal =  meals[i];
    buttons.innerHTML += `<div>${meal}</div>`;
    for (let j = 0; j < 7; j++) {
        buttons.innerHTML += '<div><div>';
    }
  }
}
