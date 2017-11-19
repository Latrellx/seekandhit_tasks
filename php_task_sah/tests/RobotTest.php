<?php

	require './vendor/autoload.php';
	require_once 'classes/Field.php';
	require_once 'classes/Robot.php';
	require_once 'classes/Position.php';

	class RobotTest extends PHPUnit_Framework_TestCase {

		private $field;

		// There are only few examples to show how to write UnitTests 

		public function setup() {
			$this->field = new Field(5,5);
		}

		public function testValidInitPosition() {
			$robot = new Robot(new Position(1,1, Facing::NORTH));
			$this->assertEquals($this->field->checkPosition($robot->position), true);			
		}

		public function testInvalidInitPosition() {
			$robot = new Robot(new Position(-1,-1, Facing::NORTH));
			$this->assertEquals($this->field->checkPosition($robot->position), false);
		}

		public function testInvalidNorthRobotMovement() {			
			$robot = new Robot(new Position(0,5, Facing::NORTH));
			$robot->move();
			$this->assertEquals($this->field->checkPosition($robot->nextPosition), false);
		}

		public function testValidNorthRobotMovement() {			
			$robot = new Robot(new Position(1,2, Facing::NORTH));
			$robot->move();
			$this->assertEquals($this->field->checkPosition($robot->nextPosition), true);
		}

		public function testInvalidSouthRobotMovement() {			
			$robot = new Robot(new Position(0,0, Facing::SOUTH));
			$robot->move();
			$this->assertEquals($this->field->checkPosition($robot->nextPosition), false);
		}

		public function testValidSouthRobotMovement() {			
			$robot = new Robot(new Position(2,4, Facing::SOUTH));
			$robot->move();
			$this->assertEquals($this->field->checkPosition($robot->nextPosition), true);
		}

		public function testInvalidEastRobotMovement() {
			$robot = new Robot(new Position(5,0, Facing::EAST));
			$robot->move();
			$this->assertEquals($this->field->checkPosition($robot->nextPosition), false);
		}

		public function testValidEastRobotMovement() {
			$robot = new Robot(new Position(3,2, Facing::EAST));
			$robot->move();
			$this->assertEquals($this->field->checkPosition($robot->nextPosition), true);
		}

		public function testInvalidWestRobotMovement() {			
			$robot = new Robot(new Position(0,0, Facing::WEST));
			$robot->move();
			$this->assertEquals($this->field->checkPosition($robot->nextPosition), false);
		}

		public function testValidWestRobotMovement() {			
			$robot = new Robot(new Position(4,4, Facing::WEST));
			$robot->move();
			$this->assertEquals($this->field->checkPosition($robot->nextPosition), true);
		}

		public function testRotateLeft() {			
			$robot = new Robot(new Position(0,0, Facing::NORTH));
			$robot->rotateLeft();
			$this->assertEquals($robot->report(), 'Current position X : 0 and Y : 0 WEST');
			$robot->rotateLeft();
			$this->assertEquals($robot->report(), 'Current position X : 0 and Y : 0 SOUTH');
			$robot->rotateLeft();
			$this->assertEquals($robot->report(), 'Current position X : 0 and Y : 0 EAST');
			$robot->rotateLeft();
			$this->assertEquals($robot->report(), 'Current position X : 0 and Y : 0 NORTH');
		}

		public function testRotateRight() {			
			$robot = new Robot(new Position(0,0, Facing::NORTH));
			$robot->rotateRight();
			$this->assertEquals($robot->report(), 'Current position X : 0 and Y : 0 EAST');
			$robot->rotateRight();
			$this->assertEquals($robot->report(), 'Current position X : 0 and Y : 0 SOUTH');
			$robot->rotateRight();
			$this->assertEquals($robot->report(), 'Current position X : 0 and Y : 0 WEST');
			$robot->rotateRight();
			$this->assertEquals($robot->report(), 'Current position X : 0 and Y : 0 NORTH');
		}		
	}
?>