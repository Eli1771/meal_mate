const BASE_URL = "http://localhost:3000";

$(document).ready(function() {
  // makeTemporaryMeal();
  generatePageElements();
  loadEventListeners();
});



//                        --------LOAD PAGE ELEMENTS-------



function generatePageElements() {
  generateMealButtons();
  loadCurrentMealPlan();
  loadNextWeekBanner();
  fetchDayPlan();
}

function loadCurrentMealPlan() {
  //Loads dates for current week
  let d = new Date;
  let currentWeekday = d.getDay();
  let pastSunday = moment().subtract(currentWeekday, 'days').format('MMM Do');
  let comingSaturday = moment().add((6 - currentWeekday), 'days').format('MMM Do');

  let week = document.querySelector('#week-label');
  week.innerHTML = `${pastSunday} - ${comingSaturday}`;
  //first load the date
  let date = document.querySelector('#meal-title');
  date.innerHTML = `${moment().format('dddd')}, ${moment().format("MMMM Do")}`;
}

function loadNextWeekBanner() {
  let d = new Date;
  let currentWeekday = d.getDay();
  let comingSunday = moment().add(7 - currentWeekday, 'days').format('MMM Do');
  let nextSaturday = moment().add((13 - currentWeekday), 'days').format('MMM Do');

  let week = document.querySelector('#bottom-right .date-banner');
  week.innerHTML = `${comingSunday} - ${nextSaturday}`;
}

function generateMealButtons() {
  let meals = ['Br', 'Lu', 'Di'];
  let days = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
  let buttons = document.querySelector('#meal-buttons-map');

  for (let i = 0; i < meals.length; i++) {
	  let meal =  meals[i];
    buttons.innerHTML += `<button class="select-all">${meal}</button>`;
    for (let j = 0; j < days.length; j++) {
      let day = days[j];
      let customId = `checkbox-${i}-${j}`;
      buttons.innerHTML +=
        `<input type="checkbox" class="meal-button-checkbox ${meal} ${day}" id="${customId}">
        <label for="${customId}"></label>`;
        //above are 2 nested divs to be used to display a retro button with some depth
    }
  }
}

function fetchDayPlan() {
  const today = slugDate(moment().format('MMM DD')).toLowerCase();
  const url = `${BASE_URL}/day_plans/${today}`;
  fetch(url).then(resp => resp.json()).then(json => renderDayPlan(json));
}

function renderDayPlan(dp) {
  console.log(!!dp);
  const container = document.querySelector('div#all-meals');
  if (dp) {
    //clear container of all content
    container.innerHTML = '';
    const recipes = dp.recipes;
    //for each recipe, create all elements
    for (let i = 0; i < recipes.length; i++) {
      let recipe = recipes[i];
      let ingredients = recipe.recipe_ingredients;
      let ratingTitles = ['Cost', 'Complexity', 'Nutrition', 'Taste'];
      //1. create a header (outside of container) with meal name
      container.innerHTML += `<h5 class="meal-name">${recipe.meal.name.toUpperCase()}</h5>`;
      //2. make the container for all recipe elements
      let mealContainer = document.createElement('div');
      //3. all the header with title and link to instructions
      mealContainer.classList.add('single-meal');
      let name = recipe.name;
      let link = `<a href=${recipe.instructions} target="_blank">View Full Recipe</a>`;
      let recipeHeader = `<h4>${name} - ${link}</h4>`;
      mealContainer.innerHTML += recipeHeader;
      //4. create and populate ingredients list
      mealContainer.innerHTML += '<h5>Ingredients: </h5>';
      let ingredientsList = document.createElement('ul');
      ingredientsList.classList.add('ingredients-list');
      for (let j = 0; j < ingredients.length; j++) {
        let ing = ingredients[j];
        let li = document.createElement('li');
        //li.innerText = makeIngredientString({amount: ing.amount, unit: ing.unit, name: ing.ingredient.name});
        ing.unit ?
          li.innerText = `${ing.amount} ${ing.unit} ${ing.ingredient.name}` :
          li.innerText = `${ing.amount} ${ing.ingredient.name}`;
        ingredientsList.appendChild(li);
      }
      mealContainer.appendChild(ingredientsList);
      //5. create ratings container
      // let ratingsContainer = document.createElement('div');
      // ratingsContainer.classList.add('ratings-container');
      // mealContainer.appendChild(ratingsContainer);
      //6. create ratings zones (no stars)
      // for (let k = 0; k < ratingTitles.length; k++) {
        // let ratingZone = document.createElement('div');
        // ratingZone.classList.add('rating');
        // ratingsContainer.appendChild(ratingZone);
        // let ratingHeader = document.createElement('p');
        // ratingHeader.innerText = ratingTitles[k];
        // ratingZone.appendChild(ratingHeader);
        // let stars = document.createElement('div');
        // stars.classList.add('stars');
        // ratingZone.appendChild(stars);
      // }
      //7. add fully populated meal container to day plan container
      container.appendChild(mealContainer);
    }
    //generate all stars at once
    // generateStars();
  } else {
    container.innerHTML =
      '<p>No plan found for today.</p><p>Get started on your plan for next week!</p>';
  }
}

// function generateStars() {
  // console.log('generating stars...');
  // let meals = document.querySelectorAll('.single-meal');
  // let mealNames = document.querySelectorAll('#all-meals h5.meal-name');
  // let ratingTitles = ['cost', 'complexity', 'nutrition', 'taste'];
  // let img = '<img src="./images/star-symbol.png" class="star">';
  // let closingLabel = '</label>'
//
  // for (let i = 0; i < meals.length; i++) {
    // let meal = meals[i];
    // let mealName = mealNames[i].innerHTML.toLowerCase();
    // let ratingContainers = meal.querySelectorAll('.stars');
    // console.log('all rating containers:');
    // console.log(ratingContainers);
    // let id = mealName;
//
    // for (let j = 0; j < ratingContainers.length; j++) {
      // let container = ratingContainers[j];
      // id += `-${ratingTitles[j]}`;
      // let name = `${id}-container`;
//
      // for (let k = 4; k >= 0; k--) {
        // id += `-${k}`;
        // let input = `<input type="radio" id="${id}" name="${name}">`;
        // let openingLabel = `<label for="${id}" class="star">`;
        // container.innerHTML += (input + openingLabel + img + closingLabel);
        // id = `${mealName}-${ratingTitles[j]}`;
      // }
      // id = mealName;
    // }
  // }
// }

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

  // let ovenDialButtons = document.querySelectorAll('#oven-dials label');
  // for (let j = 0; j < ovenDialButtons.length; j++) {
    // ovenDialButtons[j].addEventListener('click', displayPlanType);
  // }
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

// function displayPlanType() {
  // let key = this.htmlFor;
  // let header = document.querySelector('#bottom-right h4');
  // let planNames = {
    // random: 'Surprise Me',
    // cost: 'Wallet-Friendly',
    // complexity: 'Feeling Ambitious',
    // nutrition: 'Healthy Choice',
    // taste: 'All The Hits'
  // }
  // header.innerHTML = `Plan Type: ${planNames[key]}`;
// }

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
  let className = this.innerText;
  let status = false;
  let buttons = document.querySelectorAll(`div#meal-buttons-map .${className}`);
  //will check all buttons unless all are already checked
  for (let i = 0; i < buttons.length; i++) {
    if (!buttons[i].checked) {
      status = true;
      break;
    }
  }
  //change all buttons to the included status
  for (let j = 0; j < buttons.length; j++) {
    buttons[j].checked = status;
  }
}




//                  ---------ALL BACKEND PROCESSES------

//     ========TEMPORARY METHOD TO TEST DAY PLAN RENDERING==============

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
  console.log('temp plan id: ');
  console.log(wpId);

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









//                    ================================


async function generatePlan() {
  this.innerText = 'Loading...';
  //first grab buttons from array of days
  let requiredMeals = getMealDays();

  //moment methods to get dates for week
  let d = new Date;
  let currentWeekday = d.getDay();
  let offset = 7 - currentWeekday;
  //only to plug into the week_plan create method <- needs an async/await?
  let startDate = moment().add(offset, 'days').format('MMM DD');
  let objData = {
    start_date: startDate
  }
  let configObj = makeConfigObj(objData);
  let resp = await fetch(`${BASE_URL}/week_plans`, configObj);
  let json = await resp.json();
  let weekPlanId = await json.id;

  // //Now loop through to make day plans and feed into week plan
  for (let day = 0; day < requiredMeals.length; day++) {
    let date = moment().add((day + offset), 'days').format('MMM DD');
    console.log('date of plan: ' + date);
    await generateDayPlan(requiredMeals[day], date, day, weekPlanId);
  }
  fetchFuturePlan(weekPlanId);
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
  const resp = await fetch(`${BASE_URL}/day_plans`, configObj);
  const json = await resp.json();
  console.log('day plan json:');
  console.log(json);
  const dayPlanId = await json.id;

  //randomly select meals
  for (let meal = 0; meal < 3; meal++) {
    if (whichMeals[meal]) {
      await associateRecipe(rand3(), dayPlanId);
    }
  }
}

async function associateRecipe(recipeId, dayPlanId) {
  let objData = {
    recipe_id: recipeId,
    day_plan_id: dayPlanId
  }
  let configObj = makeConfigObj(objData);
  let resp = await fetch(`${BASE_URL}/recipe_plans`, configObj);
  let json = await resp.json();
}

function fetchFuturePlan(planId) {
  fetch(`${BASE_URL}/week_plans/${planId}`)
    .then(resp => resp.json()).then(json => renderFuturePlan(json));
}

function renderFuturePlan(planData) {
  openOven();
  renderRecipes(planData);
  //to return a flat array of recipe_ingredients for the plan
  let ingredientObjects = planData.day_plans.map(dp => dp.recipes.map(r => r.recipe_ingredients)).flat(2);
  let ingredients = ingredientObjects.map(io => [[io.ingredient.name, io.unit], io.amount]);
  renderShoppingList(ingredients);
}

function renderRecipes(planData) {
  const frame = document.querySelector('#oven-meals-content-pane');
  const dayPlans = planData.day_plans;
  //now populate frame
  frame.innerHTML += `<h2>Week of ${planData.start_date}</h2>`;
  for (let i = 0; i < dayPlans.length; i++) {
    frame.innerHTML += `<h3>${dayPlans[i].day.name}</h3>`;
    const recipes = dayPlans[i].recipes;
    for (let j = 0; j < recipes.length; j++) {
      frame.innerHTML += `<p>${recipes[j].meal.name} - ${recipes[j].name}</p>`;
    }
  }
}

function renderShoppingList(ingredients) {
  const frame = document.querySelector('#oven-shopping-list-content-pane');
  let listItems = compileShoppingList(ingredients);
  for (let i = 0; i < listItems.length; i++) {
    const listItem = listItems[i];
    const name = listItem[0][0];
    const unit = listItem[0][1];
    const amount = listItem[1];
    unit ?
      frame.innerHTML += `<li>${amount} ${unit} ${name}</li>` :
      frame.innerHTML += `<li>${amount} ${name}</li>`
  }
}

function compileShoppingList(ingredients) {
  let collapsed = []
  for (let i = 0; i < ingredients.length; i++) {
    let ingredient = ingredients[i];
    console.log(ingredient);
    let listed = collapsed.find(n => {
      return n[0][0] == ingredient[0][0] && n[0][1] == ingredient[0][1];
    });
    console.log('listed: ' + listed);
    if (listed) {
      listed[1] += ingredient[1]
    } else {
      collapsed.push(ingredient);
    }
  }
  console.log('full ingredients array:');
  console.log(collapsed);
  return collapsed
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

function slugDate(s) {
  return s.split(' ').join('_');
}

function makeIngredientString(ingObj) {
  const keysInOrder = ['amount', 'unit', 'name'];
  let r = '';
  if (ingObj.unit.toLowerCase() === 'to taste') {
    r = `${ingObj.name} - ${ingObj.amount}`;
  } else {
    for (let i = 0; i < Object.keys(ingObj).length; i++) {
      if (ingObj[keysInOrder[i]]) {
        r += `${ingObj[keysInOrder[i]]} `;
      }
    }
  }
  return r;
}
