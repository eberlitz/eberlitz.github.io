---
layout: post
comments: true
title:  "Creating a starter project for mobile apps"
excerpt: ""
date:   2015-01-01 18:00:00
published:   true
---

# Intro

TODO

-------------------------------------------------------------------------------

# Login with various OAuth providers (facebook, google, others ...)

Include the **InAppBrowser** plugin into your `config.xml`

```xml
<gap:plugin name="org.apache.cordova.inappbrowser" source="plugins.cordova.io" />
```

Install **ngCordova**:

    bower install --save ngCordova

Add the js file to your gulp scripts task in the `gulpfile.js`

```javascript
gulp.task('scripts', function() {
    return gulp.src([
            // ...
            './lib/ngCordova/dist/ng-cordova.js',
            // ...
        ])
        // ...
        .pipe(gulp.dest(distPath));
});
```

include in your Angular Application:

```javascript
angular.module('myapp',[
    'ionic',
    'ngCordova'
])
```


Step 1: Create a Facebook application

1. Login to Facebook
2. Access https://developers.facebook.com/apps, and click Create New App
3. Select the web app
3. Specify a unique Display Name and a Category, and click Create App
4. Click Settings in the left navigation
5. Click the Advanced Tab
6. In the Security section, add the following URL `http://localhost/callback` in the Valid OAuth Redirect URIs field
7. Click Save Changes





-------------------------------------------------------------------------------

# Building with Phonegap Build

For building to the platforms we will be using the Phonegap build service. So goto https://build.phonegap.com/ and Sign In.

Our building will use Gulp to zip the project and send it to the Phonegap building service, so to configure this in the gulp file we will need the Phonegap Application ID. So in order to get this information we need to create an app int the PhonegapBuild.

1. Create a .zip of the app folder;
2. Goto the https://build.phonegap.com/ and click in the `+ new app` button.
3. Select private app and upload your zip file.
4. Click in the `Ready to build` button and then copy the `App ID`.

Add the folowing task to your `Gulpfile.js`:

```javascript
var phonegapBuild = require('gulp-phonegap-build');
gulp.task('phonegap-build', function() {
    return gulp.src('./dist/**/*')
        .pipe(phonegapBuild({
            "appId": "YOUR_APP_ID_HERE",
            "user": {
                "token": "YOUR_AUTH_TOKEN_HERE"
            },
            // keys: {
            //  ios: {
            //      "password": "foobar"
            //  },
            //  android: {
            //      "key_pw": "foobar",
            //      "keystore_pw": "foobar"
            //  }
            // },
            // download: {
            //      ios: 'dist/ios.ipa',
            //      android: 'dist/android.apk'
            //      winphone: 'dist/winphone.xap'
            // }
        }));
});
```

Replace your **appID** and your **authentication Token** in the indicated place. In order to get your authentication Token go to your account info on the Phonegap Build an go to **Client applications**, in the end of the page you will find the token.

You also need to install the gulp plugin `gulp-phonegap-build`. For more info about this see https://www.npmjs.com/package/gulp-phonegap-build

    npm install --save-dev gulp-phonegap-build

After this you should be apple to build your application with the following command:

    gulp phonegap-build


