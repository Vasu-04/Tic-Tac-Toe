import 'dart:io';
List board = List.generate(9,(int index)=>index+1);
List temp = [...board];
List winningcase = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
showBoard()
{
    for (int i=0;i<board.length;i++)
    {
      if((i+1)%3==0)
      {
        print(board[i]);
        print("---------------");
      }else{
        stdout.write("${board[i]}  |  ");
      }      
    }
}
playerTurn(choice,int pos)
{	
 temp.remove(pos);
    board[pos-1]=choice;
showBoard();
return checkwinners(choice);
}

cpuTurn(cpu_choice)
{
	print("******CPU TURN*********");
	temp.shuffle();
	int cpu_pos = temp[0];
	board[cpu_pos-1] = cpu_choice;
	temp.removeAt(0);
	showBoard();
  return checkwinners(cpu_choice);
}

checkwinners(choice)
{
  for(List wins in winningcase){
    if(board[wins[0]]==choice && board[wins[1]]==choice && board[wins[2]]==choice){
      print("$choice is winner");
      return "wins";
    }
    else if(temp.isEmpty == "True" ){
      return "Match is Draw";
    }
  }
}
void main()
{
   showBoard();
   int player_pos;
   String? player_choice,cpu_choice;
    print("Enter CHoice : X/0 =>");
    player_choice = stdin.readLineSync()!.toUpperCase();
    if(player_choice=="X")
    {
          cpu_choice = "0";
    }
    else{
      cpu_choice = "X";
    }
   while(true){
    print("Enter Player Pos : ");
    player_pos = int.parse(stdin.readLineSync()!);
    if(playerTurn(player_choice, player_pos) == "wins"){
      break;
    }
    if(cpuTurn(cpu_choice) == "wins"){
      break;
    }
   }
}
