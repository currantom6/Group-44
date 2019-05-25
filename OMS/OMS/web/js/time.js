/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function startTime() {
    var date = new Date();
    var n = date.toDateString();
    var time = date.toLocaleTimeString();

    document.getElementById('time').innerHTML = n + ' - ' + time;
    tt = display_c();
}
function display_c() {
    var refresh = 1000;
    mytime = setTimeout('startTime()', refresh);
}

