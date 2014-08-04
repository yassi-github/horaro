<?php
/*
 * Copyright (c) 2014, Sgt. Kabukiman, https://bitbucket.org/sgt-kabukiman/
 *
 * This file is released under the terms of the MIT license. You can find the
 * complete text in the attached LICENSE file or online at:
 *
 * http://www.opensource.org/licenses/mit-license.php
 */

namespace horaro\WebApp\Validator;

class BaseValidator {
	protected $result;

	protected function addError($field, $message) {
		$this->result['_errors'] = true;
		$this->result[$field]['errors'] = true;
		$this->result[$field]['messages'][] = $message;
	}

	protected function setFilteredValue($field, $value) {
		$this->result[$field]['filtered'] = $value;

		if (!isset($this->result[$field]['errors'])) {
			$this->result[$field]['errors'] = false;
			$this->result[$field]['messages'] = [];
		}
	}
}
