# skate-life (Back-End)
totally sweet skate app
Link for Back-End repo here.

## Team Members
- Chris "Swag Daddy Supreme" Scott
- Shahab "Shabaz" Amin
- Ian "Banner" Harris
- Harvey "F'in Toad" Ngo

## Git Workflow 
# Separate branch for each feature!
- git status
-- Make sure you recognize each file
- git add --patch
-- Make sure you made each change! fercereals (list lines, too)
- git commit 
-- BE descriptive, VERY f'in descriptive
- git co master
- git pull
- git co <branchname>
- git push origin <branch>
- Put in pull request
-- AND THEN GET A TEAMMATE TO VALIDATE AND MERGE ASAP

## Rails API routes
- GET   /api/skateparks
- GET   /api/skateparks/:id
- GET   /api/users
- POST  /api/users
- GET /api/users/:id
- DELETE /api/users/:id
- GET /api/users/:id/favorites
- POST /api/users/:user_id/favorites/:skatepark_id