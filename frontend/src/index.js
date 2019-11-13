const BASE_URL = "http://localhost:3000";
const RECIPES_URL = `${BASE_URL}/recipes`;

$(document).ready(function() {
  generatePageElements();
  //fetchCurrentPlan(); <-grabs, if any, the current meal plan and displays todays plan
  loadEventListeners();
});



//                        --------LOAD PAGE ELEMENTS-------



function generatePageElements() {
  generateMealButtons();
  loadCurrentMealPlan();
  generateStars();
}

function loadCurrentMealPlan() {
  //Loads dates for current week
  let d = new Date;
  let currentWeekday = d.getDay();
  let pastSunday = moment().subtract(currentWeekday, 'days').format('MMM Do');
  let comingSaturday = moment().add((7 - currentWeekday), 'days').format('MMM Do');

  let week = document.querySelector('#week-label');
  week.innerHTML = `${pastSunday} - ${comingSaturday}`;
  //first load the date
  let date = document.querySelector('#meal-title');
  date.innerHTML = `${moment().format('dddd')}, ${moment().format("MMMM Do")}`;

}

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

//             =======HOLDER METHOD TO TEST RATING ANIMATIONS=======

function generateStars() {
  let ratingContainers = document.querySelectorAll('.stars');
  let ratingHeaders = document.querySelectorAll('.ratings-container p');
  // HTML elements
  let img = '<img src="./images/star-symbol.png" class="star">';
  let closingLabel = '</label>'

  for (let i = 0; i < ratingContainers.length; i++) {
    let container = ratingContainers[i];
    let id = ratingHeaders[i].innerHTML;
    let name = `${id}-container`;
    for (let j = 4; j >= 0; j--) {
      id += `-${j}`;
      let input = `<input type="radio" id=${id} name=${name}>`;
      let openingLabel = `<label for=${id} class="star">`;
      container.innerHTML += (input + openingLabel + img + closingLabel);
      id = ratingHeaders[i].innerHTML;
    }
  }
}

//                        -------LOAD EVENT LISTENERS-------



function loadEventListeners() {
  let generatePlanButton = document.querySelector('#oven button#generate-plan');
  generatePlanButton.addEventListener('click', generatePlan);

  let startOverButton = document.querySelector('#oven button#oven-door-opened');
  startOverButton.addEventListener('click', closeOven);

  let selectAllMealsButton = document.querySelector('#select-all-meals');
  selectAllMealsButton.addEventListener('click', selectAllMeals);

  let selectAllOfOneMealButtons = document.querySelectorAll('.select-all');
  for (let i = 0; i < selectAllOfOneMealButtons.length; i++) {
    selectAllOfOneMealButtons[i].addEventListener('click', selectAllOfOneMeal);
  }
}



//                        -------ALL FRONTEND PROCESSES---------




function openOven() {
  //hide 'closed' elements
  let closed = document.querySelectorAll('.closed-oven');
  for (let i = 0; i < closed.length; i++) {
    closed[i].classList.add('hidden');
  }
  //reveal 'opened' elements
  let opened = document.querySelectorAll('.open-oven');
  for (let j = 0; j < opened.length; j++) {
    opened[j].classList.remove('hidden');
  }
  document.querySelector('#oven-door').classList.add('opened');

  document.querySelector('#oven-meals').checked = true;
}

function closeOven() {
  alert('Discard your current plan?');
  //hide 'opened' elements
  let opened = document.querySelectorAll('.open-oven');
  for (let j = 0; j < opened.length; j++) {
    opened[j].classList.add('hidden');
  }
  document.querySelector('#oven-door').classList.remove('opened');
  //reveal 'closed' elements
  let closed = document.querySelectorAll('.closed-oven');
  for (let i = 0; i < closed.length; i++) {
    closed[i].classList.remove('hidden');
  }

  document.querySelector('#oven-meals').checked = false;
  document.querySelector('#oven-shopping-list').checked = false;
}

function selectAllMeals() {
  let buttons = document.querySelectorAll('#meal-buttons-map input.meal-button-checkbox');
  let selectAllCheckboxes = document.querySelectorAll('.select-all');
  let status = this.checked;
  for (let i = 0; i < buttons.length; i++) {
    buttons[i].checked = status;
  }
  for (let j = 0; j < selectAllCheckboxes.length; j++) {
    selectAllCheckboxes[j].checked = status;
  }
}

function selectAllOfOneMeal() {
  let status = this.checked;
  //I HATE THESE SELECTORS <- Fix later?
  let start = this.parentElement.previousElementSibling.previousElementSibling;
  for (let i = 0; i < 7; i++) {
    start.checked = status;
    start = start.previousElementSibling.previousElementSibling;
  }
}




//                  ---------ALL BACKEND PROCESSES------



async function generatePlan() {
  openOven();
  //first grab buttons from array of days
  let requiredMeals = getMealDays();

  //moment methods to get dates for week
  let d = new Date;
  let currentWeekday = d.getDay();
  let offset = 7 - currentWeekday;
  //only to plug into the week_plan create method <- needs an async/await?
  let startDate = moment().add(offset, 'days').format('MMM Do');
  let objData = {
    start_date: startDate
  }
  let configObj = makeConfigObj(objData);
  let resp = await fetch('http://localhost:3000/week_plans', configObj);
  let json = await resp.json();
  let weekPlanId = await json.id;
  console.log('week plan id in week generator: ' + weekPlanId);

  // //Now loop through to make day plans and feed into week plan
  for (let day = 0; day < 1/*requiredMeals.length*/; day++) {
    let date = moment().add((day + offset), 'days').format('MMM Do');
    console.log('date of plan: ' + date);
    let dayPlan = await generateDayPlan(requiredMeals[day], date, day, weekPlanId);
    continue;
  }
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

async function generateDayPlan(whichMeals, date, day, weekPlanId) {
  let objData = {
    day_id: day,
    date: date,
    week_plan_id: weekPlanId
  };
  let rand3 = function() {
    return randomInRange(3);
  }
  //make the configuration object w/ object data
  let configObj = makeConfigObj(objData);
  //actual fetch posts to populate db
  const resp = await fetch('http://localhost:3000/day_plans', configObj);
  const json = await resp.json();
  console.log('day plan json:');
  console.log(json);
  let dayPlanId = await json.id;
  console.log(dayPlanId);

  //randomly select meals
  for (let meal = 0; meal < 3; meal++) {
    if (whichMeals[meal]) {
      await associateRecipe(rand3(), dayPlanId);
      continue;
    }
  }
  return json;
}

async function associateRecipe(recipeId, dayPlanId) {
  let objData = {
    recipe_id: recipeId,
    day_plan_id: dayPlanId
  }
  let configObj = makeConfigObj(objData);
  let resp = await fetch('http://localhost:3000/recipe_plans', configObj);
  let json = await resp.json();
  console.log(json);
}

function renderFuturePlan(plan) {
  const frame = document.querySelector('#oven-meals-content-pane');
  frame.innerHTML = '<h1>hello yall</h1>';
}



//                      -----------HELPERS-----------



function randomInRange(n) {
  return Math.ceil(Math.random() * n);
}

function makeConfigObj(objData) {
  return {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: JSON.stringify(objData)
  };
}
