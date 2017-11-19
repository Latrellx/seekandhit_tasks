<?php
	// require_once 'init.php';
	
	require_once 'Field.php';
	require_once 'Position.php';
	require_once 'Facing.php';

	class Robot { 

		public $nextPosition;
		public $position;
		private $classname = 'Robot';
		private $facings = array(
				Facing::NORTH => 'setNorthPosition', 
				Facing::EAST => 'setEastPosition', 
				Facing::SOUTH => 'setSouthPosition', 
				Facing::WEST => 'setWestPosition'
			);

		public function __construct($position) {
			$this->position = $position;
		}

		public function move() {
		 	call_user_func($this->classname . '::' . $this->facings[$this->position->facing]);
		}

		private function setNorthPosition() {
			$this->nextPosition = new Position($this->position->x, $this->position->y + 1, $this->position->facing);
		}

		private function setSouthPosition() {
			$this->nextPosition = new Position($this->position->x, $this->position->y - 1, $this->position->facing);
		}

		private function setWestPosition() {
			$this->nextPosition = new Position($this->position->x - 1, $this->position->y, $this->position->facing);
		}

		private function setEastPosition() {
			$this->nextPosition = new Position($this->position->x + 1, $this->position->y, $this->position->facing);
		}

		// This function is checking if value of facing incremented by one is greater than facing array		

		public function rotateRight() {
			if(++$this->position->facing > Facing::WEST) {
				$this->position->facing = Facing::NORTH;
			}
		}

		// This function is checking if value of facing decremented by one is greater than facing array	

		public function rotateLeft() {
			if(--$this->position->facing < Facing::NORTH) {				
				$this->position->facing = Facing::WEST;
			}
		}

		public function successfullMove() {
			$this->position = $this->nextPosition;
		}

		public function report() {
			return 'Current position X : ' . $this->position->x . ' and Y : ' . $this->position->y . ' ' . Facing::toString($this->position->facing);			
		}

	}
?>