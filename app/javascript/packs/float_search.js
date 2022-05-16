let searchbtn = document.getElementById('float_search_btn')
let blckdiv= document.getElementById('blckdiv')
let srchdiv= document.getElementById('srchdiv')



function closesearch()
{
	blckdiv.classList.add('hide')
	srchdiv.classList.add('hide')
}

function showsearch()
{
	 window.scrollTo(0, 0);
	blckdiv.classList.remove('hide')
	srchdiv.classList.remove('hide')


}
searchbtn.addEventListener('click',showsearch)
blckdiv.addEventListener('click',closesearch)