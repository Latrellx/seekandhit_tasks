<?php
	
	class Position {

		public $x;
		public $y;
		public $facing;

		public function __construct($x, $y, $facing) {
			if(!is_numeric($x) || !is_numeric($y) || !is_numeric($facing)) {
				throw new Exception('Position parameters are wrong');
			}
			$this->x = (int)$x;
			$this->y = (int)$y;
			$this->facing = $facing;
		}
	}
?>