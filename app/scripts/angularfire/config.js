angular.module('firebase.config', [])
    .constant('FBURL', 'https://racebase.firebaseio.com')
    .constant('SIMPLE_LOGIN_PROVIDERS', ['password', 'facebook', 'google', 'github'])
    .constant('loginRedirectPath', '/login');