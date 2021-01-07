# Trials of Trivia

An interactive CLI trivia game based on data pulled from a Jeopardy API, and our brains.

## Getting Started
Clone this project into your local machine and follow the instructions below.

### Installing
After cloning the project folder onto your local machine, continue to the next steps to run the game:

- Install the gems required for the guide: `bundle install`
- Seed the database with the questions provided (or of your own choosing) to run the app (this may take a while): `rake db:seed`
- To start the game, run the following command from your project folder in your terminal: `rake start`

** NOTE ** If you are running on a Linux/WSL machine, please refer to the troubleshooting/known issues section below.

### Adding custom questions/answers
- Adding your own questions is as simple as making a spreadsheet. 
- Create a spreadsheet, add columns for the category, the question, one column for each of the answers you would like to incorporate(putting the correct answer first will make things easier for yourself) and a column for difficulty(this game only uses easy,medium,hard). THen fill in your information
- Export the spreadsheet as a csv file
- Drop your new file into the seeds folder
- Replace the file path with that of your new file on line 76 of the seeds.rb file. Or copy the code from 76-114 and put your new file path in, if you wish to retain the questions.
- 


## API integrations

- [Final Jeopardy Questions/Scraper](https://jservice.io/api)


## Troubleshooting/Known Issues
- If you are on a Linux/WSL machine and experience difficulty with the seeding change the `SLEEP_TIME` on line 27 of the seeds.rb file to `0.1`. The seeding will take a long time dependant on the amount of questions being imported but it will work eventually. 
- Some Jeopardy API formatting causes questions to not show up and correct answers to not be accepted. 


