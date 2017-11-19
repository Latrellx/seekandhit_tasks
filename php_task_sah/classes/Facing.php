<?php
	class Facing {
		const NORTH = 0;
		const EAST = 1;
		const SOUTH = 2;
		const WEST = 3;

		private static $enum = array(Facing::NORTH => 'NORTH', Facing::EAST => 'EAST', Facing::SOUTH => 'SOUTH', Facing::WEST => 'WEST');
	
		public static function toOrdinal($name) {
			return array_search($name, self::$enum);
		}

		public static function toString($ordinal) {
			return self::$enum[$ordinal];
		}
 	}
?>