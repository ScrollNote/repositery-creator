#!/bin/bash
# Make executable with chmod +x create_repo.sh
clear

USERNAME="" # Put your username inside the ""
PASSWORD="" # Put your password inside the ""
TOKEN="" # Put your token inside the ""

# Step 1 -> If there is a space in your name put a hyphens(_)
printf "What is the name of your repositery : "
read REPO_NAME

printf "What description do you wanna put on your repositery : "
read DESCRIPTION

# Step 2 -> Create the repositery and set the description online 
curl -u $USERNAME:$TOKEN https://api.github.com/user/repos -d '{"name":"'"$REPO_NAME"'","description":"'"$DESCRIPTION"'","private":true}'

# Step 3 -> The path of your local project
printf "What is the absolute path to your local project directory : "
read PROJECT_PATH

# Step 4 -> Switch to this path
cd "$PROJECT_PATH"

# Step 5 -> Initialise the repositery locally, create a README.md, add, commit and make a new branch (main)
git init
printf "README.md" > README.md
git add README.md
git commit -m 'Add README.md'
git branch -M main

#  Step 6 -> Add the remote Github repositery to your local repositery and push
git remote add origin https://$USERNAME:$PASSWORD@github.com/$USERNAME/$REPO_NAME.git
git push -u origin main

# Step 7 -> End! :)
printf "\nDone. Go to https://github.com/$USERNAME/$REPO_NAME to see."