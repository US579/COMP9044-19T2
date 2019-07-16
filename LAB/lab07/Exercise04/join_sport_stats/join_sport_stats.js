function makeTeamList(teamData, namesData, teamsData) {
    // Take it step by step.
    const coachname = teamData['team']['coach'];
    console.log(coachname);
    const teamid = teamData['team']['id'];
    var Pid = [];
  
	for (var i in Object(teamData)) {
		if ( i === 'players'){
			for (var j = teamData[i].length - 1; j >= 0; j--) {
				for (var key in teamData[i][j]){
					if (key === 'id'){
						Pid.push(teamData[i][j][key]);
					}	
				}	
			}
		}
	}

	for(var i in Object(teamsData)){
		if (teamsData[i]['id'] === teamid ){
			var name = teamsData[i]['team'];
			break;
		}

	}

	var result = [];
	result.push( name +  ', coached by '+ coachname);
	var cout = 1;
	for (var k in Pid){
		for (var i in Object(namesData)){

			if (namesData[i]['id'] === Pid[k] ){
				result.push(cout + ". " + namesData[i]['name']);
				cout++;
				}
		}
	}
	return result;
}

const teamJson = process.argv[2];
const namesJson = process.argv[3];
const teamsJson = process.argv[4];
if (teamJson === undefined || namesJson === undefined || teamsJson === undefined) {
  throw new Error(`input not supplied`);
}

// some sample data
const team  = require(`./${teamJson}`);
const names  = require(`./${namesJson}`);
const teams  = require(`./${teamsJson}`);
console.log(team);
console.log(names);
console.log(teams);
console.log(makeTeamList(team, names.names, teams.teams));