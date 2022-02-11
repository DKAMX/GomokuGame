/*
 Gomoku game
 Code written by DKAMX
 Running under Processing environment
 */

color test;
color black = color(0, 0, 0);
color white = color(255, 255, 255);
color yellow = #FBF4C6; //buff yellow
color[][] board;        //chessboard
color[][] history_board;
int[] curr_coor;        //current coordinate
boolean isBlack;

void setup() {
  size(960, 720);
  background(yellow);
  textSize(20);
  board = new color[10][10];
  history_board = new color[10][10];
  curr_coor = new int[2];
  isBlack = true;
}

void draw() {
  clear();
  background(yellow);
  fill(black);
  stroke(black);

  //draw the chessboard
  for (int i = 0; i <= board.length + 1; i++) {
    line(205, i * 50 + 85, 755, i * 50 + 85);  //horizontal line
    line(i * 50 + 205, 85, i * 50 + 205, 635); //vertical line
  }

  //draw the chess pices
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      color curr_color = board[i][j];
      if (curr_color == black || curr_color == white) {
        fill(curr_color);
        circle(i * 50 + 230 + 25, j * 50 + 110 + 25, 45);
      }
    }
  }
  previewStep();

  //output info
  fill(black);
  //text("X:" + curr_coor[0], 50, 50);
  //text("Y:" + curr_coor[1], 100, 50);
  if (isBlack) {
    text("Turn: Black", 50, 50);
  } else {
    text("Turn: White", 50, 50);
  }
}

void previewStep() {
  if (mouseX >= 230 && mouseX < 730 && mouseY >= 110 && mouseY < 610) {
    int x_coor = round((mouseX - 230) / 50);
    int y_coor = round((mouseY - 110) / 50);

    //draw a half-transparent circle
    noFill();
    stroke(0, 128);
    circle(x_coor * 50 + 230 + 25, y_coor * 50 + 110 + 25, 45);
  }
}

void mouseReleased() {
  // conditon "<=" will throw Exception in coor calculation
  if (mouseX >= 230 && mouseX < 730 && mouseY >= 110 && mouseY < 610) {
    //calculate new coordinate
    curr_coor[0] = round((mouseX - 230) / 50);
    curr_coor[1] = round((mouseY - 110) / 50);

    //check if there is already a chess in this position
    color checker = board[curr_coor[0]][curr_coor[1]];
    if (checker != 0) {
      return;
    }

    //push previous chess into history
    history_board = board;

    //switching turn after every mouseRelease
    if (isBlack) {
      //set specific coor color
      board[curr_coor[0]][curr_coor[1]] = black;
      isBlack = false;
    } else {
      board[curr_coor[0]][curr_coor[1]] = white;
      isBlack = true;
    }
  }
}

void keyReleased() {
  if (key == 'z' || key == 'Z') {
  }
  //restart a new game
  if (key == 'n' || key == 'N') {
    setup();
  }
}
