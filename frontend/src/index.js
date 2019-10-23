const BASE_URL = "http://localhost:3000";
const RECIPES_URL = `${BASE_URL}/recipes`;

$(document).ready(function() {
  console.log('Hello World!');
  fetch(RECIPES_URL).then(resp => resp.json())
    .then(json => console.log(json));
});
