console.log("messroom")
let or = document.querySelector("body > div.container > div.hero_container > div.hero_search > form > span:nth-child(3)")
let city = document.querySelector("#search_city")

function changeor () {
	if(city.value.length===0)
	{
		or.textContent='or';
	}
	or.textContent='and';
}

city.addEventListener('keypress', changeor)


