/*NOVO PLAYER*/
#app-cover {

right: 0;
left: 0;
width: 430px;
height: 100px;
margin: -4px auto;
}

#player {
position: relative;
height: 100%;
z-index: 3;
}

#player-track {
position: absolute;
top: 0;
right: 15px;
left: 15px;
padding: 13px 22px 10px 184px;
background-color: #343a40;
border-radius: 15px 15px 0 0;
transition: 0.3s ease top;
z-index: 1;
}

#player-track.active {
top: -92px;
}

#album-name {
color: #afb7c1;
font-size: 17px;
font-weight: bold;
}

#track-name {
color: #afb7c1;
font-size: 13px;
margin: 2px 0 13px 0;
}

#track-time {
height: 12px;
margin-bottom: 3px;
overflow: hidden;
}

#current-time {
float: left;
}

#track-length {
float: right;
}

#current-time,
#track-length {
color: transparent;
font-size: 11px;
background-color: #343a40;
border-radius: 10px;
transition: 0.3s ease all;
}

#track-time.active #current-time,
#track-time.active #track-length {
color: #f86d92;
background-color: transparent;
}

#s-area,
#seek-bar {
position: relative;
height: 4px;
border-radius: 4px;
}

#s-area {
background-color: purple;
cursor: pointer;
}

#ins-time {
position: absolute;
top: -29px;
color: #fff;
font-size: 12px;
white-space: pre;
padding: 5px 6px;
border-radius: 4px;
display: none;
}

#s-hover {
position: absolute;
top: 0;
bottom: 0;
left: 0;
opacity: 0.2;
z-index: 2;
}

#ins-time,
#s-hover {
background-color: #3b3d50;
}

#seek-bar {
content: "";
position: absolute;
top: 0;
bottom: 0;
left: 0;
width: 0;
background-color: purple;
transition: 0.2s ease width;
z-index: 1;
}

#player-content {
position: relative;
height: 100%;
background-color: #afb7c1;
box-shadow: 0 30px 80px purple;;
border-radius: 15px;
z-index: 2;
}

#album-art {
position: absolute;
top: -40px;
width: 115px;
height: 115px;
margin-left: 50px;
transform: rotateZ(0);
transition: 0.3s ease all;
box-shadow: 0 0 0 10px #fff;
border-radius: 50%;
overflow: hidden;
}

#album-art.active {
top: -60px;
box-shadow: 0 0 0 4px #afb7c1, 0 30px 50px -15px #afb7c1;
}

#album-art:before {
content: "";
position: absolute;
top: 50%;
right: 0;
left: 0;
width: 20px;
height: 20px;
margin: -10px auto 0 auto;
background-color: #d6dee7;
border-radius: 50%;
box-shadow: inset 0 0 0 2px #fff;
z-index: 2;
}

#album-art img {
display: block;
position: absolute;
top: 0;
left: 0;
width: 100%;
height: 100%;
opacity: 0;
z-index: -1;
transition: 1s opacity ease-in-out;
}

#album-art img.active {
opacity: 1;
z-index: 1;
}

#album-art.active img.active {
z-index: 1;
animation: rotateAlbumArt 3s linear 0s infinite forwards;
}

@keyframes rotateAlbumArt {
0% {
transform: rotateZ(0);
}
100% {
transform: rotateZ(360deg);
}
}


#album-art img,


#album-art.buffering img {
opacity: 0.25;
}

#album-art.buffering img.active {
opacity: 1;
}

#player-controls {
width: 250px;
height: 100%;
margin: 0 5px 0 141px;
float: right;
display: flex;
align-items: around;
}

.control {
padding: 12px 0;
flex: 1;
margin-left: -7%;
}

.volume-control {
width: 33.333%;
margin-left: -7%;
position: relative;
display: flex;
align-items: center;
justify-content: center;
}

.volume-control input[type="range"] {
position: absolute;
top: 0;
left: 50%;
transform: rotate(270deg) translateX(10%);
transform-origin: left center;
background-color: purple;
display: none;
}

#volume-slider{
color: purple;
}
.button-player {
width: 26px;
height: 26px;
padding: 25px;
background-color: #fff;
border-radius: 6px;
cursor: pointer;
}

.button-player i {
display: block;
color: purple;
font-size: 26px;
text-align: center;
line-height: 1;
}

.button-player,
.button-player i {
transition: 0.2s ease all;
}

.button-player:hover {
background-color: #d6d6de;
}

.button-player:hover i {
color: #fff;
}
@media (max-width: 768px){
#album-art {
position: absolute;
top: -40px;
width: 100px;
height: 100px;
margin-left: 20px;
transform: rotateZ(0);
transition: 0.3s ease all;
box-shadow: 0 0 0 10px #fff;
border-radius: 50%;
overflow: hidden;
}
}
.roxo{
color: purple;
}