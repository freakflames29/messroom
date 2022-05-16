let crsbtn = document.getElementById('crsbtn')
let container = document.getElementById('flash_cont')


function removeContainer()
{
	container.remove();
}
crsbtn.addEventListener('click',removeContainer)