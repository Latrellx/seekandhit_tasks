<?php 

	require_once 'classes/Field.php';
	require_once 'classes/Position.php';
	require_once 'classes/Facing.php';
	require_once 'classes/Robot.php';

	$field;	
	$robot;
	$input = 'PLACE 0,0,NORTH MOVE REPORT PLACE 0,0,NORTH LEFT REPORT PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT';
	$array = explode(' ', $input);
	$index = 0;
	foreach ($array as $item) {			
		if($item == 'PLACE') {
			try {
				$params = explode(',', $array[$index + 1]);
				if(sizeof($params) != 3) {
					throw new Exception('Not a valid input command (x, y, facing)');
				}
				$field = new Field(5,5);
				$position = new Position($params[0], $params[1], Facing::toOrdinal($params[2]));			
				$robot = new Robot($position);
				if(!$field->checkPosition($robot->position)){
					$robot = null;
					throw new Exception('Not a valid robot placement');
				}
			} catch (Exception $ex){
				echo $ex->getMessage() . '<br>';
			}
		} 
		if(isset($robot)){
			if($item == 'MOVE') {
				$robot->move();
				if($field->checkPosition($robot->nextPosition)) {
					$robot->successfullMove();
				}
			} elseif($item == 'REPORT') {
				echo $robot->report() . '<br>';
			} elseif($item == 'LEFT') {
				$robot->rotateLeft();
			} elseif($item == 'RIGHT') {
				$robot->rotateRight();
			}
		}		
		$index ++;
	}