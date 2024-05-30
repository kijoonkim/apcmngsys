<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
const authrtUiJson = ${authrtUiJson};
// 화면UI 권한처리
gfn_setComAuthrtUI(authrtUiJson);

const area = document.getElementsByTagName('section');
console.log(area);
window.document.addEventListener('touchstart',handleTouchStart,false);
window.document.addEventListener('touchmove',handleTouchMove,false);
let xDown = null;
let yDown = null;

function handleTouchStart(evt){
    console.log("touchStart");
    const firstTouch = evt.touches[0];
    xDown = firstTouch.clientX;
    yDown = firstTouch.clientY;
}
function handleTouchMove(evt){
    console.log("touchMove");
    if(!xDown || !yDown){
        return;
    }
    const xUp = evt.touches[0].clientX;
    const yUp = evt.touches[0].clientY;

    const xDiff = xDown - xUp;
    const yDiff = yDown - yUp;

    if(Math.abs(xDiff) > Math.abs(yDiff)){

    }else {
        if(yDiff > 0){
            if(document.exitFullscreen){
                document.exitFullscreen();
            }else if(document.webkitExitFullscreen){
                document.webkitExitFullscreen();
            }else if(document.msExitFullscreen){
                document.msExitFullscreen();
            }
        }
    }

}

</script>