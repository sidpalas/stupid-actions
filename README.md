# Stupid Actions

This repo contains stupid GitHub actions. They are:

  - [Holiday Reminder](#holiday-reminder)
  - [Recursive Action](#recursive-action)
  - [Exponential Action](#exponential-action)
  - [Turning on Smart Lights with Each Commit](#turning-on-smart-lights-with-each-commit)
  - [World's Worst Tic-Tac-Toe UX](#worlds-worst-tic-tac-toe-ux)
  - [INSERT YOUR IDEA HERE](#insert-your-idea-here)

## Holiday Reminder

By using a cron schedule string and the fact that a failed job sends an email, we can make a holiday reminder email.

We can even make sure to include specific text by naming our workflow and jobs with the desired info!

---

## Recursive Action

By creating a commit and pushing it within an action triggered `on push` this would be trivial, except that GitHub specifically prevents commits made by the default repo token from triggering new workflows.

To get around this, we use a Personal Access Token to perform the git commands and to prevent the chain from continuing forever we increment a counter file in the repo.

---

## Exponential Action

Creating infinite actions using the `Recursive Action` above was fun... but how can we do it faster?!

This action triggers N new workflows with each run. We cant use the same file counter trick to contain the process because of issues with the workflows trying to make simultaneous commits, so we move the counters into tags!

---

## Turning on Smart Lights with Each Commit

With some smart plugs and a python API client we can configure an action to turn our lights on for some period of time.

This is the ultimate way to incentivize code velocity... we need to commit new code every N minutes to keep the lights on!

---

## World's Worst Tic-Tac-Toe UX

The game Tic-Tac-Toe where you play a turn, commit the resulting board, wait for the AI to play its turn (within a GitHub action), and then play your next turn...

To play run:
`node ./tic-tac-toe/index.js`

---

## INSERT YOUR IDEA HERE

Add an issue with your idea for a stupid action (or even better make a pull request!)
