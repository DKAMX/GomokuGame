/*
 Gomoku game
 Code written by DKAMX
 Running under Processing environment
 */

color black = color(0, 0, 0);
color white = color(255, 255, 255);
color yellow = #FBF4C6; //buff yellow
color[][] board = new color[10][10]; //chessboard
int[] curr_coor = new int[2];
boolean isBlack = true;

void setup() {
  size(960, 720);
  background(yellow);
  textSize(20);
}

void draw() {
  clear();
  background(yellow);
  fill(black);
  stroke(black);

  //draw the chessboard
  for (int i = 0; i <= board.length; i++) {
    //horizontal line
    line(230, i * 50 + 110, 730, i * 50 + 110);
    //vertical line
    line(i * 50 + 230, 110, i * 50 + 230, 610);
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

void mouseReleased() {
  if (mouseX >= 230 && mouseX <= 730 && mouseY >= 110 && mouseY <= 610) {
    curr_coor[0] = round((mouseX - 230) / 50);
    curr_coor[1] = round((mouseY - 110) / 50);
    if (isBlack) {
      board[curr_coor[0]][curr_coor[1]] = black;
      isBlack = false;
    } else {
      board[curr_coor[0]][curr_coor[1]] = white;
      isBlack = true;
    }
  }
}
