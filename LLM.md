# Helpful Snippets
### One of the main uses I used ChatGPT for was to help me come up with a design palette and providing Hexadecimals so that I could easily implement it into the code. This is an example of one of the responses I was given when I was working with the chat on the color palette.
🎨 Blues + Purples Sporty Palette   
Here’s one direction we can take:   
Primary (Deep Blue): #0D1B2A → strong, sleek foundation (like midnight racetrack).   
Secondary (Vivid Purple): #6A0DAD → sporty + fun pop.   
Accent (Electric Blue): #1E90FF → energetic highlights for CTAs or new tags.   
Highlight (Magenta): #FF4DD2 → adds a fun, playful edge.   
Neutral (White): #FFFFFF → clean contrast for text.   
This gives you a sporty + modern + slightly futuristic palette, while keeping it approachable and energetic.   

### Another part where the chat was helpful was in trying to use the systemImages but not knowing what would be available to use. For example I asked: can you show me any that would be better for me to use with the year and the response I got was: 
📅 Calendar / Time   
"calendar"   
"calendar.circle" / "calendar.circle.fill"   
"calendar.badge.clock"   
"clock" / "clock.fill"   
These clearly say time/year and are probably the best choice.   

### One more area where this was helpful was to help me understand why part of my code was not working the way I was intending. I was attempting to implement the feature to allow users to edit their profile photo and it had seemed to work except once the user logged out and logged in. The profile photo would not save properly so I asked ChatGPT to explain to me why this was happening.
🔍 Why it resets   
Default avatar logic is always triggered   
Your view is probably showing Image(uiImage: user.profileImage ?? defaultImage). If profileImage isn’t being persisted, then after login, it’s nil, so the default shows again.   
Image data isn’t being saved   
Unlike String or Int, UIImage (or SwiftUI Image) can’t be directly stored in most persistence layers (like SwiftData, Core Data, or Firebase).   
If you’re using SwiftData/Core Data → you need to store the image as Data.   
If you’re using Firebase → you either store the image in Firebase Storage and keep a URL in your user record, or base64 encode it into your DB (not ideal for big images).   
User update logic might not include the image   
When you call your update function (e.g. session.updateUser(...)), make sure you’re passing the image data along with email/name.   

This chat and others similar were especially helpful to give me a full explaination so that I can understand what went wrong instead of just simply fixing it for me. Using descriptions like this allowed me to still try to fix it myself while having a better understanding of how to do so.
