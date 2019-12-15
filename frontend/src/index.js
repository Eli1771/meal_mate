const BASE_URL = "http://localhost:3000";


$(document).ready(function() {
  generatePageElements();
  loadEventListeners();
});


//              --------ONLOAD FUNCTIONS---------

function generatePageElements() {
  generateMealButtons();
  loadCurrentWeekBanner();
  loadNextWeekBanner();
  fetchDayPlan();
  fetchFuturePlan();
}

function loadEventListeners() {
  let generatePlanButton = document.querySelector('#oven button#generate-plan');
  generatePlanButton.addEventListener('click', generatePlan);

  let selectAllMealsButton = document.querySelector('#select-all-meals');
  selectAllMealsButton.addEventListener('click', selectAllMeals);

  let selectAllOfOneMealButtons = document.querySelectorAll('.select-all');
  for (let i = 0; i < selectAllOfOneMealButtons.length; i++) {
    selectAllOfOneMealButtons[i].addEventListener('click', selectAllOfOneMeal);
  }
}

//              -----------PAGE LOADERS-----------

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

function loadCurrentWeekBanner() {
  //Loads dates for current week
  let w = new Week(true);
  let week = document.querySelector('#week-label');
  week.innerHTML = `${w.sunday} - ${w.saturday}`;
  //first load the date
  let date = document.querySelector('#meal-title');
  date.innerHTML = `${moment().format('dddd')}, ${w.today}`;
}

function loadNextWeekBanner() {
  let w = new Week(false);
  let week = document.querySelector('#bottom-right .date-banner');
  week.innerHTML = `${w.sunday} - ${w.saturday}`;
}


//                --------MAIN CLASSES--------

class Week {
  constructor(current) {
    //current: boolean, refers to either current week or next week
    let d = new Date;
    this.currentWeekday = d.getDay();
    this.dateObj = d;
    this.current = current;
    if (current) {
      this.sunday = moment().subtract(this.currentWeekday, 'days').format('MMM Do');
      this.saturday = moment().add((6 - this.currentWeekday), 'days').format('MMM Do');
    } else {
      this.sunday = moment().add(7 - this.currentWeekday, 'days').format('MMM Do');
      this.saturday = moment().add((13 - this.currentWeekday), 'days').format('MMM Do');
    }
  }

  get today() {
    return moment().format('MMM Do');
  }
  //zero-indexed
  dayOfWeek(day) {
    if (this.current) {
      return moment().add(day - this.currentWeekday, 'days').format('MMM Do');
    } else {
      return moment().add(day + (7 - this.currentWeekday), 'days').format('MMM Do');
    }
  }
  formatForSlug(s) {
    const cutSuffix = s.slice(0, s.length - 2);
    if (cutSuffix.length < 6) {
      return cutSuffix.split(' ').join(' 0');
    } else {
      return cutSuffix
    }
  }
  slug(s) {
    const formatted = this.formatForSlug(s);
    return formatted.split(' ').join('_').toLowerCase();
  }
}

class Plan {
  constructor(startDate) {
    this.startDate = startDate;
  }

  get configObj() {
    const config = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify(this.attrHash)
    };
    return config;
  }
}

class WeekPlan extends Plan{
  constructor(startDate, weekPlanId) {
    super(startDate);
    this.weekPlanId = weekPlanId;
  }

  get attrHash() {
    const hash = {
      start_date: this.startDate
    }
    return hash;
  }
  get dayPlanAttributes() {
    return [this.startDate, this.weekPlanId];
  }
}

class DayPlan extends Plan {
  constructor(weekPlanId, day, date, dayPlanId) {
    super(weekPlanId);
    this.day = day;
    this.date = date;
    this.weekPlanId = weekPlanId;
    this.dayPlanId = dayPlanId;
  }

  get attrHash() {
    const hash = {
      day_id: this.day,
      date: this.date,
      week_plan_id: this.weekPlanId
    }
    return hash;
  }
  get mealPlanAttributes() {
    return [this.date, this.dayPlanId];
  }
}

class MealPlan extends DayPlan {
  constructor(dayPlanId, recipeId) {
    super(dayPlanId);
    this.dayPlanId = dayPlanId;
    this.recipeId = recipeId;
  }

  get attrHash() {
    const hash = {
      recipe_id: this.recipeId,
      day_plan_id: this.dayPlanId
    }
    return hash;
  }
}


//                 ---------DATABASE FUNCTIONS---------

//                  ----------Existing Plans------------

// To grab a current plan and render it
function fetchDayPlan() {
  let w = new Week(true);
  const today = w.slug(w.today);
  const url = `${BASE_URL}/day_plans/${today}`;
  fetch(url).then(resp => resp.json()).then(json => renderDayPlan(json));
}

function renderDayPlan(dp) {
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
        li.innerText = makeIngredientString({
          amount: ing.amount,
          unit: ing.unit,
          name: ing.ingredient.name
        });
        ingredientsList.appendChild(li);
      }
      mealContainer.appendChild(ingredientsList);
      //7. add fully populated meal container to day plan container
      container.appendChild(mealContainer);
    }
    //generate all stars at once
    // generateStars();
  } else {
    container.innerHTML =
      '<div id="meal-plan-placeholder"><p>No plan found for today.</p><p>Get started on your plan for next week!</p></div>';
  }
}

//                ----------Create New Plans----------

// To generate the full plan from the oven button
//    First make the week plan object
async function generatePlan() {
  //first grab buttons from array of days
  let requiredMeals = getMealDays();

  if (requiredMeals.flat().reduce(noneChecked, true)) {
    alert('Please select at least one meal to generate.');
  } else {
    document.querySelector('#oven').classList.add('meal-plan-loading');
    this.innerText = 'Loading...';
    let w = new Week(false);
    let startDate = w.formatForSlug(w.sunday);
    let wp = new WeekPlan(startDate);
    let configObj = wp.configObj;
    //fetch functions
    let resp = await fetch(`${BASE_URL}/week_plans`, configObj);
    let json = await resp.json();
    wp.weekPlanId = await json.id;
    //messy array to prevent repeats for each meal
    let alreadyPicked = [[],[],[]];

    //Now loop through to make day plans and feed into week plan
    for (let day = 0; day < requiredMeals.length; day++) {
      let date = w.formatForSlug(w.dayOfWeek(day));
      alreadyPicked = await generateDayPlan(requiredMeals[day], date, day, wp.weekPlanId, alreadyPicked);
    }
    fetchFuturePlan();
  }
}

// Creates aray representing selected meals for generation
// based on the meal button map above oven
function getMealDays() {
  //results array represents seven days of 3 meals
  let r = [[], [], [], [], [], [], []];
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

//    Then make each day plan object based on selected days
async function generateDayPlan(whichMeals, date, day, weekPlanId, alreadyPicked) {
  if (!whichMeals.reduce(noneChecked, true)) {
    let dp = new DayPlan(weekPlanId, (day + 1), date);
    let configObj = dp.configObj

    let rand12 = function() {
      return randomInRange(12);
    }
    //make the configuration object w/ object data
    //actual fetch posts to populate db
    const resp = await fetch(`${BASE_URL}/day_plans`, configObj);
    const json = await resp.json();
    dp.dayPlanId = await json.id;

    // randomly select meals
    for (let meal = 0; meal < 3; meal++) {
      if (whichMeals[meal]) {
        //randomly select a number 0 - 11 that HASNT been chosen before
        let rIndex = rand12() - 1

        //to prevent repetition
        while (alreadyPicked[meal].includes(rIndex)) {
          rIndex = rand12() - 1
        }
        alreadyPicked[meal].push(rIndex);
        await associateRecipe(rIndex, dp.dayPlanId, meal + 1);
      }
    }
  }
  return alreadyPicked
}

//    Then make the join object for each day based on selected meals
async function associateRecipe(rIndex, dayPlanId, mealId) {
  let recipeId = await getRecipeIndex(rIndex, mealId);
  let mp = new MealPlan(dayPlanId, recipeId);
  let configObj = mp.configObj;
  let resp = await fetch(`${BASE_URL}/recipe_plans`, configObj);
  let json = await resp.json();
}

//    Used to gen the index (for fetching) based on randomized selection
async function getRecipeIndex(rIndex, mealId) {
  let resp = await fetch(`${BASE_URL}/meals/${mealId}/recipes/${rIndex}`);
  let json = await resp.json();
  let recipeId = await json.id;
  return recipeId;
}


//                  ----------Plan Now Fully Generated----------

// Fetches newly created plan
function fetchFuturePlan() {
  let w = new Week(false);
  let planId = w.slug(w.sunday);
  fetch(`${BASE_URL}/week_plans/${planId}`)
    .then(resp => resp.json()).then(json => renderFuturePlan(json));
}

// Calls each function needed to render plan into oven
function renderFuturePlan(planData) {
  if (planData) {
    openOven();
    disableMealButtons();
    renderRecipes(planData);
    //to return a flat array of recipe_ingredients for the plan
    let ingredientObjects = planData.day_plans.map(dp => dp.recipes.map(r => r.recipe_ingredients)).flat(2);
    let ingredients = ingredientObjects.map(io => [[io.ingredient.name, io.unit], io.amount]);
    renderShoppingList(ingredients);
  }
}

// Renders meals into first pane
function renderRecipes(planData) {
  const frame = document.querySelector('#oven-meals-content-pane');
  frame.innerHTML = '';
  const dayPlans = planData.day_plans;
  //now populate frame
  frame.innerHTML += `<h2>Week of ${planData.start_date}</h2>`;

  for (let i = 0; i < dayPlans.length; i++) {
    frame.innerHTML += `<h3>${dayPlans[i].day.name}</h3>`;
    const recipes = dayPlans[i].recipes;

    for (let j = 0; j < recipes.length; j++) {
      frame.innerHTML +=
        `<p>${recipes[j].meal.name} -
        <a target="_blank" href="${recipes[j].instructions}">
        ${recipes[j].name}</a></p>`;
    }
  }
}

// Renders formatted shopping list items into second pane
function renderShoppingList(ingredients) {
  const frame = document.querySelector('#oven-shopping-list-content-pane');
  //clear frame content just in case
  frame.innerHTML = '';
  let listItems = compileShoppingList(ingredients);

  for (let i = 0; i < listItems.length; i++) {
    frame.innerHTML += `<li>${listItems[i]}</li>`
  }
}

// 'Condences' shopping list by adding like items together
function compileShoppingList(ingredients) {
  let collapsed = []

  for (let i = 0; i < ingredients.length; i++) {
    let ingredient = ingredients[i];
    let listed = collapsed.find(n => {
      //checks for listings with the same ingredient AND unit
      return n[0][0] == ingredient[0][0] && n[0][1] == ingredient[0][1];
    });

    if (listed) {
      listed[1] = parseFloat(listed[1]) + parseFloat(ingredient[1]);
    } else {
      collapsed.push(ingredient);
    }
  }
  let ingStrings = collapsed.map(function(ing) {
    return makeIngredientString({
      name: ing[0][0],
      unit: ing[0][1],
      amount: ing[1]
    })
  });
  return ingStrings;
}

// Reformats json ingredient items into readable string
function makeIngredientString(ingObj) {
  const keysInOrder = ['amount', 'unit', 'name'];
  let r = '';

  if (!ingObj.amount) {
    r = `${ingObj.name} - ${ingObj.unit}`;
  } else {

    for (let i = 0; i < Object.keys(ingObj).length; i++) {
      if (ingObj[keysInOrder[i]]) {
        r += `${ingObj[keysInOrder[i]]} `;
      }
    }
  }
  return r;
}


//              ------------FRONTEND FUNCTIONS------------

function openOven() {
  document.querySelector('#oven').classList.remove('meal-plan-loading');
  // let button = document.querySelector('#oven #oven-door-opened');
  // button.innerHTML = 'Start Over?';
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

function disableMealButtons() {
  const buttons = document.querySelector('#top-right');
  buttons.classList.add('deactivated');

  let selectAllMealsButton = document.querySelector('#select-all-meals');
  selectAllMealsButton.removeEventListener('click', selectAllMeals);

  let selectAllOfOneMealButtons = document.querySelectorAll('.select-all');
  for (let i = 0; i < selectAllOfOneMealButtons.length; i++) {
    selectAllOfOneMealButtons[i].removeEventListener('click', selectAllOfOneMeal);
  }
  let deactivated = document.createElement('h3');
  deactivated.innerText = 'View Next Week\'s Plan Below';
  buttons.appendChild(deactivated);
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


//                      -----------HELPERS-----------

function randomInRange(n) {
  return Math.ceil(Math.random() * n);
}

//callback fx for reduce. Returns true if none of the mealplans are checked
//must use true as initial value for second param in reduce fx
function noneChecked(result, current) {
  return result && !current;
};
