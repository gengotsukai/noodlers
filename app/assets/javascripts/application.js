// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

 function initMap() {
            'use strict';

            var target = document.getElementById('target');
            var geocoder = new google.maps.Geocoder();
            //Geocoding: 住所を緯度・経度に変換する
            //Reverse Geocoding　緯度・経度を住所に変換する
            //searchをクリックしたときの処理
            document.getElementById('search').addEventListener('click', function() {
                geocoder.geocode({
                    address: document.getElementById('address').value
                }, function(results, status) {
                    if (status !== 'OK') {
                        alert('Failed: ' + status);
                        return;
                    }
                    // results[0].geometry.location
                    if (results[0]) {
                        new google.maps.Map(target, {
                            center: results[0].geometry.location,
                            zoom: 15
                        });
                    } else {
                        alert('No results found');
                        return;
                    }
                });
            });

            //var map;
            //var tokyo = {lat: 35.681167, lng: 139.767052};
            //var infoWindow;
            //var marker;

            //map = new google.maps.Map(target, {
                //center: tokyo,
                //世界地図レベル
                //zoom: 0,
                //国レベル
                //zoom: 6,
                //街・地域レベル
                //zoom: 15
                //全てのUIを無効化
                //disableDefaultUI: true,
                //拡大と縮小のUIだけ有効化
                //zoomControl: true,
                //衛星写真
                //mapTypeId: 'satellite'
                //衛星写真＋道路情報
                //mapTypeId: 'hybrid',
                //クリックイベントを無効にする
                //clickableIcons: false
            //});
            //地図上の特定の位置をクリックし、markerが表示され、markerをクリックすると情報ウィンドウを表示する記述
            //map.addListener('click', function (e) {
                //var marker = new google.maps.Marker({
                    //position: e.latLng,
                    //map: this,
                    //animation: google.maps.Animation.DROP
                //});
                //var infoWindow = new google.maps.InfoWindow({
                    //content: e.latLng.toString()
                //});
                //marker.addListener('click', function() {
                    //infoWindow.open(map, marker)
                //});
            //});
            //特定の場所に情報ウィンドウを表示させる
            //infoWindow = new google.maps.InfoWindow({
                //position: tokyo,
                //content: 'Hello! Hello! Hello! Hello! Hello!'
                //contentにhtmlタグを指定する
                //content: '<strong>Hello!</strong> Hello! Hello! Hello! Hello!'
                //contentにhtml要素を指定する
                //content: document.getElementById('info'),
                //maxWidth: 100
            //});

            //infoWindow.open(map);
            //特定の位置をクリックした場合、その位置にmarkerをdropさせる記述
            //map.addListener('click', function(e) {
                //var marker = new google.maps.Marker({
                    //position: e.latLng,
                    //map: map,
                    //title: e.latLng.toString(),
                    //animation: google.maps.Animation.DROP
                //});
                //markerを再度クリックするとmarkerが消える処理の記述
                //marker.addListener('click', function() {
                    //this.setMap(null);
                //});
            //});
            //marker = new google.maps.Marker({
                //position: tokyo,
                //map: map,
                //markerにhoverした時の文字列
                //title: 'Tokyo!',
                //markerがBOUNCEする動き
                //animation: google.maps.Animation.BOUNCE
                //markerがdropする動き
                //animation: google.maps.Animation.DROP
            //});
            //緯度と経度をstring型で表示させるための記述
            //map.addListener('click', function(e) {
                //console.log(e.latLng.lat());
                //console.log(e.latLng.lng());
                //console.log(e.latLng.toString());
            //マップ上でクリックした箇所を瞬間的に中央箇所にする
            //this.setCenter(e.latLng);
            //マップ上でクリックした箇所をゆっくりと中央箇所にする
            //this.panTo(e.latLng);
            //});
        }