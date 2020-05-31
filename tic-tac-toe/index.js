const core = require('@actions/core');
const fs = require('fs');
const prompt = require('prompt-sync')();

const BOARD_PATH = './board.txt';
const EMPTY_BOARD = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

const readBoard = (path) => {
  const text = fs.readFileSync(path, 'utf8');
  return text.split("\n");
}

const writeBoard = (path, board) => {
  stringBoard = board.join('\n')
  fs.writeFileSync(path, stringBoard)
}

const lines = [
  // rows
  [1,2,3], [4,5,6], [7,8,9],
  // cols
  [1,4,7], [2,5,8], [3,6,9],
  // diags
  [1,5,9], [3,5,7]
]

const getWinner = (board) => {
  const winners = lines.map(line => {
    values = line.map(idx => board[idx-1])
    if (values.every(value => value === values[0])){
      return values[0];
    } else {
      return ''
    }
  })
  return winners.find(winner => (winner === 'x' || winner === 'o'));
}

const findEmptyCells = (board) => {
  return board.reduce((emptyIdxs, cell, idx) => {
    if (cell === ' '){
      emptyIdxs.push(idx);
    }
    return emptyIdxs;
  }, []);
}

const printBoard = (board) => {
  console.log('Current Board:')
  console.log(board.slice(0,3));
  console.log(board.slice(3,6));
  console.log(board.slice(6,9));
}

const isMoveValid = (board, row, col) => {
  const isOffBoard = (row < 0 || row > 2 || col < 0 || col > 2);
  idx = row * 3 + col
  if (isOffBoard || board[idx] != ' '){
    return false
  }
  else return true
}

const getMove = (board) => {
  const row = Number(prompt("Which row? (0-indexed): "))
  const col = Number(prompt("Which col? (0-indexed): "))
  if (isMoveValid(board, row, col)) {
    return idx
  }
  else {
    console.log('Invalid move... try again')
    return getMove(board)
  }
}

const getRandomAiMove = (board) => {
  const emptyCellIdxs = findEmptyCells(board);
  const randIdx = Math.floor(Math.random() * emptyCellIdxs.length);
  return emptyCellIdxs[randIdx];
}

const playHumanTurn = (player, board) => {
  const moveIdx = getMove(board);
  board[moveIdx] = player;
  return board;
}

const playAiTurn = (player, board) => {
  const moveIdx = getRandomAiMove(board);
  board[moveIdx] = player;
  return board;
}

const humanTurn = () => {
  const continueGame = prompt("Continue? (y/n, default: y): ", {value: 'y'})
  if (continueGame === 'y') {
    console.log('Continuing')
    board = readBoard(BOARD_PATH)
  }
  else if (continueGame === 'n') {
    console.log('Starting new game')
    board = EMPTY_BOARD;
  }
  else {
    console.log('Only y and n are allowed')
    main()
  }
  printBoard(board)
  let winner;
  winner = getWinner(board);
  if (winner) {
    console.log(`${winner} wins!`)
    return
  }
  // human is alway x...
  board = playHumanTurn('x', board)
  printBoard(board)
  winner = getWinner(board);
  if (winner) {
    console.log(`${winner} wins!`)
    return
  }
  writeBoard(BOARD_PATH, board)
  console.log('Turn complete. Please commit and push the updated board file.')
  console.log('Pull in ~30 seconds to get updated board for your next turn.')
}

const aiTurn = () => {
  const board = readBoard(BOARD_PATH);
  playAiTurn('o', board);
  writeBoard(BOARD_PATH, board);
}

const main = () => {
  const isAi = process.env.INPUT_IS_AI === 'true' || false;
  if (isAi) {
    aiTurn();
  }
  else {
    humanTurn();
  }
  return;
}

try{
  main();
} catch (error) {
  core.setFailed(error.message);
}
