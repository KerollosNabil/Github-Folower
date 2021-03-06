# Github Follower (from Sellen course)

## discreption

this app asks you for a GitHub username and gives you back a list of your GitHub followers and you can see everyone's public information and handling all the error cases with a good looking customized alert and empty view and will food in landscape and portrait mode and will look identical in every device

## my art on the app

* ### create <ins>**AutoLayoutHelper**</ins> framework that is used to make a <ins>**hardcoded**</ins> the constraints for autolayout and it will look <ins>**identical**</ins> in all the devices and it handles the <ins>**rotation**</ins> and the <ins>**size classes**</ins> for you  

#### this code to layout any view in portrait and landscape for all devices

```swift
layoutHelper.attatchScaledToWidth(anchor: itemViewOne.topAnchor, to: headerInfoView.bottomAnchor, constant: padding, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: itemViewOne.leadingAnchor, to: view.leadingAnchor, constant: padding, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: itemViewOne.trailingAnchor, to: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.addScaledToWidth(dimension: itemViewOne.heightAnchor, equalconstant: 145, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        
        // landscape
        
        layoutHelper.attatchScaledToHeight(anchor: itemViewOne.bottomAnchor, to: view.centerYAnchor, constant: -padding/2, for: [.CompactCompact, .RegularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: itemViewOne.leadingAnchor, to: view.centerXAnchor, constant: padding, for: [.CompactCompact, .RegularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: itemViewOne.trailingAnchor, to: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding, for: [.CompactCompact, .RegularCompact], designOrientationIsPortrait: false)
        layoutHelper.addScaledToHeight(dimension: itemViewOne.heightAnchor, equalconstant: 140, for: [.CompactCompact, .RegularCompact], designOrientationIsPortrait: false)
```

new ratio in landscape                  |  new ratio in portrait    |  old ratio in portrait    |  old ratio in landscape
:------------------------------:|:---------------------------------:|:------------------------------:|:---------------------------------:
<img src="screenShots/1a.png"/> | <img src="screenShots/1.png"/>   | <img src="screenShots/1s.png"/> | <img src="screenShots/1sa.png"/>
<img src="screenShots/2a.png"/> | <img src="screenShots/2.png"/>   | <img src="screenShots/2s.png"/> | <img src="screenShots/2sa.png"/>
<img src="screenShots/3a.png"/> | <img src="screenShots/3.png"/>   | <img src="screenShots/3s.png"/> | <img src="screenShots/3sa.png"/>
<img src="screenShots/4a.png"/> | <img src="screenShots/4.png"/>   | <img src="screenShots/4s.png"/> | <img src="screenShots/4sa.png"/>

* ### make extentions to adjust the font to fit inside the label

```swift
override func layoutSubviews() {
    super.layoutSubviews()
    if numberOfLines > 0 {
        fitText(maxLines: UInt(numberOfLines))
    }else{
        fitTextToBounds()
    }
}
```
like the usernames in the labels in the followers list

<img src="screenShots/3.png" width=200/>

* ### make super customizable generic alert that can customize literally anything 
    * generic labels for the title and the body 
    * add any type of buttons
    * customize the colors and the sizes of the alert elemets
### small example 
```swift
func presentGFAlertOnMainThread(title:String, message:String, buttontitle:String){
    DispatchQueue.main.async {
        let alertVC = AlertVC<TitleLabel, BodyLabel>(title: title, message: message)
        let button = RoundedButton(backgroungColor: .systemPink, title: buttontitle)
        alertVC.addButton(button: button, action: nil, target: nil)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.backgroundColor = .black
        alertVC.adjustBodyFontToFit = false
        self.present(alertVC, animated: true)
    }
    
}
```
<img src="screenShots/alert.png" width=200/>

## Simple Demo
<img src="screenShots/demo.gif" width=200/>

