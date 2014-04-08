#DKProgressHUD

Custom ActivityView for iOS (Spinner). 

##GIF demo

<p align="center"><img src="https://github.com/wzbozon/DKProgressHUD/blob/master/DKProgressHUD.gif?raw=true"></p>

##ScreenShot

<p align="center"><img src="https://github.com/wzbozon/DKProgressHUD/blob/master/Screenshot.png?raw=true"></p>

##Available to be added via CocoaPods
```
pod DKProgressHUD
```

##How to use

There is a sample project of a universal app for iPhone and iPad.

Very simple to use:
```
[DKProgressHUD showInView:self.view];

[DKProgressHUD hide];
```

You can set a color for hexagons in a DKProgressHUD, otherwise they will be randomly generated:
```
[DKProgressHUD setColor:COLOR_CUSTOM_LIGHT_BLUE];
```

###Supported iOS Versions 
It supports iOS 6.1 and higher. 

