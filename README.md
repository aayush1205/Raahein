<img src="images_git/RAAHEIN.png" align="right" width = 100>

# RAAHEIN: From en-route to EndRoute

<h2> Objective and Elaboration: </h2>
A cross-platform capable application designed to efficiently modernise the Indian Public Transit while keeping a hefty focus on Practicality and Convenience.

The problem spectrum RAAHEIN tackles is the lack of a modern, practical, and reliant Transit structure and the absolute negligence of this system as a consequence of these flaws.

RAAHEIN promises connectivity. With a stark focus on solving the Door-to-Door needs, RAAHEIN provides RIDE COMBOS--an intuitive idea which pitches booking combinations of public vehicle units to cover your long rides. A bright amalgamation of the features of Private and Public transportation. An Auto Rickshaw comes to pick you up, drops you off at the nearest Rail/Metro/Bus Station so that you can travel further. Another auto picks you up from the nearest station to your final destination and drops you off.

RAAHEIN promises practicality by being the least hindrance solution capitalizing every minute of the usage time by providing Incentives, clear-cut information services, Security, tracking solutions and convenience. Moreover, RAAHEIN makes no assumptions whatsoever about the technological, financial, educational, or climatic situation of India. It offers a package while not IMPOSING any technology onto the non-app, underequipped users, which by the way is the vast majority of the current Transit system. We offer a solution of scanning their Aadhar MetaData (which has no conflicts with user privacy whatsoever), thus not compromising with their comfort and at the same time, not compensating with our promise of security. Also, we are staying very far from hardware solutions like plastic cards or cameras because as of this very day, these technological advancements are exclusive to a minute fraction of cities in India; the rest is still a bit chaotic, unplanned and deprecated.

RAAHEIN offers extreme motivation. We cater heavily personalized "greed", as we call it, giving you reasons to ditch your private transport every single day. We are calling it RAAHEIN Daily. Notifications and Cards telling you how much would you save every day by ditching your Private Vehicles and personalized goals assigned with them. We are trying to capture the very subconscious of the user by reinforcing these ideas every single day. We save the environment, and well, never betray our user.

<h3> The Tech Stack </h3>

The engine's backend is being managed by Firebase and GCP. The entire frontend is Flutter and Flare. RazorPay is handling serverless transactions in the system. 

<h2> The Future and our closing thoughts: </h2>
Now, RAAHEIN was built while prioritizing Scalability at every step. We wanted an application that genuinely solves the problem and that we, as users, get to use it on a daily basis. We are students...or to say, developers with no resources in hand. That being said, we have solutions as to how can an industry implement our solution and capitalize revenue both for the company and the government, while not compromising on the user side comforts.

Our ideation started with a thought of giving the user a "similar ride free" for every few rides that he takes. For instance, 5 Kms free for every 25 you travel? Now, who would pay for this compensation? Government? Even after providing a heavily subsidised transit system?

Now, we have a better plan. Our application is so easy to use, we join in more and more users every day. More the number of users, more the data, and well data is the new oil. We bring in StakeHolders interested in our data to pay for these free rides. Services like Zomato who might benefit from knowing if a frequent travel place is important to certain individuals and suggest him better restaurants. Services which create heat maps among other geolocation services which need the population logistics might benefit from our data. The options are almost infinite--PayTm, Cred, Fast Food Chains etc. Moreover, if there comes a slightest doubt about security in any of your thoughts, let me tell you we access no payment details, no family details, no detail which we or anybody else could use against you. A simple tradeoff--fantastic recommender systems and services for the user, and great business for the joint industries.

[Here](https://www.youtube.com/watch?v=3A6ZbgSk44o&feature=youtu.be) is the application demo video.

(Also, just in case anyone wondered: H: Helping E: Enhance P: Public T: Transport A: And D: Dependency )

<h2> Instructions: </h2>

To run it on your local system:

1. You would need [flutter SDK](https://flutter.dev/docs/get-started/install) installed as well as the text editor of your choice. We use VSCode.
2. Once that is sorted you can clone this repository and get into "raahein final".
3. Now you will need to get into android>app>src>main>AndroidManifest.xml and replace our API key with yours.
4. You might also need to do a "flutter pub get" in the terminal to install the required dependencies on your system.
5. After this, connect your device to the system, and do a "flutter run -v". Flutter will handle the rest.
