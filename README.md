## PoE Region Selector 1.2.6

This is a AutoHotKey script that helps you quickly find maps with a single click on the button of the desired region.

![picture alt](https://i.imgur.com/CMUn4mB.png)

* This is my relatively pretty modification of the original script of Fall (https://www.reddit.com/user/FallMakesHideouts/): https://www.reddit.com/r/pathofexile/comments/fbdeqj/poe_region_searcher_overlay_110_sort_your_maps_by/.

* This version uses compact icons, transparency background, the ability to move the entire interface whatever you want, change or remove at all the title, ability to change transparence.

* Also completely removed the original functions of tracking influences and watchstones.

## Features from the original script are still there:
* Click on the icon with region name to search your maps by region. Works in any stash tab with a search bar. (Make sure your stash is open when you do this or nothing will happen) .
* Show/Hide overlay by pressing F2
* Move the icons wherever you want and save position for next time you open/reload the macro. Show and hide interface by pressing F2 once to save the current position.

## But it have some other changes:
* "Always on top" now work only in Path of Exile window.
* Fully transparent background.
* Options for change Title and transparence.
* Correct work in Windows systems with any keyboard layouts.
... and ofc you can customize the hotkey, title and transparency in Settings.ini 

## How To Use:
* Install AHK https://www.autohotkey.com/
* Put all files in your prefered path.
* Open Region Selector 1.2.6.ahk

## Credits:
* _AHK-just-me_ for Class_ImageButton - https://github.com/AHK-just-me/Class_ImageButton/
* _Fall_ for original script PoE Region Searcher Overlay 1.1.0 and images - https://www.reddit.com/r/pathofexile/comments/fbdeqj/poe_region_searcher_overlay_110_sort_your_maps_by/.

## It will be great to add the following options:
* Track of conqueror influences in region by changing color tones of icons.
* Track number of stones affecting the region/received in the region (needs to think about the right solution).
Only this is not possible, since I completely do not know how to implement it.

## Known problems:
* When the keyboard layout other than English is enabled in the Windows, pressing the search buttons for the regions can enter letters in different registers. Usually this does not create problems, since the search still works.
* AHK code not fully cleared in some strings. I could not completely remove the code from the original release because the options of writing and reading the window position in the Options.ini file always was broken. So far it has not been possible to fix it for me.
* AHK cannot fully correct show transparent PNG-16 images. That's why cross in move icon at the right from buttons not enough smoothest.

