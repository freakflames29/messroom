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
function closesearchesc(e)
{
	if(e.keyCode==27)
	{
		blckdiv.classList.add('hide')
		srchdiv.classList.add('hide')
	}
}
searchbtn.addEventListener('click',showsearch)
blckdiv.addEventListener('click',closesearch)

window.onkeydown = function( event ) {
    if ( event.keyCode == 27 ) {
        closesearchesc(event);
    }
};