<?php

	require_once 'Position.php';

	class Field {
		
		public $x;
		public $y;

		public function __construct($x, $y) {
			if(!is_numeric($x) || !is_numeric($y) || ($x != $y)) {
				throw new Exception('Invalid field initialization');
			}
			
			$this->x = $x;
			$this->y = $y;			
		}		

		public function checkPosition(Position $position) {
			return !($position->x > $this->x || $position->x < 0 || $position->y > $this->y || $position->y < 0);
		}
	}


?>