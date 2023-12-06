const Listimage = document.getElementById("list-image");
function handleScroll(){
    const windowScrollTop = pageYOffset;
    console.log(windowScrollTop);
    [...Listimage].forEach(item=>{
        if(windowScrollTop>= item.offsetTop - item.offsetHeight - 100){
            item.classList.add('.active-image');
        }
     })
}

handleScroll()
window.addEventListener("DOMContentLoaded",handleScroll);
window.addEventListener('scroll',handleScroll);
 