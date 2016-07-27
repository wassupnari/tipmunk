# Pre-work - *Tipmunk*

**Tipmunk** is a tip calculator application for iOS.

Submitted by: **Nari Shin**

Time spent: **8.5** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

(still working on adding more features)

The following **additional** features are implemented:

- [x] Customize tip percentage

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://media.giphy.com/media/l0HlIVOds7xfRZ4aY/giphy.gif' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

- After I added SettingsViewController and UI components, ctrl+drag didn't work from the StoryBoard. It took some time to figure out that my xib file had different class name of newly added viewController. I changed the name of viewController to SettingsViewController, and it worked like a charm!
- I want to let user to customize the tip percentage and that was the first additional feature that I worked on. It works as I intended, but it would be great if I can append "%" at the end of percentages, and has a validation that it doesn't exceed 100. I'll keep working on this.
- Currently I have a simple fade in and fade out animation, but I'd like to combine it with expand+collapse animation.
- From an Android developer's perspective, Xcode seems to have very powerful GUI tools that make building UI, adding callbacks, or navigating multiple controllers super easy compared to Android Studio. I still instinctually want to see the xml code instead of interface builder, but I'll become used to it. Very curious about building networking layer with Swift on iOS platform, and hope I get accepted for this class!

## License

    Copyright [2016] [Nari Shin]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
