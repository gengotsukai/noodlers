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

$(document).ready(function () {
  $("#theTarget").skippr({
      // スライドショーの変化 ("fade" or "slide")
      transition : 'slide',
      // 変化に係る時間(ミリ秒)
      speed : 1000,
      // easingの種類
      easing : 'easeOutQuart',
      // ナビゲーションの形("block" or "bubble")
      navType : 'block',
      // 子要素の種類("div" or "img")
      childrenElementType : 'div',
      // ナビゲーション矢印の表示(trueで表示)
      arrows : true,
      // スライドショーの自動再生(falseで自動再生なし)
      autoPlay : true,
      // 自動再生時のスライド切替間隔(ミリ秒)
      autoPlayDuration : 3000,
      // キーボードの矢印キーによるスライド送りの設定(trueで有効)
      keyboardOnAlways : true,
      // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
      hidePrevious : false
  });
});

 function initMap() {
            'use strict';

            var target = document.getElementById('target');
            var map;
            var tokyo = {lat: 35.681167, lng: 139.767052};
            var search_location;
            var service;
            //var infoWindow;
            //var marker;
            var geocoder = new google.maps.Geocoder();

            // Geolocation
            //ブラウザがgeolocationに対応しているかどうかの確認
                if (!navigator.geolocation) {
                    alert('Geolocation not supported');
                    return;
                }
                //位置情報を取得するための記述
                navigator.geolocation.getCurrentPosition(function(position) {
                    new google.maps.Map(target, {
                        center: {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                        },
                        zoom: 15
                    });
                }, function() {
                    alert('Geolocation failed!');
                    return;
                });

            //Geocoding: 住所を緯度・経度に変換する
                //searchをクリックしたときの処理
                document.getElementById('address_search').addEventListener('click', function() {
                    geocoder.geocode({
                        address: document.getElementById('address').value
                    }, function(results, status) {
                        if (status !== 'OK') {
                            alert('Failed: ' + status);
                            return;
                        }
                        // results[0].geometry.location
                        if (results[0]) {
                            search_location = results[0].geometry.location
                            map = new google.maps.Map(target, {
                                center: results[0].geometry.location,
                                zoom: 15
                            });
                       } else {
                            alert('No results found');
                            return;
                        }
                    });
                });

            //Reverse Geocoding　緯度・経度を住所に変換する
                 map = new google.maps.Map(target, {
                    center: {
                        lat: 35.681167,
                        lng: 139.767052
                    },
                    zoom: 15
                 });
                 map.addListener('click', function (e) {
                    geocoder.geocode({
                        location: e.latLng
                    }, function(results, status) {
                        if (status !== 'OK') {
                            alert('Failed: ' + status);
                            return;
                        }
                        // results[0].formatted_address
                        if (results[0]) {
                            new google.maps.Marker({
                                position: e.latLng,
                              map: map,
                                title: results[0].formatted_address,
                                animation: google.maps.Animation.DROP
                            });
                        } else {
                            alert('No results found');
                            return;
                        }
                    });
                 });

            //mapの表示の仕方の記述
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

            //Places APIの記述
                document.getElementById('facility_search').addEventListener('click', function() {
                    service = new google.maps.places.PlacesService(map);
                    service.nearbySearch({
                        location: search_location,
                        radius: '500',
                        name: document.getElementById('keyword').value
                    }, function(results, status) {
                        //loop用の変数
                        var i;
                        if (status === google.maps.places.PlacesServiceStatus.OK) {
                           for (i = 0; i < results.length; i++) {
                                new google.maps.Marker({
                                    map: map,
                                    position: results[i].geometry.location,
                                    title: results[i].name
                                });
                            }
                        } else {
                            alert('Failed: ' + status);
                            return;
                        }
                    });
                });


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