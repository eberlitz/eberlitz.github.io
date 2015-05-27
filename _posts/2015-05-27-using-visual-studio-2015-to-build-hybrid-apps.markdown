---
layout: post
comments: true
title:  "Using Visual Studio 2015 to build hybrid apps"
excerpt: "This walk through will show you how to use Visual Studio 2015 with the Tools for Apache Cordova to create hybrid mobile applications."
date:   2015-05-27 17:04:00
mathjax: false
published:   true
---

Using Visual Studio 2015 to build hybrid apps
================================================================

This walk through will show you how to use Visual Studio 2015 with the Tools for Apache Cordova to create hybrid mobile applications.

Prerequisites
-------------

First you should have installed the following software.

- [Visual Studio 2015](https://www.visualstudio.com/en-us/downloads/visual-studio-2015-downloads-vs)
- Visual Studio Tools for Apache Cordova. *You should select this feature in the Visual Studio 2015 installer*.

Creating the project
--------------------

In Visual Studio, open the **New Project** dialog box and under **Templates**, choose **JavaScript, Apache Cordova Apps**. Then choose the **Blank App** template. Give the app a name and then choose **OK**.

![New Cordova Project](http://eberlitz.github.io/assets/using-visual-studio-2015-to-build-hybrid-apps/new_cordova_project.jpg)

Your solution should now look like the one below:

![New Cordova Project Structure](http://eberlitz.github.io/assets/using-visual-studio-2015-to-build-hybrid-apps/new_cordova_project_struct.jpg)

---

Understanding the project structure
-----------------------------------

The new Cordova project includes four top-level folders:

- **merges** is used to add platform-specific code.
- **plugins** is used for Apache Cordova plugins that provide access to native device features.
- **res** is used for platform-specific visual assets (icons and splash screens).
- **www** folder, which is used for your app code.
    - **css** contains basic CSS style sheets that are included with the blank template.
    - **images** is the suggested location for images for your app.
    - **scripts** is the default location for all JavaScript files.
    
In addition to CSS and JavaScript files, the new project also includes several more files:

- **config.xml** contains configuration settings for your app. 
- **taco.json** stores project metadata that enables Visual Studio to build on non-Windows operating systems like a Mac.
- **www\index.html** is the default home screen for your app.
- **Project_Readme.html** contains links to useful information.

---

Editing config.xml
------------------

Another place you’re going to want to make some changes is the basic properties of your application. For an Apache Cordova app, these settings are in the `config.xml` file at the root level of your project. Notice that if you open this file from **Solution Explorer** in the configuration designer, you will be able to edit the file using an interface, or you can edit it directly by selecting **View Code** from the shortcut menu for the file.


![Config.xml File](http://eberlitz.github.io/assets/using-visual-studio-2015-to-build-hybrid-apps/config.jpg)


You could even include Custom Plugins using git or local code:

![Custom Plugin](http://eberlitz.github.io/assets/using-visual-studio-2015-to-build-hybrid-apps/custom-plugin.png)

---

Dealing with platform diferences
--------------------------------

When building an Cordova App the www folder will be overwritten with the merges folder for the specific platform you are building for. By default, the **Blank App template** includes commonly used platform-specific code for **Windows and Android** devices in the **merges** folder.

The **index.html** file includes the following reference `<script src="scripts/platformOverrides.js"></script>`. The **platformOverrides.js** file will be overwritten when building to use the corresponding one from the merges folder.

By default the following platform specifics will be handled:

- For Android devices, a .js file is included to provide support for the JavaScript **Function.prototype.bind()** function on Android 2.3 devices.
- For Windows and Windows Phone 8.1, a winstore-jscompat.js file is included in the **merges\windows** folder to enable support for a variety of JavaScript libraries. For more information, see the JavaScript Dynamic Content shim for Windows Store apps project site.

---

Building and Debugging to different platforms
---------------------------------------------

To build and debug the application just select the platform and click in the "play" button.

![Run](http://eberlitz.github.io/assets/using-visual-studio-2015-to-build-hybrid-apps/run.png)

If you place a breakpoint in a javascript file. The VS will stop so you can debug your code.

![Debug](http://eberlitz.github.io/assets/using-visual-studio-2015-to-build-hybrid-apps/debug.png)

To build and debug for iOS you'll need to configure a Remote Agent under **Tools, Options, Tools For Apache Cordova**, like this:

![Remote iOS Angent Config](http://eberlitz.github.io/assets/using-visual-studio-2015-to-build-hybrid-apps/remote-config.jpg)

You can find information on how to setup this environment [here](https://msdn.microsoft.com/library/dn757054.aspx#ios) and [here](https://msdn.microsoft.com/en-us/library/dn757056.aspx)

---

References
===========

- [Getting Started with Visual Studio Tools for Apache Cordova](https://msdn.microsoft.com/en-us/library/dn771545.aspx)